<template>
    <v-app>
        <v-form
            ref="form"
            v-model="valid">

            <v-card-title class="align-start">

                <div class="mx-auto text-center d-flex flex-column">
                    <div class="mx-auto text-h5 primary--text  font-weight-black">
                        Registro de nuevo miembro
                    </div>
                    <div class="mx-auto text-justify light-indigo--text">
                        Formulario para el registro de nuevo miembro de la comunidad educativa en el sistema
                    </div>
                </div>

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
                            <v-row class="mb-2">


                                <v-col sm="6">
                                    <v-text-field
                                        v-model="person.name"
                                        :rules="[rules.required,rules.text(person.name,'nombre')]"
                                        label="Nombres"
                                        outlined
                                    ></v-text-field>
                                </v-col>
                                <v-col sm="6">
                                    <v-text-field
                                        v-model="person.surname"
                                        :rules="[rules.required,rules.text(person.surname,'Apellido')]"
                                        label="Apellidos"
                                        outlined
                                    ></v-text-field>
                                </v-col>

                                <v-col class="col-sm-4">
                                    <v-autocomplete
                                        v-model="person.gender"
                                        :items="['Femenino','Masculino','Prefiero no decirlo']"
                                        :rules="[rules.required]"
                                        label="Género"
                                        outlined
                                    ></v-autocomplete>
                                </v-col>

                                <v-col class="  col-sm-4">
                                    <v-autocomplete
                                        v-model="person.identification_type"
                                        :items="tiposDocumentos"
                                        :rules="[rules.required]"
                                        item-text="text"
                                        item-value="value"
                                        label="Tipo de identificación"
                                        outlined
                                    ></v-autocomplete>
                                </v-col>

                                <v-col class="  col-sm-4">
                                    <v-text-field
                                        v-model="person.identification_number"
                                        :rules="[rules.required,rules.number]"
                                        label="Numero de identificación"
                                        outlined
                                    ></v-text-field>
                                </v-col>
                                <v-col class="  col-sm-2">
                                    <v-autocomplete label="Tipo de sangre"
                                                    v-model="person.blood_type"
                                                    :items="blood_types"
                                                    outlined>

                                    </v-autocomplete>
                                </v-col>

                                <v-col class="  col-sm-4">
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
                                            :max="getMaxDate()"
                                            :min="getMinDate()"
                                        ></v-date-picker>
                                    </v-menu>
                                    <div v-if="$page.errors.starts_at" class="text-red-500">{{
                                            $page.errors.starts_at[0]
                                        }}
                                    </div>
                                </v-col>

                                <v-col class="  col-sm-6">
                                    <v-autocomplete
                                        v-model="person.ethnic_group"
                                        :items="gruposEtnicos"
                                        :rules="[rules.required]"
                                        label="Grupo Étnico al que pertenece"
                                        outlined
                                    ></v-autocomplete>
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

                            <v-row class="mb-2">
                                <v-col class="col-sm-6">
                                    <v-autocomplete
                                        v-model="person.department"
                                        :items="departments"
                                        :rules="[rules.required]"
                                        label="Departamento *"
                                        outlined
                                        required
                                    ></v-autocomplete>
                                </v-col>
                                <v-col class="col-sm-6">
                                    <v-autocomplete
                                        v-model="person.municipality"
                                        :disabled="person.department===null || person.department===''"
                                        :items="getCities(person.department)"
                                        :rules="[rules.required]"
                                        label="Municipio *"
                                        outlined
                                        required
                                    ></v-autocomplete>
                                </v-col>
                                <v-col class="col-sm-12">
                                    <v-text-field
                                        v-model="person.direction"
                                        :rules="[rules.required]"
                                        label="Dirección de residencia"
                                        outlined
                                    ></v-text-field>
                                </v-col>

                                <v-col class="col-sm-6">
                                    <v-autocomplete
                                        :readonly="establishment_id > -1"
                                        v-model="person.establishment_id"
                                        :items="establishments"
                                        item-text="name"
                                        item-value="id"
                                        label="Establecimiento al que pertenece"
                                        @change="getAllHeadquarters"
                                        :rules="[rules.required]"
                                        outlined>
                                    </v-autocomplete>
                                </v-col>
                                <v-col class="  col-sm-6">
                                    <v-autocomplete
                                        :readonly="headquarter_id > -1"
                                        :disabled="person.establishment_id===null || person.establishment_id===''"
                                        v-model="person.headquarter_id"
                                        :items="headquarters"
                                        item-text="name"
                                        item-value="id"
                                        label="Sede a la que pertenece"
                                        :rules="[rules.required]"
                                        outlined>
                                    </v-autocomplete>
                                </v-col>

                            </v-row>

                        </section>

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
                            <v-row class="mb-2">

                                <v-col sm="6" md="4">
                                    <v-text-field
                                        v-model="person.email"
                                        :rules="[rules.required,rules.email]"
                                        label="Correo electrónico"
                                        outlined
                                    ></v-text-field>
                                </v-col>

                                <v-col sm="6" md="4">
                                    <v-text-field
                                        v-model="person.phone"
                                        :rules="[rules.required,rules.number]"
                                        label="Numero telefónico"
                                        outlined
                                    ></v-text-field>
                                </v-col>
                                <v-col sm="6" md="4">
                                    <v-autocomplete
                                        :disabled="person.headquarter_id===''"
                                        v-model="person.person_type"
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

                                    <v-row class="mb-2">

                                        <v-col sm="6" md="4">
                                            <v-autocomplete
                                                v-model="person.attended_by"
                                                :items="people"
                                                :loading="isLoading"
                                                :search-input.sync="search"
                                                item-value="id"
                                                item-text="name"
                                                :rules="[rules.required]"
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
                                                        v-bind="attr"
                                                        :input-value="selected"
                                                        color="blue-grey"
                                                        class="white--text"
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
                                                        color="indigo"
                                                        class="font-weight-light white--text"
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

                                        <v-col sm="6" md="4">
                                            <v-autocomplete
                                                v-model="person.relationship"
                                                :items="relations"
                                                :rules="[rules.required]"
                                                label="Parentesco con el estudiante"
                                                outlined
                                            ></v-autocomplete>
                                        </v-col>


                                    </v-row>

                                </div>
                            </v-expand-transition>

                        </section>


                    </div>
                </div>


            </v-card-text>

        </v-form>


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

    </v-app>

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
        person: {
            /*name: "Geiler Elias",
            surname: "Radillo Sarmiento",
            gender: "Masculino",
            identification_type: "CC",
            identification_number: "1118855965",
            birthday_date: "1995-05-15",
            ethnic_group: "Comunidades afrocolombianas",
            email: "geilerelias@gmail.com",
            phone: "3106947004",
            person_type: "Administrativo",
            department: "La Guajira",
            municipality: "Riohacha-1",
            direction: "vereda de puertocolombia",
            establishment_id: 1,
            headquarter_id: 1,
            profile_photo_path: "",*/

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
            relationship: '',
            attended_by: '',
            establishment_id: '',
            headquarter_id: '',
            profile_photo_path: '',
        },
        defaultPerson: {
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
            relationship: '',
            attended_by: '',
            establishment_id: '',
            headquarter_id: '',
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
            "Hermano",
            "Hermana",
            "Tio",
            "Tia",
            "Esposa",
            "Esposo",

        ],
        people: null,
        isLoading: false,
        search: null,
    }),
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
        get currentTitle() {
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
                return;
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
                this.$inertia.post('/dashboard/person/add', form, {
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
                                    //this.$inertia.get(this.route('person.index'));
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
                        return colombiaJson.departamento == department;
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
