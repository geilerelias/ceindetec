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
                                        <section id="info-personal">
                                            <v-row class="text-left">
                                                <v-col class="col-10">
                                                    <h5 class=" text-h5 text-typo font-weight-normal mb-2">
                                                        Información Personal
                                                    </h5>
                                                    <p class="text-body font-weight-light">
                                                        Comencemos con la información básica.
                                                    </p>
                                                </v-col>
                                            </v-row>
                                            <v-row class="mb-5">

                                                <v-col class="col-12 col-sm-6 col-md-8">
                                                    <v-row>
                                                        <v-col cols="12" md="6">
                                                            <v-text-field
                                                                v-model="person.name"
                                                                :error-messages="person.errors?.name ? [person.errors.name[0]] : []"
                                                                :rules="[rules.required,rules.text(person.name,'nombre')]"
                                                                label="Nombres"
                                                                outlined
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col cols="12" md="6">
                                                            <v-text-field
                                                                v-model="person.surname"
                                                                :error-messages="person.errors?.surname ? [person.errors.surname[0]] : []"

                                                                :rules="[rules.required,rules.text(person.surname,'Apellido')]"
                                                                label="Apellidos"
                                                                outlined
                                                            ></v-text-field>
                                                        </v-col>

                                                        <v-col class="col-12 col-sm-4">
                                                            <v-autocomplete
                                                                v-model="person.gender"
                                                                :error-messages="person.errors?.gender ? [person.errors.gender[0]] : []"
                                                                :items="['Femenino','Masculino','Prefiero no decirlo']"
                                                                :rules="[rules.required]"
                                                                label="Género"
                                                                outlined
                                                            ></v-autocomplete>
                                                        </v-col>

                                                        <v-col class="col-12 col-sm-4">
                                                            <v-autocomplete
                                                                v-model="person.identification_type"
                                                                :error-messages="person.errors?.identification_type ? [person.errors.identification_type[0]] : []"
                                                                :items="tiposDocumentos"
                                                                :rules="[rules.required]"
                                                                item-text="text"
                                                                item-value="value"
                                                                label="Tipo de identificación"
                                                                outlined
                                                            ></v-autocomplete>
                                                        </v-col>

                                                        <v-col class="col-12 col-sm-4">
                                                            <v-text-field
                                                                v-model="person.identification_number"
                                                                :error-messages="person.errors?.identification_number ? [person.errors.identification_number[0]] : []"
                                                                :rules="[rules.required,rules.number]"
                                                                label="Numero de identificación"
                                                                outlined
                                                            ></v-text-field>
                                                        </v-col>
                                                        <v-col class="col-12 col-sm-3">
                                                            <v-autocomplete v-model="person.blood_type"
                                                                            :error-messages="person.errors?.blood_type ? [person.errors.blood_type[0]] : []"
                                                                            :items="blood_types"
                                                                            label="Tipo de sangre"
                                                                            outlined>

                                                            </v-autocomplete>
                                                        </v-col>

                                                        <v-col class="col-12 col-sm-4">
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
                                                                    :max="getMaxDate()"
                                                                    :min="getMinDate()"
                                                                    @input="menu1 = false"
                                                                ></v-date-picker>
                                                            </v-menu>
                                                            <!--                                                            <div v-if="$page.errors.starts_at" class="text-red-500">{{
                                                                                                                                $page.errors.starts_at[0]
                                                                                                                            }}
                                                                                                                        </div>-->
                                                        </v-col>

                                                        <v-col class="col-12 col-sm-5">
                                                            <v-autocomplete
                                                                v-model="person.ethnic_group"
                                                                :items="gruposEtnicos"
                                                                :rules="[rules.required]"
                                                                label="Grupo Étnico al que pertenece"
                                                                outlined
                                                            ></v-autocomplete>
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

                                            </v-row>
                                        </section>

                                        <section id="info-localization">
                                            <v-row class="text-left">
                                                <v-col class="col-10">
                                                    <h5 class=" text-h5 text-typo font-weight-normal mb-2">
                                                        Información de localización
                                                    </h5>
                                                    <p class="text-body font-weight-light">
                                                        En este apartado me contaras mas sobre la zona en la que vives
                                                    </p>
                                                </v-col>
                                            </v-row>

                                            <v-row class="mb-5">
                                                <v-col class="col-12 col-sm-3">
                                                    <v-autocomplete
                                                        v-model="person.department"
                                                        :error-messages="person.errors?.department ? [person.errors.department[0]] : []"
                                                        :items="departments"
                                                        :rules="[rules.required]"
                                                        label="Departamento *"
                                                        outlined
                                                        required
                                                    ></v-autocomplete>
                                                </v-col>
                                                <v-col class="col-12 col-sm-3">
                                                    <v-autocomplete
                                                        v-model="person.municipality"
                                                        :error-messages="person.errors?.municipality ? [person.errors.municipality[0]] : []"
                                                        :disabled="person.department===null || person.department===''"
                                                        :items="getCities(person.department)"
                                                        :rules="[rules.required]"
                                                        label="Municipio *"
                                                        outlined
                                                        required
                                                    ></v-autocomplete>
                                                </v-col>
                                                <v-col class="col-12 col-sm-6">
                                                    <v-text-field
                                                        v-model="person.direction"
                                                        :error-messages="person.errors?.direction ? [person.errors.direction[0]] : []"
                                                        :rules="[rules.required]"
                                                        label="Dirección de residencia"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>

                                                <v-col class="col-12 col-sm-6">
                                                    <v-autocomplete
                                                        v-model="person.establishment_id"
                                                        :error-messages="person.errors?.establishment_id ? [person.errors.establishment_id[0]] : []"
                                                        :items="establishments"
                                                        :readonly="establishment_id > -1"
                                                        :rules="[rules.required]"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Establecimiento al que pertenece"
                                                        outlined
                                                        @change="getAllHeadquarters">
                                                    </v-autocomplete>
                                                </v-col>
                                                <v-col class="col-12 col-sm-6">
                                                    <v-autocomplete
                                                        v-model="person.headquarter_id"
                                                        :error-messages="person.errors?.headquarter_id ? [person.errors.headquarter_id[0]] : []"
                                                        :disabled="person.establishment_id===null || person.establishment_id===''"
                                                        :items="headquarters"
                                                        :readonly="headquarter_id > -1"
                                                        :rules="[rules.required]"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Sede a la que pertenece"
                                                        outlined>
                                                    </v-autocomplete>
                                                </v-col>

                                            </v-row>

                                        </section>
                                        errror {{ person }}
                                        <section id="info-contacto">
                                            <v-row class="text-left">
                                                <v-col class="col-10">
                                                    <h5 class=" text-h5 text-typo font-weight-normal mb-2">
                                                        Información de contacto
                                                    </h5>
                                                    <p class="text-body font-weight-light">
                                                        Esta es la información con cual nos pondremos en contacto
                                                        contigo
                                                    </p>
                                                </v-col>
                                            </v-row>
                                            <v-row class="mb-5">

                                                <v-col cols="12" md="4" sm="6">
                                                    <v-text-field
                                                        v-model="person.email"
                                                        :error-messages="person.errors?.email ? [person.errors.email[0]] : []"
                                                        :rules="[rules.required,rules.email]"
                                                        label="Correo electrónico"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>

                                                <v-col cols="12" md="4" sm="6">
                                                    <v-text-field
                                                        v-model="person.phone"
                                                        :error-messages="person.errors?.phone ? [person.errors.phone[0]] : []"
                                                        :rules="[rules.required,rules.number]"
                                                        label="Numero telefónico"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>
                                                <v-col cols="12" md="4" sm="6">
                                                    <v-autocomplete
                                                        v-model="person.person_type"
                                                        :error-messages="person.errors?.person_type ? [person.errors.person_type[0]] : []"
                                                        :disabled="person.headquarter_id===''"
                                                        :items="typePeople"
                                                        :rules="[rules.required]"
                                                        label="Rol en la comunidad educativa"
                                                        outlined
                                                        @change="getByPersonType()"
                                                    ></v-autocomplete>
                                                </v-col>

                                            </v-row>
                                            <v-expand-transition>
                                                <div v-if="person.person_type==='Estudiante'">
                                                    <v-row class="text-left">
                                                        <v-col class="col-10">
                                                            <h5 class=" text-h5 text-typo font-weight-normal mb-2">
                                                                Información de acudiente.
                                                            </h5>
                                                            <p class="text-body font-weight-light">
                                                                Esta es la información con cual determinaremos las
                                                                personas
                                                                responsables de todo lo concerniente a los asuntos
                                                                académico
                                                                del
                                                                estuante.
                                                            </p>
                                                        </v-col>
                                                    </v-row>

                                                    <v-row class="mb-5">

                                                        <v-col cols="12" md="4" sm="6">
                                                            <v-autocomplete
                                                                v-model="attendant_student.attendant_id"
                                                                :items="people"
                                                                :loading="isLoading"
                                                                :rules="[rules.required]"
                                                                :search-input.sync="search"
                                                                item-text="name"
                                                                item-value="id"
                                                                label="Acudido por"
                                                                outlined
                                                            >
                                                                <template v-slot:no-data>
                                                                    <v-list-item>
                                                                        <v-list-item-title>
                                                                            Buscar el respectivo
                                                                            <strong> Acudiente</strong>
                                                                        </v-list-item-title>
                                                                    </v-list-item>
                                                                </template>

                                                                <template
                                                                    v-slot:selection="{ attr, on, item, selected }">
                                                                    <v-chip
                                                                        :input-value="selected"
                                                                        class="white--text"
                                                                        color="blue-grey"
                                                                        v-bind="attr"
                                                                        v-on="on"
                                                                    >
                                                                        <v-icon left>
                                                                            mdi-account-circle
                                                                        </v-icon>
                                                                        <span v-text="item.name"></span>
                                                                    </v-chip>
                                                                </template>
                                                                <template v-slot:item="{ item }">
                                                                    <v-list-item-avatar
                                                                        class="font-weight-light white--text"
                                                                        color="indigo"
                                                                    >
                                                                        {{ item.name.charAt(0) }}
                                                                        {{ item.surname.charAt(0) }}
                                                                    </v-list-item-avatar>
                                                                    <v-list-item-content>
                                                                        <v-list-item-title>
                                                                            {{ item.name }} &nbsp;{{ item.surname }}
                                                                        </v-list-item-title>
                                                                        <v-list-item-subtitle
                                                                            v-text="item.identification_number"></v-list-item-subtitle>
                                                                    </v-list-item-content>
                                                                    <v-list-item-action>
                                                                        <v-icon>mdi-account-circle</v-icon>
                                                                    </v-list-item-action>
                                                                </template>

                                                            </v-autocomplete>
                                                        </v-col>

                                                        <v-col cols="12" md="4" sm="6">
                                                            <v-autocomplete
                                                                v-model="attendant_student.relationship"
                                                                :items="relations"
                                                                :rules="[rules.required]"
                                                                label="Parentesco con el estudiante"
                                                                outlined
                                                            ></v-autocomplete>
                                                        </v-col>

                                                        <v-col cols="12" md="4" sm="6">
                                                            <v-text-field
                                                                v-if="attendant_student.relationship === 'Otro'"
                                                                v-model="attendant_student.other_relationship"
                                                                label="Otro parentesco"
                                                                outlined
                                                            ></v-text-field>
                                                        </v-col>
                                                    </v-row>
                                                </div>
                                            </v-expand-transition>

                                        </section>

                                        <v-row>
                                            <v-col class="d-flex justify-center align-center">
                                                <v-switch
                                                    v-model="habeasData"
                                                ></v-switch>
                                                <a @click.stop="dialog = true">
                                                    Acepto el tratamiento de la información personal.
                                                </a>
                                            </v-col>
                                        </v-row>
                                    </div>
                                </div>

                                <div class="d-flex justify-end">

                                    <v-btn v-if="!edit"
                                           :disabled="!valid || !habeasData"
                                           class="primary mx-1"
                                           @click="save(person)">
                                        Guardar
                                    </v-btn>

                                    <v-btn v-if="edit" class="primary x-1"
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


        <v-dialog
            v-model="dialog"
            max-width="8.5in"
        >
            <v-card>
                <v-card-title>
                    Autorización para el tratamiento y uso de datos personales.
                </v-card-title>

                <v-card-text class="text-justify">
                    De conformidad con lo previsto en la Ley 1581 de 2012 “por la cual se dictan las disposiciones
                    generales para la protección de datos personales” y el Decreto 1377 de 2013, que la reglamentan
                    parcialmente, manifiesto que otorgo mi autorización expresa y clara para que el
                    <span class="font-weight-bold">
                        CENTRO DE GESTIÓN TECNOLÓGICA DE LOS LLANOS (Ceindetec Llanos),
                    </span>
                    pueda
                    hacer tratamiento y uso de mis datos personales, los cuales estarán reportados en la base de datos
                    de la que es responsable dicha organización y que han sido recolectados en las relaciones
                    contractuales que ésta realiza en desarrollo de su objeto social.

                    De acuerdo a la normatividad citada, Ceindetec Llanos queda autorizado de manera expresa e
                    inequívoca
                    para mantener y manejar la información suministrada, solo para aquellas finalidades para las que se
                    encuentra facultado y respetando en todo caso, la normatividad vigente sobre protección de datos
                    personales.

                    No obstante la presente autorización, me reservo el derecho a ejercer en cualquier momento la
                    posibilidad de conocer, actualizar, rectificar y solicitar la supresión de mis datos personales en
                    la base de datos de la organización, cuando así lo estime conveniente.

                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>

                    <v-btn
                        color="green darken-1"
                        text
                        @click="setHabeasData(false)"
                    >
                        Discrepar
                    </v-btn>

                    <v-btn
                        color="green darken-1"
                        text
                        @click="setHabeasData(true)"

                    >
                        Aceptar
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <spinner-component :value="saving"></spinner-component>

    </div>

