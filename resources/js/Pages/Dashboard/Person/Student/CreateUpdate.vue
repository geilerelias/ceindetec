<template>
    <v-dialog
        :value="open"
        style="z-index: 9"
        fullscreen
        hide-overlay
        persistent
        transition="dialog-bottom-transition"
    >
        <v-card max-width="800" tile color="grey lighten-4">
            <v-toolbar
                flat
                dark
                color="primary"
                style="max-height: 150px"
            >
                <v-btn
                    icon
                    dark
                    @click="closeModal()"
                >
                    <v-icon>mdi-close</v-icon>
                </v-btn>
                <v-toolbar-title class="text-h5 white--text">{{
                        isEdit !== false ? 'Editar estudiante' : 'Crear nuevo estudiante'
                    }}
                </v-toolbar-title>
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
                                    <v-icon dark size="36">mdi-account-school</v-icon>
                                </div>
                            </v-card>

                            <v-breadcrumbs :items="
                            [
                                {
                                    text: 'Dashboard',
                                    disabled: false,
                                    href: '/dashboard',
                                },
                                {
                                    text: 'Estudiante',
                                    disabled: false,
                                    href: '/dashboard/person/student',
                                },
                                {
                                    text: this.edit ? 'Editar' : 'Crear',
                                    disabled: true,
                                    href: '#',
                                },
                            ]">

                            </v-breadcrumbs>
                        </v-card-title>

                        <v-card-text>
                            <div class="wrapper">
                                <div class="px-8">
                                    <v-row class="mb-5">
                                        <v-col class="mb-4" style="max-height: 300px">
                                            <picture-input
                                                width="260"
                                                height="260"
                                                ref="pictureInput"
                                                @change="onChange"
                                                size="10"
                                                button-class="v-btn--is-elevated v-btn--has-bg theme--light v-size--default success v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small"
                                                removeButtonClass="v-btn--is-elevated v-btn--has-bg theme--light v-size--default error v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small"
                                                :zIndex="0"
                                                radius="0"
                                                :crop="true"
                                                :customStrings="customStrings"
                                                :removable="true"
                                            >
                                            </picture-input>
                                        </v-col>
                                        <v-col>
                                            <v-row>
                                                <v-col class="col-12 ">
                                                    <v-text-field
                                                        label="Nombres"
                                                        v-model="person.name"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>
                                                <v-col class="col-12 ">
                                                    <v-text-field
                                                        label="Apellidos"
                                                        v-model="person.surname"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>
                                                <v-col class="col-12 ">
                                                    <v-menu
                                                        v-model="menu1"
                                                        :close-on-content-click="false"
                                                        :nudge-right="40"
                                                        transition="scale-transition"
                                                        offset-y
                                                        min-width="auto"
                                                    >
                                                        <template v-slot:activator="{ on, attrs }">
                                                            <v-text-field
                                                                v-model="person.birthday_date"
                                                                label="Fecha de nacimiento"
                                                                outlined
                                                                readonly
                                                                v-bind="attrs"
                                                                v-on="on"
                                                            ></v-text-field>
                                                        </template>
                                                        <v-date-picker
                                                            v-model="person.birthday_date"
                                                            @input="menu1 = false"
                                                            locale="es-Es"
                                                        ></v-date-picker>
                                                    </v-menu>
                                                    <div v-if="$page.errors.starts_at" class="text-red-500">{{
                                                            $page.errors.starts_at[0]
                                                        }}
                                                    </div>
                                                </v-col>


                                            </v-row>

                                        </v-col>


                                        <v-col cols="12">
                                            <v-row>
                                                <v-col class="col col-4">
                                                    <v-select
                                                        v-model="person.ethnic_group"
                                                        :items="gruposEtnicos"
                                                        label="Grupo Etnico al que pertenece"
                                                        outlined
                                                    ></v-select>
                                                </v-col>
                                                <v-col class="col col-8">
                                                    <v-text-field
                                                        label="Correo electronico"
                                                        v-model="person.email"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>
                                            </v-row>
                                        </v-col>
                                        <v-col class="col-12 col-sm-6">
                                            <v-select
                                                label="Tipo de identificación"
                                                v-model="person.id_type"
                                                :items="tiposDocumentos"
                                                outlined
                                            ></v-select>
                                        </v-col>

                                        <v-col class="col-12 col-sm-6">
                                            <v-text-field
                                                label="Numero de identificación"
                                                v-model="person.identification_number"
                                                outlined
                                            ></v-text-field>
                                        </v-col>
                                    </v-row>
                                </div>
                            </div>

                            <div class="d-flex justify-end">
                                <v-btn wire:click.prevent="store()" type="button"
                                       v-show="!edit" @click="save(form)"
                                       class="primary mx-1" dark>
                                    Guardar
                                </v-btn>

                                <v-btn wire:click.prevent="store()" type="button"
                                       v-show="edit" @click="update(form)"
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
</template>

