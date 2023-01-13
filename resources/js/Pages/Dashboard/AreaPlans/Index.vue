<template>
    <app-layout>
        <bread-crumbs name="Areas curriculares" :items="items"></bread-crumbs>
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
                                        Add
                                    </v-btn>

                                    <v-btn outlined
                                           class="button-shadow primary--text">
                                        <v-icon aria-hidden="true"
                                                class="notranslate mr-2">
                                            mdi-filter-variant
                                        </v-icon>
                                        Filters
                                    </v-btn>
                                </div>
                                <v-spacer></v-spacer>

                                <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                    <v-text-field hide-details dense enclosed outlined
                                                  append-icon="mdi-magnify"
                                                  placeholder="search"
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
                                    Reset
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
            <v-form
                ref="form"
                v-model="valid" class="">
                <v-card class="pa-6">
                    <v-card-text>
                        <v-row>
                            <v-col class="col-12">
                                <v-text-field
                                    v-model="form.name"
                                    :counter="50"
                                    label="Nombre"
                                    :rules="[rules.required]"
                                ></v-text-field>
                                <div v-if="$page.errors.title" class="text-red-500">{{
                                        $page.errors.title[0]
                                    }}
                                </div>
                            </v-col>

                            <v-col class="col-12">
                                <v-select
                                    v-model="form.study_plan_id"
                                    :items="studyPlans"
                                    item-text="name"
                                    item-value="id"
                                    label="Plan de estudio"
                                    :rules="[rules.required]">
                                </v-select>

                                <div v-if="$page.errors.starts_at" class="text-red-500">{{
                                        $page.errors.starts_at[0]
                                    }}
                                </div>
                            </v-col>
                        </v-row>


                        <div class="d-flex justify-end">
                            <v-btn wire:click.prevent="store()" type="button"
                                   v-show="!editMode" @click="save(form)"
                                   class="primary mx-1" dark>
                                Save
                            </v-btn>

                            <v-btn wire:click.prevent="store()" type="button"
                                   v-show="editMode" @click="update(form)"
                                   class="primary x-1" dark>
                                Update
                            </v-btn>

                            <v-btn @click="closeModal()" type="button"
                                   class="secondary mx-1" dark>
                                Cancel
                            </v-btn>
                        </div>

                    </v-card-text>

                </v-card>
            </v-form>
        </v-dialog>
    </app-layout>
</template>
<script>
import AppLayout from '@/Layouts/AppLayout.vue'
import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
    },
    props: ['data', 'errors'],
    data() {
        return {
            saving: false,
            valid: false,
            menu1: false,
            menu2: false,
            establishments: [],
            studyPlans: [],
            editMode: false,
            isOpen: false,
            search: '',
            rules: {
                required: value => !!value || 'Campo requerido.',
                max: value => value.length <= 20 || 'Máximo 20 caracteres',
                min: value => value.length >= 10 || 'Mínimo 10 caracteres',
                email: value => {
                    const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    return pattern.test(value) || 'Invalid e-mail.'
                },
                phone: value => {
                    const pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                    return pattern.test(value) || 'Numero telefónico invalido.'

                },
                text: value => {
                    const pattern = /^\s+$/;
                    return pattern.test(value) || 'Solo caracteres alfabéticos.'

                },
                number: value => {
                    const pattern = /^\d+$/;
                    return pattern.test(value) || 'solo caracteres numéricos.'

                }
            },
            form: {
                name: null,
                study_plan_id: null
            },
            headers: [
                {
                    text: 'Id',
                    align: 'start',
                    sortable: false,
                    value: 'id',
                },
                {text: 'Nombre', value: 'name',},
                {text: 'Descripción', value: 'description',},
                {text: 'Acciones', value: 'actions', sortable: false},
            ],
            editedIndex: -1,
            editedItem: {
                name: null,
                study_plan_id: null
            },
            defaultItem: {
                name: null,
                study_plan_id: null
            },
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'dashboard',
                },
                {
                    text: 'Areas curriculares',
                    disabled: true,
                    href: 'areas.index',
                }
            ],
        }
    },

    created() {
        axios.get(`/dashboard/study-plans/all`)
            .then((response) => {
                //console.log(response.data)
                this.studyPlans = response.data
            });
    },

    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },


        getActualYear() {
            return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0, 7);
        },
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.reset();
            this.editMode = false;
        },
        reset: function () {
            this.form = this.defaultItem
        },
        resetValidation() {
            this.$refs.form.resetValidation()
        },
        save: function (data) {
            this.saving = true;
            if (!this.validate() && !this.valid) {

                this.$swal.fire(
                    "Campos Obligatorio!",
                    "Ingresa los campos obligatorios!",
                    "error"
                )

                this.saving = false;
            } else {
                this.$inertia.post(this.route('area.store'), data, {
                    onSuccess: (response) => {
                        let res = response.data;
                        console.log(response)
                        console.log('errors => ', this.$page.errors)
                        //console.log('este es page', this.$page);
                        this.$swal({
                            icon: `${this.$page.errors.name ? 'error' : 'success'}`,
                            title: `${this.$page.errors.name ? 'Ups...' : '¡Buen trabajo!'}`,
                            text: `${this.$page.errors.name ? this.$page.errors.name[0] : this.$page.flash.message}`
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.reset();
                                this.resetValidation();
                                this.$inertia.get(this.route('area.index'));
                            }
                        });
                    },
                    onError: error => {
                        //console.log(error);
                        this.saving = false;

                        const array = error.response.data.errors;
                        let text = "";
                        for (var clave in array) {
                            text += clave + ": " + array[clave] + "\n ";
                        }
                        this.$swal.fire("Error!", text, "error");
                        console.log(text);
                    },
                    onFinish: visit => {
                        this.saving = false;
                    },
                });
            }
        },
        edit: function (data) {
            this.form = Object.assign({}, data);
            this.editMode = true;
            this.openModal();
        },
        update: function (data) {
            data._method = 'PUT';
            this.$inertia.post(this.route('area.update', data.id), data, {
                onSuccess: page => {
                    this.$swal({
                        icon: `${page.props.errors.message ? 'error' : 'success'}`,
                        title: `${page.props.errors.message ? 'Ups...' : '¡Buen trabajo!'}`,
                        text: `${page.props.errors.message ? page.props.errors.message : page.props.flash.message}`
                    })
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
                    this.$inertia.post(this.route('area.destroy', item.id), item, {
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
            this.$inertia.get(this.route('area.index'));
        }
    }
}
</script>
