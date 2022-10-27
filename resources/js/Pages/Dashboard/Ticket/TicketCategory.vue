<template>
    <app-layout>
        <bread-crumbs name="Categoría de tickets" :items="items"></bread-crumbs>
        <v-container class="py-12">
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-card-text class="">
                            <v-row class=" no-gutters">
                                <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                    <v-btn
                                        @click="isOpen = !isOpen"
                                        class="mr-3 success">
                                        <v-icon class="notranslate mr-2">
                                            mdi-plus
                                        </v-icon>
                                        Crear
                                    </v-btn>
                                </div>

                                <v-spacer></v-spacer>

                                <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                    <v-text-field hide-details dense enclosed outlined
                                                  append-icon="mdi-magnify"
                                                  placeholder="Consultar"
                                                  v-model="search"
                                    ></v-text-field>
                                </div>
                            </v-row>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">

                        <v-data-table
                            :headers="headers"
                            :items="data"
                            sort-by="calories"
                            :search="search"
                            class="elevation-1"
                        >
                            <template v-slot:item.actions="{ item }">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="edit(item)"
                                >
                                    mdi-pencil-outline
                                </v-icon>
                                <v-icon
                                    small
                                    @click="deleteRow(item)"
                                >
                                    mdi-delete-outline
                                </v-icon>
                            </template>
                            <template v-slot:no-data>
                                <v-btn
                                    color="primary"
                                    @click="initialize"
                                >
                                    Recargar
                                </v-btn>
                            </template>
                        </v-data-table>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>

        <v-dialog
            v-model="isOpen"
            max-width="800"
        >
            <v-card class="pa-6">
                <v-card-text>
                    <v-text-field
                        v-model="form.name"
                        :counter="10"
                        label="Nombre"
                        required
                    ></v-text-field>
                    <div v-if="$page.errors.name" class="text-red-500">{{
                            $page.errors.name[0]
                        }}
                    </div>

                    <v-textarea
                        v-model="form.description"
                        label="Descripción"
                        required
                    ></v-textarea>

                    <div v-if="$page.errors.description" class="text-red-500">{{
                            $page.errors.description[0]
                        }}
                    </div>
                    <div class="d-flex justify-end">
                        <v-btn wire:click.prevent="store()" type="button"
                               v-show="!editMode" @click="save(form)"
                               class="primary mx-1" dark>
                            Guardar
                        </v-btn>

                        <v-btn wire:click.prevent="store()" type="button"
                               v-show="editMode" @click="update(form)"
                               class="primary x-1" dark>
                            Actualizar
                        </v-btn>

                        <v-btn @click="closeModal()" type="button"
                               class="secondary mx-1" dark>
                            Cancelar
                        </v-btn>
                    </div>
                </v-card-text>
            </v-card>
        </v-dialog>
    </app-layout>
</template>
<script>
import AppLayout from '@/Layouts/AppLayout'
import BreadCrumbs from "@/Components/BreadCrumbs";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
    },
    props: ['data', 'errors'],
    data() {
        return {
            editMode: false,
            isOpen: false,
            search: '',
            form: {
                name: null,
                description: null,
            },
            headers: [
                {
                    text: 'Id',
                    align: 'start',
                    sortable: false,
                    value: 'id',
                },
                {text: 'Nombre', value: 'name',},
                {text: 'Descripción', value: 'description'},
                {text: 'Acciones', value: 'actions', sortable: false},
            ],
            editedIndex: -1,
            editedItem: {
                name: '',
            },
            defaultItem: {
                name: '',
            },
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: '/dashboard',
                },
                {
                    text: 'Categoría de tickets',
                    disabled: true,
                    href: 'breadcrumbs_link_1',
                },
            ],
        }
    },
    methods: {
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.reset();
            this.editMode = false;
        },
        reset: function () {
            this.form = {
                name: null,
                description: null,
            }
        },
        save: function (data) {
            this.$inertia.post('ticket-category', data, {
                onSuccess: page => {
                    console.log('this is page =>', page)
                    this.$swal(
                        'Buen trabajo!',
                        this.$page.flash.message,
                        'success'
                    )
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
                onError: errors => {
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
                onFinish: visit => {
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
            })

        },
        edit: function (data) {
            this.form = Object.assign({}, data);
            this.editMode = true;
            this.openModal();
        },
        update: function (data) {
            data._method = 'PUT';
            this.$inertia.post('/ticket-category/' + data.id, data, {
                onSuccess: page => {
                    this.$swal(
                        'Buen trabajo!',
                        this.$page.flash.message,
                        'success'
                    )
                    this.reset();
                    this.closeModal();
                },
                onError: errors => {
                    this.reset();
                    this.closeModal();
                },
                onFinish: visit => {
                    this.reset();
                    this.closeModal();
                },
            })
        },

        deleteRow(item) {
            item._method = 'DELETE';
            this.$swal({
                title: '¿Está seguro de que desea eliminar este elemento?',
                text: "¡No podrás revertir esto!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, Eliminarlo!'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post(this.route('ticket-category.destroy', item.id), item, {
                        onStart: (visit) => {
                            this.loadingDeleteItem = true;
                        },
                        onSuccess: (page) => {
                            console.log("estamos eliminando la info", page)
                            this.$swal({
                                icon: `${page.props.errors.message ? 'error' : 'success'}`,
                                title: `${page.props.errors.message ? 'Ups...' : '¡Buen trabajo!'}`,
                                text: `${page.props.errors.message ? page.props.errors.message : page.props.flash.message}`
                            })
                        },
                        onError: (errors) => {
                            this.$swal(
                                '¡Ay...!',
                                'Disculpe, ocurrió un error.',
                                'warning'
                            )
                        },
                        onFinish: visit => {
                            this.loadingDeleteItem = false;
                        },
                    })

                }
            })
        },

        initialize() {
            this.$inertia.get(this.route('ticket-category.index'));
        },
    }
}
</script>
