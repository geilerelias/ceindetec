<template>

    <div>

        <v-dialog
            :value="open"
            fullscreen
            hide-overlay
            persistent
            style="z-index: 9"
            transition="dialog-bottom-transition"
        >

            <v-card color="grey lighten-4" max-width="800" tile>

                <v-toolbar
                    color="primary"
                    dark
                    flat
                    style="max-height: 150px"
                >

                    <v-btn
                        dark
                        icon
                        @click="closeModal()"
                    >
                        <v-icon>mdi-close</v-icon>
                    </v-btn>

                    <v-toolbar-title class="text-h5 white--text">{{
                            isEdit !== false ? 'Editar miembro' : 'Crear nuevo miembro'
                        }}
                    </v-toolbar-title>

                    <v-spacer></v-spacer>

                    <v-menu
                        bottom
                        offset-y
                        right
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

                            <inertia-link v-for="(item, i) in management" :key="i"
                                          :href="route(item.route)">

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
                                        <v-icon dark size="36">mdi-account-supervisor</v-icon>
                                    </div>

                                </v-card>

                                <v-breadcrumbs :items="breadcrumbs"></v-breadcrumbs>

                            </v-card-title>

                            <v-card-text>

                                <div class="wrapper">
                                    <div class="px-8">
                                        <v-row class="mb-5">

                                            <v-col class="col-12 col-sm-6 col-md-8">
                                                <v-row>
                                                    <v-col class="col-12">
                                                        <v-text-field
                                                            v-model="person.name"
                                                            :rules="[rules.required,rules.text(person.name,'nombre')]"
                                                            label="Nombres"
                                                            outlined
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col class="col-12 ">
                                                        <v-text-field
                                                            v-model="person.surname"
                                                            :rules="[rules.required,rules.text(person.surname,'Apellido')]"
                                                            label="Apellidos"
                                                            outlined
                                                        ></v-text-field>
                                                    </v-col>
                                                    <v-col class="col-12">
                                                        <v-text-field
                                                            v-model="person.email"
                                                            :rules="[rules.required,rules.email]"
                                                            label="Correo electrónico"
                                                            outlined
                                                        ></v-text-field>
                                                    </v-col>
                                                </v-row>

                                            </v-col>

                                            <v-col class="col-12 col-sm-6 col-md-4" style="max-height: 300px">
                                                <picture-input
                                                    ref="pictureInput"
                                                    :crop="true"
                                                    :customStrings="customStrings"
                                                    :prefill="getImg()"
                                                    :removable="true"
                                                    :zIndex="0"
                                                    button-class="v-btn--is-elevated v-btn--has-bg theme--light v-size--default success v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small"
                                                    height="260"
                                                    radius="0"
                                                    removeButtonClass="v-btn--is-elevated v-btn--has-bg theme--light v-size--default error v-btn v-btn--is-elevated v-btn--has-bg theme--light v-size--small"
                                                    size="10"
                                                    width="260"
                                                    @change="onChange"
                                                >
                                                </picture-input>
                                            </v-col>
                                            <v-col class="col-12 col-sm-5">
                                                <v-select
                                                    v-model="person.identification_type"
                                                    :items="tiposDocumentos"
                                                    :rules="[rules.required]"
                                                    item-text="text"
                                                    item-value="value"
                                                    label="Tipo de identificación"
                                                    outlined
                                                ></v-select>
                                            </v-col>

                                            <v-col class="col-12 col-sm-4">
                                                <v-text-field
                                                    v-model="person.identification_number"
                                                    :rules="[rules.required,rules.number]"
                                                    label="Numero de identificación"
                                                    outlined
                                                ></v-text-field>
                                            </v-col>

                                            <v-col class="col-12 col-sm-3">
                                                <v-text-field
                                                    v-model="person.phone"
                                                    :rules="[rules.required,rules.number]"
                                                    label="Numero telefónico"
                                                    outlined
                                                ></v-text-field>
                                            </v-col>
                                            <v-col class="col-12 col-sm-3">
                                                <v-select
                                                    v-model="person.gender"
                                                    :items="['Femenino','Masculino','Prefiero no decirlo']"
                                                    :rules="[rules.required]"
                                                    label="Género"
                                                    outlined
                                                ></v-select>
                                            </v-col>

                                            <v-col class="col-12 col-sm-3">
                                                <v-menu
                                                    v-model="menu1"
                                                    :close-on-content-click="false"
                                                    :nudge-right="40"
                                                    min-width="auto"
                                                    offset-y
                                                    transition="scale-transition"
                                                >
                                                    <template v-slot:activator="{ on, attrs }">
                                                        <v-text-field
                                                            v-model="person.birthday_date"
                                                            :rules="[rules.required]"
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
                                                    ></v-date-picker>
                                                </v-menu>
                                                <div v-if="$page.errors.starts_at" class="text-red-500">{{
                                                        $page.errors.starts_at[0]
                                                    }}
                                                </div>
                                            </v-col>
                                            <v-col class="col-12 col-sm-3">
                                                <v-select
                                                    v-model="person.ethnic_group"
                                                    :items="gruposEtnicos"
                                                    :rules="[rules.required]"
                                                    label="Grupo Etnico al que pertenece"
                                                    outlined
                                                ></v-select>
                                            </v-col>
                                            <v-col class="col-12 col-sm-3">
                                                <v-select
                                                    v-model="person.person_type"
                                                    :items="items"
                                                    :rules="[rules.required]"
                                                    label="Rol en la comunidad educativa"
                                                    outlined
                                                ></v-select>
                                            </v-col>

                                            <v-col class="col-12 col-sm-3">
                                                <v-select
                                                    v-model="person.department"
                                                    :items="departments"
                                                    :rules="[rules.required]"
                                                    label="Departamento *"
                                                    outlined
                                                    required
                                                ></v-select>
                                            </v-col>
                                            <v-col class="col-12 col-sm-3">
                                                <v-select
                                                    v-model="person.municipality"
                                                    :disabled="person.department==null"
                                                    :items="getCities(person.department)"
                                                    :rules="[rules.required]"
                                                    label="Municipio *"
                                                    outlined
                                                    required
                                                ></v-select>
                                            </v-col>
                                            <v-col class="col-12 col-sm-6">
                                                <v-text-field
                                                    v-model="person.direction"
                                                    :rules="[rules.required]"
                                                    label="Dirección de residencia"
                                                    outlined
                                                ></v-text-field>
                                            </v-col>
                                        </v-row>
                                    </div>
                                </div>

                                <div class="d-flex justify-end">

                                    <v-btn v-show="!edit" class="primary mx-1"
                                           dark @click="save(person)">
                                        Guardar
                                    </v-btn>

                                    <v-btn v-show="edit" class="primary x-1"
                                           dark @click="update(person)">
                                        Actualizar
                                    </v-btn>

                                    <v-btn class="secondary mx-1" dark
                                           type="button" @click="closeModal()">
                                        Cancelar
                                    </v-btn>

                                </div>

                            </v-card-text>

                        </v-card>

                    </v-form>

                </v-container>

            </v-card>

        </v-dialog>

        <spinner-component :value="saving"></spinner-component>

    </div>

