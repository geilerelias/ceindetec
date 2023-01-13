<template>
    <simple-layout :extension="false">
        <template v-slot:header>
            <p class="fill-height text-sm-h5  text-body-2 white--text font-weight-bold text-uppercase text-right  d-flex align-center mr-2 pt-5">
                Registro de información personal
            </p>
        </template>

        <v-main class="grey lighten-3 fill-height">
            <v-container>
                <h1 class="text-h4 font-weight-bold mb-0 text-left">Registrar datos </h1>
                <div class="primary--text text-subtitle-1 font-weight-bold mb-4 text-left">
                    Ingresar información de los miembros de la comunidad educativa
                </div>
                <div class="base-body text-body-1 grey--text text--darken-1 text-left">
                    A continuación, encontrará un formulario en el cual deberás seleccionar la información pertinente al
                    establecimiento educativo y la sede de la cual eres miembro.
                </div>
                <div class="base-body text-body-1 grey--text text--darken-1 text-left">
                    Se les solicita encarecidamente ingresar por sede la información de
                    miembros de la comunidad educativa.
                    <br>
                    Los miembros a registrar son los siguiente:
                </div>

                <ul style="list-style-type: disc !important;">
                    <li class="font-weight-bold text--primary">
                        Rector o Director
                    </li>
                    <li class="font-weight-bold text--primary">
                        Coordinador
                    </li>
                    <li class="font-weight-bold text--primary">
                        Mínimo dos (2) Docentes
                    </li>
                    <li class="font-weight-bold text--primary">
                        Mínimo tres (3) Estudiantes con sus acudientes
                    </li>
                </ul>

                <p>
                    No olvidar especificar el rol del mismo dentro del establecimiento.
                </p>

                <v-row>
                    <v-col cols="12" md="4" class="mx-auto">
                        <v-card rounded="lg">
                            <v-card-subtitle>
                                Selecciona el establecimiento educativo y la sede a la que pertenece e ingresa la
                                información
                            </v-card-subtitle>
                            <v-card-text>
                                <v-col class="col-12">
                                    <v-autocomplete
                                        v-model="establishments_id"
                                        :items="establishments"
                                        item-text="name"
                                        item-value="id"
                                        label="Establecimiento al que pertenece"
                                        @change="getHeadquarters"
                                        :rules="[rules.required]"
                                        outlined>
                                    </v-autocomplete>
                                </v-col>
                                <v-col class="col-12">
                                    <v-autocomplete
                                        :disabled="establishments_id===null"
                                        v-model="headquarters_id"
                                        :items="headquarters"
                                        item-text="name"
                                        item-value="id"
                                        label="Sede a la que pertenece"
                                        @change="getPeople"
                                        :rules="[rules.required]"
                                        outlined>
                                    </v-autocomplete>
                                </v-col>
                            </v-card-text>
                            <v-card-actions>
                                <v-btn
                                    :disabled="headquarters_id===null"
                                    @click="create()"
                                    block
                                    class="success">
                                    <v-icon class="notranslate mr-2">
                                        mdi-plus
                                    </v-icon>
                                    Crear miembro
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-col>
                    <v-col v-if="people.length>0" transition="slide-x-reverse-transition">
                        <v-card
                            min-height="70vh"
                            rounded="lg"
                        >
                            <v-card-text>
                                <v-list three-line>
                                    <template v-for="(person, n) in people">

                                        <v-list-item :key="person.id">
                                            <v-list-item-avatar>
                                                <img class="rounded-circle" cover
                                                     :src="person.profile_photo_path==='' ||person.profile_photo_path===null?`https://ui-avatars.com/api/?name=${person.name+person.surname}&color=7F9CF5&background=EBF4FF`:'/storage/'+person.profile_photo_path"></img>
                                            </v-list-item-avatar>

                                            <v-list-item-content>
                                                <v-list-item-title class="d-flex">
                                                    {{ person.name }} {{ person.surname }}
                                                    <v-spacer></v-spacer>
                                                    {{ person.identification_type }}
                                                    {{ person.identification_number }}
                                                </v-list-item-title>
                                                <v-list-item-subtitle>
                                                    {{ person.email }}
                                                </v-list-item-subtitle>
                                                <v-list-item-subtitle>
                                                    {{ getYearsOld(person.birthday_date) }} años
                                                </v-list-item-subtitle>
                                                <v-list-item-subtitle>
                                                    {{ person.direction }}
                                                    {{ person.municipality }}
                                                    {{ person.department }}
                                                </v-list-item-subtitle>
                                                <v-list-item-content>
                                                    <div class="font-weight-bold">{{ person.person_type }}</div>
                                                </v-list-item-content>
                                            </v-list-item-content>
                                        </v-list-item>
                                        <v-divider inset></v-divider>
                                    </template>
                                </v-list>
                            </v-card-text>
                        </v-card>
                    </v-col>
                </v-row>
            </v-container>
            <create-person v-if="isOpen" :close="closeModal" :open="isOpen" :edit="editMode" :value="form"
                           :headquarter_id="headquarters_id" :establishment_id="establishments_id"></create-person>

        </v-main>

    </simple-layout>
</template>

<script>
import simpleLayout from "@/Layouts/SimpleLayout.vue";
import createPerson from "@/Pages/Dashboard/Person/CreateEdit.vue"

export default {
    name: "AddInformation",
    components: {
        simpleLayout,
        createPerson
    },
    data: () => ({
        links: [
            'Dashboard',
            'Messages',
            'Profile',
            'Updates',
        ],
        editMode: false,
        isOpen: false,
        form: null,
        establishments_id: null,
        headquarters_id: null,
        establishments: [],
        headquarters: [],
        people: [],
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
    }),
    created() {
        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            });
    },
    methods: {
        getYearsOld(dateString) {
            let hoy = new Date()
            let fechaNacimiento = new Date(dateString)
            let edad = hoy.getFullYear() - fechaNacimiento.getFullYear()
            let diferenciaMeses = hoy.getMonth() - fechaNacimiento.getMonth()
            if (
                diferenciaMeses < 0 ||
                (diferenciaMeses === 0 && hoy.getDate() < fechaNacimiento.getDate())
            ) {
                edad--
            }
            return edad
        },
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.editMode = false;
        },
        create: function () {
            this.editMode = false;
            this.openModal();
        },
        getHeadquarters() {
            let id = this.establishments_id;

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
        getPeople() {
            axios
                .get(`/dashboard/person/${this.headquarters_id}/all`)
                .then((response) => {
                    console.log(response.data)
                    this.people = response.data
                })
                .catch((error) => {
                    console.log(error)
                })
        }
    }
}
</script>

<style scoped>

</style>