<script>
import {VueEditor} from "vue2-editor";
import SpinnerComponent from "@/Components/SpinnerComponent";
import PictureInput from 'vue-picture-input'

export default {
    name: "CreateUpdate",
    components: {
        VueEditor,
        SpinnerComponent,
        PictureInput,
    },
    props: {
        data: Object,
        edit: Boolean,
        open: {
            type: Boolean,
            default: false
        },
        close: Function,
        errors: Object,
    },
    data: () => ({
        gruposEtnicos: [
            'Comunidades indígenas',
            'Comunidades negras',
            'Comunidades afrocolombianas',
            'Comunidad Raizal',
        ],
        tiposDocumentos: [
            'Registro Civil (RC)',
            'Tarjeta de identidad (TI)',
            'Cédula de Ciudadanía (CC)',
            'Cédula Extranjera (CE)',
            'Permiso Especial de Permanencia (PEP)',
            'Número establecido por la Secretaría de Educación (NES)'

        ],
        valid: false,
        menu1: null,
        person: {
            name: null,
            surname: null,
            id_type: null,
            identification_number: null,
            birthday_date: null,
            ethnic_group: null,
            email: null,
            person_type: null,
            profile_photo_path: null,
        },
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
        defaultForm: {
            name: null,
            description: null
        },
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
            {title: 'Editar', icon: 'mdi-playlist-edit', route: 'person.create.student'},
            {title: 'Eliminar', icon: 'mdi-playlist-remove', route: 'person.index.student'},
            {title: 'Crear', icon: 'mdi-playlist-plus', route: 'person.create.student'},
            {title: 'Salir', icon: 'mdi-close', route: 'person.create.student'},
        ],
        customStrings: {
            upload: "<p> Su dispositivo no admite la carga de archivos. </p>", // HTML allowed
            drag: "Arrastre una imagen o <br> haga clic aquí para seleccionar", // HTML allowed
            tap: "Toque aquí para seleccionar una foto <br> de su galería", // HTML allowed
            change: "Cambiar", // Text only
            remove: "Eliminar", // Text only
            select: "Selecciona una foto", // Text only
            selected: '<p>Photo successfully selected!</p>', // HTML allowed
            fileType: "Este tipo de archivo no es compatible.",
            fileSize: 'The file size exceeds the limit', // Text only
            aspect: 'Landscape/Portrait',// Text only
        },

    }),
    computed: {
        isEdit() {
            if (this.edit === true)
                this.form = this.data

            return this.edit
        },
    },
    methods: {
        onChange(image) {
            if (image) {
                console.log("Cover Picture loaded.");
                this.person.profile_photo_path = this.$refs.pictureInput.file;
                console.log(this.$refs.pictureInput.file);
            } else {
                console.log(
                    "FileReader API not supported: use the <form>, Luke!"
                );
            }
        },
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },
        closeModal() {
            this.reset()
            this.close();
        },
        reset: function () {
            this.form = this.defaultForm
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
                this.$inertia.post(this.route('estudiante.store'), data, {
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
                                this.$inertia.get(this.route('estudiante.index'));
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
            this.$inertia.post(this.route('estudiante.update', data.id), data, {
                onSuccess: page => {
                    console.log(page.props.errors)
                    this.$swal({
                        icon: `${page.props.errors ? 'error' : 'success'}`,
                        title: `${page.props.errors ? 'Ups...' : '¡Buen trabajo!'}`,
                        text: `${page.props.errors ? page.props.errors : page.props.flash.message}`
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
    }
}
</script>

<style>
#picture-input > div > div {
    box-shadow: 0 3px 1px -2px rgb(0 0 0 / 20%), 0 2px 2px 0 rgb(0 0 0 / 14%), 0 1px 5px 0 rgb(0 0 0 / 12%);
}
</style>