</template>

<script>

import {VueEditor} from "vue2-editor";
import SpinnerComponent from "@/Components/SpinnerComponent.vue";
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
        value: Object,
        edit: Boolean,
        open: {
            type: Boolean,
            default: false
        },
        close: Function,
        errors: Object,
        establishment_id: {
            type: Number,
            default: -1
        },
        headquarter_id: {
            type: Number,
            default: -1
        },


    },
    data() {
        return {
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
            typePeople: [
                'Estudiante',
                'Docente',
                'Acudiente',
                'Administrativo',
                'Coordinador',
                'Director',
                'Rector',
            ],
            valid: false,
            menu1: null,
            person: this.$inertia.form({
                "name": "María",
                "surname": "González",
                "gender": "Femenino",
                "identification_type": "Cédula de ciudadanía",
                "identification_number": "123456789",
                "birthday_date": "1990-01-01",
                "ethnic_group": "Afrodescendiente",
                "email": "maria.gonzalez@example.com",
                "phone": "1234567890",
                "blood_type": "O+",
                "person_type": "Estudiante",
                "department": "Antioquia",
                "municipality": "Medellín",
                "direction": "Calle 10 # 35-45",

                /* name: '',
                 surname: '',
                 gender: '',
                 identification_type: '',
                 identification_number: '',
                 birthday_date: '',
                 ethnic_group: '',
                 email: '',
                 phone: '',
                 blood_type: '',
                 person_type: '',
                 department: '',
                 municipality: '',
                 direction: '',*/
                establishment_id: '',
                headquarter_id: '',
                profile_photo_path: '',
            }),
            defaultPerson: this.$inertia.form({
                name: '',
                surname: '',
                gender: '',
                identification_type: '',
                identification_number: '',
                birthday_date: '',
                ethnic_group: '',
                email: '',
                phone: '',
                blood_type: '',
                person_type: '',
                department: '',
                municipality: '',
                direction: '',
                establishment_id: '',
                headquarter_id: '',
                profile_photo_path: '',
            }),
            attendant_student: {
                relationship: '',
                other_relationship: '',
                attendant_id: '',
                student_id: '',
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
                {title: 'Editar', icon: 'mdi-playlist-edit', route: 'home'},
                {title: 'Eliminar', icon: 'mdi-playlist-remove', route: 'home'},
                {title: 'Crear', icon: 'mdi-playlist-plus', route: 'home'},
                {title: 'Salir', icon: 'mdi-close', route: 'home'},
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
            establishments: [],
            headquarters: [],
            step: 1,
            habeasData: false,
            dialog: false,
            blood_types: [
                "A+",
                "B+",
                "O+",
                "AB+",
                "A-",
                "B-",
                "O-",
                "AB-"
            ],
            relations: [
                "Madre",
                "Padre",
                'Abuelo',
                'Abuela',
                "Hermano",
                "Hermana",
                "Tio",
                "Tia",
                "Esposa",
                "Esposo",
                'Otro'
            ],
            people: null,
            isLoading: false,
            search: null,
        }
    },
    created() {
        for (const item in colombiaJson) {
            this.departments.push(colombiaJson[item].departamento);
        }
        this.departments = this.departments.sort();

        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            });

        if (this.edit === true) {
            this.person = this.value
            this.getByPersonType()
        }

        if (this.establishment_id > -1) {
            this.person.establishment_id = this.establishment_id
            this.$nextTick(() => {
                this.getAllHeadquarters()
                this.person.headquarter_id = this.headquarter_id
            })
        }
    },
    watch: {
        search(val) {
            // Items have already been loaded
            if (this.people !== null) {
                if (this.people.length > 0) return
            }

            // Lazily load input items
            this.getByPersonType();

        },
    },
    computed: {

        currentTitle() {
            switch (this.step) {
                case 1:
                    return 'Información Personal'
                case 2:
                    return 'Información de contacto'
                default:
                    return 'Información de localización'
            }
        },
        isEdit() {
            this.reset
            if (this.edit === true) {
                this.person = this.value
                this.getAllHeadquarters()
            }
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
        getMinDate() {
            let fecha = new Date(Date.now());
            fecha.setFullYear(fecha.getFullYear() - 70)
            return fecha.toISOString().slice(0, 10)
        },
        getMaxDate() {
            let fecha = new Date(Date.now());
            fecha.setFullYear(fecha.getFullYear() - 4)
            return fecha.toISOString().slice(0, 10)
        },
        getAllHeadquarters() {
            let id = this.person.establishment_id;

            if (id !== null) {
                axios.get(`/dashboard/establishment/${id}/headquarters`)
                    .then((response) => {
                        this.headquarters = response.data
                    })
                    .catch((error) => {
                        console.log(error)
                    })
            }

        },

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

            }
        },

        closeModal() {
            this.reset()
            this.close();
        },

        reset: function () {
            this.person = this.defaultPerson
            this.resetValidation();
        },

        resetValidation() {
            this.$refs.form.resetValidation()
        },

        save: async function (data) {
            this.saving = true;
            if (!this.validate() && !this.valid) {
                this.$swal.fire(
                    "Campos Obligatorio!",
                    "Ingresa los campos obligatorios o verifica que el formato sea correcto",
                    "error"
                )
                this.saving = false;
            } else {
                const response = await this.registerPerson(data);

                if (this.person.person_type === 'Estudiante') {
                    this.registerAttendantForStudents(response);
                }
            }

        },

        registerPerson(data) {
            let form = new FormData()
            for (const key in data) {
                form.set(key, data[key])
            }

            this.$inertia.post('/dashboard/person/add', form, {
                onSuccess: (response) => {
                    let res = response.data;
                    console.log(response)
                    let text = "";

                    this.$swal({
                        icon: 'success',
                        title: '¡Buen trabajo!',
                        text: response.props.flash.message
                    }).then(result => {
                        this.saving = false;
                        if (result.isConfirmed) {
                            this.headquarters = this.defaultHeadquarters;
                            this.reset();
                            this.resetValidation();
                            //this.$inertia.get(this.route('person.index'));
                        }
                    });
                    return response;

                },
                onError: error => {
                    //console.log(error);
                    this.saving = false;
                    console.log(error)
                    const array = error.message;
                    let text = "";
                    for (var clave in array) {
                        text += clave + ": " + array[clave] + "\n ";
                    }
                    this.$swal.fire("Error!", text, "error");
                    console.log(text);
                    return null;
                },
                onFinish: visit => {
                    this.saving = false;

                    if (this.establishment_id > -1) {
                        this.person.establishment_id = this.establishment_id
                        this.$nextTick(() => {
                            this.getAllHeadquarters()
                            this.person.headquarter_id = this.headquarter_id
                        })
                    }
                },
            });
            return null;
        },

        registerAttendantForStudents: function (response) {
            const personId = response.props.person_id;
            let data = this.attendant_student;
            data.student_id = personId;
            this.$inertia.post('/dashboard/person/add/attendant', data, {
                onSuccess: (response) => {
                    console.log(response)
                    this.$swal({
                        icon: 'success',
                        title: '¡Buen trabajo!',
                        text: response.props.flash.message
                    }).then(result => {
                        this.saving = false;
                        if (result.isConfirmed) {
                            this.headquarters = this.defaultHeadquarters;
                            this.reset();
                            this.resetValidation();
                            //this.$inertia.get(this.route('person.index'));
                        }
                    });
                },
                onFinish: visit => {
                    this.saving = false;

                    if (this.establishment_id > -1) {
                        this.person.establishment_id = this.establishment_id
                        this.$nextTick(() => {
                            this.getAllHeadquarters()
                            this.person.headquarter_id = this.headquarter_id
                        })
                    }
                },
            });
        },

        update: function (data) {
            data._method = 'PUT';
            let formData = new FormData()
            for (const key in data) {
                formData.set(key, data[key])
            }

            form.post(`/dashboard/person/update/${data.id}`, formData, {
                onSuccess: response => {
                    console.log(response)
                    let text = "";
                    if (Object.keys(response.props.errors).length > 0) {
                        console.log('errors => ', response.props.errors)
                        for (var clave in this.response.props.errors) {
                            text += clave + ": " + this.response.props.errors[clave] + "\n ";
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
                            text: response.props.flash.message
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.reset();
                                this.resetValidation();
                                this.$inertia.get(this.route('person.index'));
                            }
                        });

                        this.reset();
                        this.closeModal();
                        this.editMode = false;
                    }
                },
                onError: errors => {
                    console.log(errors)
                    let errorsMessage = Object.values(errors).join('<br>')

                    this.$swal({
                        icon: 'error',
                        title: 'Ups...',
                        html: errorsMessage
                    })
                },
            })
        }
        ,
        getImg() {
            if (this.edit) {
                if (this.value.profile_photo_path !== null)
                    return `/storage/${this.value.profile_photo_path}`;
                else
                    return `/src/avatar/null/null/${this.value.gender}.jpg`;
            } else {
                return ''
            }
        }
        ,
        getCities(department) {
            try {
                return colombiaJson.filter(
                    function (colombiaJson) {
                        return colombiaJson.departamento === department;
                    }
                )[0].ciudades;

            } catch (e) {
                return [];
            }
        }
        ,
        setHabeasData(val) {
            this.habeasData = val
            this.dialog = false
        },
        showMoreOptions(type) {

        },
        getByPersonType() {
            let type = "Acudiente";
            this.isLoading = true
            axios.get(`/dashboard/person/${this.person.headquarter_id}/${type}/all`)
                .then(res => {
                    console.log('resultado', res)
                    this.people = res.data
                })
                .catch(err => {
                    console.log(err)
                })
                .finally(() => (this.isLoading = false))
        }
    }
}
</script>

<style>
#picture-input > div > div {
    box-shadow: 0 3px 1px -2px rgb(0 0 0 / 20%), 0 2px 2px 0 rgb(0 0 0 / 14%), 0 1px 5px 0 rgb(0 0 0 / 12%);
}
</style>