</template>

<script>

import {VueEditor} from "vue2-editor";
import SpinnerComponent from "@/Components/SpinnerComponent";
import PictureInput from 'vue-picture-input'
import colombiaJson from "@/../assets/colombia.json";

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
        saving: false,
        gruposEtnicos: [
            'Comunidades indígenas',
            'Comunidades negras',
            'Comunidades afrocolombianas',
            'Comunidad Raizal',
        ],
        tiposDocumentos: [
            {
                text: 'Registro Civil (RC)',
                value: 'RC'
            },
            {
                text: 'Tarjeta de identidad (TI)',
                value: 'TI'
            },
            {
                text: 'Cédula de Ciudadanía (CC)',
                value: 'CC'
            },
            {
                text: 'Cédula Extranjera (CE)',
                value: 'CE'
            },
            {
                text: 'Permiso Especial de Permanencia (PEP)',
                value: 'PEP'
            },
            {
                text: 'Número establecido por la Secretaría de Educación (NES)',
                value: 'NES'
            }
        ],
        items: [
            'Estudiante',
            'Docente',
            'Padre de familia',
            'Administrativo',
            'Coordinador',
            'Director',
            'Rector',

        ],
        valid: false,
        menu1: null,
        person: {
            name: '',
            surname: '',
            gender: '',
            id_type: '',
            identification_number: '',
            birthday_date: '',
            ethnic_group: '',
            email: '',
            phone: '',
            person_type: '',
            department: '',
            municipality: '',
            direction: '',
            profile_photo_path: '',
        },
        rules: {
            required: value => !!value || 'Campo requerido.',
            max: value => value.length <= 20 || 'Máximo 20 caracteres',
            min: value => value.length >= 10 || 'Mínimo 10 caracteres',

            email: value => {
                const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                return pattern.test(value) || 'Dirección de correo invalida.'
            },

            phone: value => {
                const pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                return pattern.test(value) || 'Numero telefónico invalido.'
            },

            text: (value, text) => {
                const pattern = /[a-zA-Z ]{2,254}/;
                return pattern.test(value) || `Entrada incorrecta para el campo ${text}.`
            },

            number: value => {
                const pattern = /^\d+$/;
                return pattern.test(value) || 'Solo caracteres numéricos.'
            }
        },
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
        departments: [],
        municipality: [],
    }),
    created() {
        for (const item in colombiaJson) {
            this.departments.push(colombiaJson[item].departamento);
        }
        this.departments = this.departments.sort();
    },
    computed: {
        isEdit() {
            this.reset
            if (this.edit === true)
                this.person = this.data
            return this.edit
        },
        breadcrumbs() {
            let array = [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: '/dashboard',
                },
                {
                    text: 'Miembros de la Comunidad educativa',
                    disabled: false,
                    href: '/dashboard/person',
                },
                {
                    text: this.edit ? 'Editar' : 'Crear',
                    disabled: true,
                    href: '#',
                },
            ]
            return array;
        }

    },
    methods: {
        onChange(image) {
            if (image) {
                //console.log("Cover Picture loaded.");
                this.person.profile_photo_path = this.$refs.pictureInput.file;
                //console.log(this.$refs.pictureInput.file);
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
                    "Ingresa los campos obligatorios o verifica que el formato sea correcto",
                    "error"
                )
                this.saving = false;
            } else {
                let form = new FormData()
                for (const key in data) {
                    form.set(key, data[key])
                }
                this.$inertia.post(this.route('person.store'), form, {
                    onSuccess: (response) => {
                        let res = response.data;
                        console.log(response)
                        let text = "";
                        if (Object.keys(this.$page.errors).length > 0) {
                            console.log('errors => ', this.$page.errors)
                            for (var clave in this.$page.errors) {
                                text += clave + ": " + this.$page.errors[clave] + "\n ";
                            }
                            this.$swal({
                                icon: 'error',
                                title: 'Ups...',
                                text: text
                            })

                        } else {
                            this.$swal({
                                icon: 'success',
                                title: '¡Buen trabajo!',
                                text: this.$page.flash.message
                            }).then(result => {
                                this.saving = false;
                                if (result.isConfirmed) {
                                    this.headquarters = this.defaultHeadquarters;
                                    this.reset();
                                    this.resetValidation();
                                    this.$inertia.get(this.route('person.index'));
                                }
                            });
                        }
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
                        this.reset();
                        this.resetValidation();
                    },
                    onFinish: visit => {
                        this.saving = false;
                        this.reset();
                        this.resetValidation();
                    },
                });
            }

        }
        ,

        update: function (data) {
            data._method = 'PUT';
            let form = new FormData()
            for (const key in data) {
                form.set(key, data[key])
            }
            this.$inertia.post(this.route('person.update', data.id), form, {
                onSuccess: response => {

                    let res = response.data;
                    console.log(response)
                    let text = "";
                    if (Object.keys(this.$page.errors).length > 0) {
                        console.log('errors => ', this.$page.errors)
                        for (var clave in this.$page.errors) {
                            text += clave + ": " + this.$page.errors[clave] + "\n ";
                        }
                        this.$swal({
                            icon: 'error',
                            title: 'Ups...',
                            text: text
                        })

                    } else {
                        this.$swal({
                            icon: 'success',
                            title: '¡Buen trabajo!',
                            text: this.$page.flash.message
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.reset();
                                this.resetValidation();
                                this.$inertia.get(this.route('person.index'));
                            }
                        });
                    }
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
        }
        ,
        getImg() {
            if (this.edit) {
                if (this.data.profile_photo_path !== null)
                    return `/storage/${this.data.profile_photo_path}`;
                else
                    return `/src/avatar/null/null/${data.gender}.jpg`;
            } else {
                return ''
            }
        }
        ,
        getCities(department) {
            try {
                return colombiaJson.filter(
                    function (colombiaJson) {
                        return colombiaJson.departamento == department;
                    }
                )[0].ciudades;

            } catch (e) {
                return [];
            }
        }
        ,
    }
}
</script>

<style>
#picture-input > div > div {
    box-shadow: 0 3px 1px -2px rgb(0 0 0 / 20%), 0 2px 2px 0 rgb(0 0 0 / 14%), 0 1px 5px 0 rgb(0 0 0 / 12%);
}
</style>
