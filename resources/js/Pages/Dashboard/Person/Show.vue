<template>
    <app-layout>
        <bread-crumbs name="Gestión de los Miembros de la Comunidad educativa" :items="items"></bread-crumbs>

        <v-container>
            <v-row>
                <v-col class="col-lg-9 mx-auto">
                    <v-card class=" px-4 py-4 rounded-lg mx-auto">
                        <v-row class="mx-auto ">
                            <v-col class="d-flex">
                                <div class="mr-6">
                                    <v-avatar class="shadow rounded-circle"
                                              size="75">
                                        <v-img
                                            cover
                                            class="elevation-4 rounded-circle"
                                            :src="data.profile_photo_path!==null?`/storage/${data.profile_photo_path}`:`https://ui-avatars.com/api/?name=${data.name}.&color=7F9CF5&background=EBF4FF`"
                                            :alt="$page.user.name"
                                        />
                                    </v-avatar>
                                </div>
                                <div>
                                    <h5 class="mb-1 text-h5 text-typo font-weight-bold">
                                        {{ data.name }} {{ data.surname }}
                                    </h5>

                                    <p class="mb-0 font-weight-light text-body text-sm">
                                        {{ data.ethnic_group }}
                                    </p>

                                    <p class="mb-0 font-weight-light text-body text-sm">
                                        {{ data.person_type }}
                                    </p>
                                </div>
                            </v-col>
                            <v-spacer></v-spacer>
                            <div class="my-sm-auto  mx-auto mt-3">
                                <div class="d-flex align-center">
                                    <p class="mb-0 text-body text-xs ms-auto">
                                        activar usuario
                                    </p>
                                    <v-switch
                                        class="ml-1"
                                        v-model="switch1"
                                        color="primary"
                                    ></v-switch>
                                </div>
                            </div>
                        </v-row>
                    </v-card>

                    <v-card class="card-shadow rounded-lg mt-6">
                        <div class="px-6 py-6">
                            <h5 class="text-h5 font-weight-bold text-typo">
                                Información personal
                            </h5>
                        </div>
                        <div class="px-6 pb-6 pt-0">
                            <v-row>
                                <v-col>
                                    <label class="text-sm text-body">Nombres</label>

                                    <p class="text-sm text-body-1">
                                        {{ data.name }}
                                    </p>
                                </v-col>

                                <v-col>
                                    <label class="text-sm text-body">Apellidos</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.surname }}
                                    </p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row>
                                <v-col>
                                    <label class="text-sm text-body">Tipo de identificación</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.identification_type }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Numero de identificación</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.identification_number }}
                                    </p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row class="mt-0">
                                <v-col>
                                    <label class="text-sm text-body">Genero</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.gender }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Tipo de sangre</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.blood_type }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Fecha de nacimiento</label>
                                    <p class="text-sm text-body-1">
                                        {{ getDate(data.birthday_date) }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Edad</label>
                                    <p class="text-sm text-body-1">
                                        {{ getYearsOld(data.birthday_date) }} años
                                    </p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                        </div>
                    </v-card>

                    <v-card class="card-shadow rounded-lg mt-6">
                        <div class="px-6 py-6">
                            <h5 class="text-h5 font-weight-bold text-typo">
                                Información de contacto
                            </h5>
                        </div>
                        <div class="px-6 pb-6 pt-0">
                            <v-row>
                                <v-col class="col col-6">
                                    <label class="text-sm text-body">Correo electrónico</label>

                                    <p class="text-sm text-body-1">
                                        {{ data.email }}
                                    </p>
                                </v-col>
                                <div class="col col-6">
                                    <label class="text-sm text-body">Numero de teléfono</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.phone }}
                                    </p>
                                </div>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row class="mt-0">
                                <v-col class="col-sm-4 col-12">
                                    <label class="text-sm text-body">Dirección de residencia</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.phone }}
                                    </p>
                                </v-col>
                                <v-col class="col-sm-4 col-12">
                                    <label class="text-sm text-body">Fecha de nacimiento</label>
                                    <p class="text-sm text-body-1">
                                        {{ getDate(data.birthday_date) }}
                                    </p>
                                </v-col>
                                <v-col class="col-sm-4 col-12">
                                    <label class="text-sm text-body">Edad</label>
                                    <p class="text-sm text-body-1">
                                        {{ getYearsOld(data.birthday_date) }} años
                                    </p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                        </div>
                    </v-card>
                    

                    <v-card class="card-shadow rounded-lg mt-6" v-if="data.attended_by">
                        <div class="px-6 py-6">
                            <h5 class="text-h5 font-weight-bold text-typo">
                                Información de acudientes
                            </h5>
                        </div>
                        <div class="px-6 pb-6 pt-0">
                            <v-row>
                                <v-col>
                                    <label class="text-sm text-body">Nombres de acudiente</label>

                                    <p class="text-sm text-body-1">
                                        {{ attended.name }} {{ attended.surname }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Tipo de parentesco</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.relationship }}
                                    </p>
                                </v-col>
                                <v-col>
                                    <label class="text-sm text-body">Dirección de residencia</label>
                                    <p class="text-sm text-body-1">
                                        {{ attended.direction }}
                                    </p>
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row>
                                <v-col class="col col-6">
                                    <label class="text-sm text-body">Correo electrónico</label>

                                    <p class="text-sm text-body-1">
                                        {{ attended.email }}
                                    </p>
                                </v-col>
                                <div class="col col-6">
                                    <label class="text-sm text-body">Numero de teléfono</label>
                                    <p class="text-sm text-body-1">
                                        {{ attended.phone }}
                                    </p>
                                </div>
                            </v-row>
                        </div>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>

    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout";
import BreadCrumbs from "@/Components/BreadCrumbs";

export default {
    name: "Show",
    components: {
        AppLayout,
        BreadCrumbs,
    },
    props: ['data', 'errors'],
    data: () => ({
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: 'dashboard',
            },
            {
                text: 'Miembros de la comunidad educativa',
                disabled: false,
                href: '/dashboard/person',
            }, {
                text: 'Visualización',
                disabled: true,
                href: '#',
            }
        ],
        selectedItem: 1,
        list: [
            {text: 'Real-Time', icon: 'mdi-clock'},
            {text: 'Audience', icon: 'mdi-account'},
            {text: 'Conversions', icon: 'mdi-flag'},
        ],
        switch1: true,
        attended: null
    }),
    created() {
        if (this.data.attended_by !== null) {
            axios.get(`/dashboard/person/get/${this.data.attended_by}`)
                .then(res => {
                    this.attended = res.data
                })
                .catch(error => {
                    console.log(error)
                })
        }
    },
    methods: {
        getYearsOld(dateString) {
            var today = new Date();
            var birthDate = new Date(dateString);
            console.log(dateString, birthDate)
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age--;
            }
            return age;
        },
        getDate(currentDate) {
            try {
                let date = new Date(currentDate + " 00:00:00").toLocaleDateString("es-ES",
                    {
                        day: 'numeric',
                        month: 'long',
                        year: 'numeric',
                    })
                //console.log(date)
                return date
            } catch (e) {
                //console.log(e)
            }
        },
    }
}
</script>

<style scoped>

</style>
