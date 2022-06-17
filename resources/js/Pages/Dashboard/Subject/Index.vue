<template>
    <app-layout>
        <bread-crumbs name="Asignaturas " :items="items"></bread-crumbs>
        <v-container class="py-12">
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-card-text class="">
                            <v-row class=" no-gutters">
                                <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                    <v-btn
                                        @click="create()"
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
                            <template v-slot:item.description="{ item }">
                                {{ ConvertStringToHTML(item.description) }}
                            </template>
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
            style="z-index: 9"
            fullscreen
            hide-overlay
            transition="dialog-bottom-transition"
            scrollable
        >
            <v-card tile color="grey lighten-4" class="min-h-screen">
                <v-toolbar
                    flat
                    dark
                    color="primary"
                    style="max-height: 150px"
                >
                    <v-btn
                        icon
                        dark
                        @click="isOpen = false"
                    >
                        <v-icon>mdi-close</v-icon>
                    </v-btn>
                    <v-toolbar-title class="text-h5 white--text">Gestión de asignaturas</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-menu
                        bottom
                        right
                        offset-y
                    >
                        <template v-slot:activator="{ on, attrs }">
                            <v-btn
                                dark
                                icon
                                v-bind="attrs"
                                v-on="on"
                            >
                                <v-icon>mdi-dots-vertical</v-icon>
                            </v-btn>
                        </template>
                        <v-list dense>
                            <inertia-link :href="route(item.route)" v-for="(item, i) in management"
                                          :key="i">
                                <v-list-item link>
                                    <v-list-item-icon>
                                        <v-icon>{{ item.icon }}</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-title>{{ item.title }}</v-list-item-title>
                                </v-list-item>
                            </inertia-link>
                        </v-list>
                    </v-menu>
                </v-toolbar>
                <v-container>
                    <v-form
                        ref="form"
                        v-model="valid">
                        <v-card class="mt-12">
                            <v-card-title class="align-start">
                                <v-card class="overflow-hidden mt-n9 transition-swing elevation-6 rounded primary fixed"
                                        style="max-width: 100%; "
                                >
                                    <div class="pa-8">
                                        <v-icon dark size="36">mdi-book-multiple</v-icon>
                                    </div>
                                </v-card>
                                <div class="text-h5  pl-4 ">
                                    {{ editMode !== false ? 'Editar asignatura' : 'Crear nueva asignatura' }}
                                </div>
                            </v-card-title>
                            <v-card-text>
                                <v-row>
                                    <v-col class="col-12">
                                        <v-text-field
                                            outlined
                                            v-model="form.name"
                                            :counter="50"
                                            label="Nombre"
                                            :rules="[rules.required]"
                                        ></v-text-field>

                                        <div v-if="$page.errors.title" class="text-red-500">
                                            {{ $page.errors.title[0] }}
                                        </div>
                                    </v-col>

                                    <v-col class="col-12">
                                        <v-label for="myTextEditor" class="mb-4">Descripción</v-label>
                                        <div class="py-2">
                                            <vue-editor :editor-toolbar="customToolbar"
                                                        ref="myTextEditor"
                                                        v-model="form.description"
                                                        :rules="[rules.required]"
                                            ></vue-editor>
                                        </div>

                                        <div v-if="$page.errors.starts_at" class="text-red-500">
                                            {{ $page.errors.starts_at[0] }}
                                        </div>
                                    </v-col>
                                </v-row>


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
                    </v-form>
                </v-container>
            </v-card>
        </v-dialog>
    </app-layout>
</template>
<script>
import AppLayout from '@/Layouts/AppLayout'
import BreadCrumbs from "@/Components/BreadCrumbs";
import {VueEditor} from "vue2-editor";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
        VueEditor
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
                description: null
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
                description: null
            },
            defaultItem: {
                name: null,
                description: null
            },
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'dashboard',
                },
                {
                    text: 'Asignaturas ',
                    disabled: true,
                    href: 'asignaturas .index',
                }
            ],
            customToolbar: [
                [{'font': []}],
                [{'header': [false, 1, 2, 3, 4, 5, 6,]}],
                [{'size': ['small', false, 'large', 'huge']}],
                ['bold', 'italic', 'underline', 'strike'],
                [{'align': ''}, {'align': 'center'}, {'align': 'right'}, {'align': 'justify'}],
                [{'header': 1}, {'header': 2}],
                ['blockquote', 'code-block'],
                [{'list': 'ordered'}, {'list': 'bullet'}, {'list': 'check'}],
                [{'script': 'sub'}, {'script': 'super'}],
                [{'indent': '-1'}, {'indent': '+1'}],
                [{'color': []}, {'background': []}],
                ['link', 'formula'],
                [{'direction': 'rtl'}],
                ['clean'],
            ],

            management: [
                {title: 'Editar', icon: 'mdi-playlist-edit', route: 'area.index'},
                {title: 'Eliminar', icon: 'mdi-playlist-remove', route: 'area.index'},
                {title: 'Crear', icon: 'mdi-playlist-plus', route: 'area.index'},
                {title: 'Salir', icon: 'mdi-close', route: 'area.index'},
            ]
        }
    },

    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },
        ConvertStringToHTML(str) {
            let parser = new DOMParser();
            let doc = parser.parseFromString(str, 'text/html');
            /*  console.log("este es el objeto => ", doc.body)
              doc.body.className = "text-truncate";
              for (const property in doc.body) {
                  console.log("este es un elemento => ", property);
              }*/
            return doc.body.innerText;
        },
        getActualYear() {
            return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0, 7);
        },
        create: function () {
            this.editMode = false;
            this.openModal();
        },
        edit: function (data) {
            this.form = Object.assign({}, data);
            this.editMode = true;
            this.openModal();
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
            this.resetValidation();
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
                    this.editMode = false;
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
        },

    }
}
</script>
