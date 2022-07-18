<template>
    <app-layout>
        <bread-crumbs name="Gestión de los Miembros de la Comunidad educativa" :items="items"></bread-crumbs>

        <v-container fluid>
            <div>
                <v-row class="row">
                    <v-col class="col-sm-6 col-md-5 col-12">
                        <v-row class="row">
                            <v-col class="col col-12">
                                <v-card class=" ma-1 theme--light" style="min-height: 282px;">
                                    <v-card-text class="pa-5 pt-9 fill-height">
                                        <v-row class="fill-height no-gutters">
                                            <v-col
                                                class="d-flex justify-center align-center flex-column col-sm-5 col-xl-6 col-12">
                                                <div class="">
                                                    <v-img size="182"
                                                           cover
                                                           class="elevation-4 rounded-circle"
                                                           height="172"
                                                           width="172"
                                                           :src="data.profile_photo_path!==null?`/storage/${data.profile_photo_path}`:`/src/avatar/null/null/${data.gender}.jpg`"
                                                           :alt="$page.user.name"
                                                    />

                                                </div>
                                                <v-chip
                                                    class="mr-2 my-4 mb-sm-0 error"
                                                    small
                                                    light>
                                                    {{ data.person_type }}
                                                </v-chip>
                                            </v-col>
                                            <v-col
                                                class="pl-0 pl-sm-4 d-flex flex-column align-center align-sm-start col-sm-7 col-xl-6 col-12">
                                                <p class="font-weight-regular">
                                                    {{ data.name }}
                                                    {{ data.surname }}
                                                </p>

                                                <p class="font-weight-regular">
                                                    {{ data.ethnic_group }}
                                                </p>

                                                <p class="ma-0">
                                                    {{ data.identification_type }}
                                                    {{ data.identification_number }}
                                                </p>

                                                <p class="ma-0">
                                                    {{ getDate(data.birthday_date) }}
                                                </p>
                                                <p class="ma-0">
                                                    {{ getYearsOld(data.birthday_date) }} Años
                                                </p>

                                                <p class="ma-0">
                                                    {{ data.gender }}
                                                </p>

                                                <a :href="`tel:${data.phone}`"
                                                   class="body-1">
                                                    {{ data.phone }}
                                                </a>
                                                <a :href="`mailto:${data.email}`"
                                                   class="body-1">
                                                    {{ data.email }}
                                                </a>


                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                        </v-row>
                    </v-col>
                </v-row>
            </div>

            <v-list
                three-line
                subheader
            >
                <v-subheader>User Controls</v-subheader>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title>Content filtering</v-list-item-title>
                        <v-list-item-subtitle>Set the content filtering level to restrict apps that can be downloaded
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title>Password</v-list-item-title>
                        <v-list-item-subtitle>Require password for purchase or use password to restrict purchase
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
            <v-divider></v-divider>
            <v-list
                three-line
                subheader
            >
                <v-subheader>General</v-subheader>
                <v-list-item>
                    <v-list-item-action>
                        <v-checkbox v-model="notifications"></v-checkbox>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Notifications</v-list-item-title>
                        <v-list-item-subtitle>Notify me about updates to apps or games that I downloaded
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-action>
                        <v-checkbox v-model="sound"></v-checkbox>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Sound</v-list-item-title>
                        <v-list-item-subtitle>Auto-update apps at any time. Data charges may apply
                        </v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-action>
                        <v-checkbox v-model="widgets"></v-checkbox>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Auto-add widgets</v-list-item-title>
                        <v-list-item-subtitle>Automatically add home screen widgets</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-container>
        {{ data }}
        <v-container>
            <v-row>
                <v-col class="col-lg-3">
                    <v-card class="rounded-lg">
                        <div class="px-4 pt-3 pb-0">
                            <v-list dense rounded>
                                <v-list-item-group
                                    v-model="selectedItem"
                                    color="primary"
                                    class="rounded-sm"
                                >
                                    <v-list-item class="px-3 py-1 rounded-lg mb-2"
                                                 v-for="(item, i) in list"
                                                 :key="i"
                                    >
                                        <v-list-item-icon>
                                            <v-icon v-text="item.icon"></v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title v-text="item.text"></v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </v-list-item-group>
                            </v-list>
                        </div>
                    </v-card>
                </v-col>
                <v-col class="col-lg-9">
                    <v-card class=" px-4 py-4 rounded-lg">
                        <v-row class="row">
                            <v-col class="col col-auto">
                                <v-avatar class="shadow rounded-circle"
                                          size="75">
                                    <v-img
                                        cover
                                        class="elevation-4 rounded-circle"

                                        :src="data.profile_photo_path!==null?`/storage/${data.profile_photo_path}`:`/src/avatar/null/null/${data.gender}.jpg`"
                                        :alt="$page.user.name"
                                    />
                                </v-avatar>
                            </v-col>
                            <v-col class="my-auto col-auto">
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
                            <div class="my-sm-auto ms-sm-auto me-sm-0 mx-auto mt-3 col-md-6 col-lg-4 col">
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
                                <v-col class="col col-6">
                                    <label class="text-sm text-body">Nombres</label>

                                    <p class="text-sm text-body-1">
                                        {{ data.name }}
                                    </p>
                                </v-col>
                                <div class="col col-6">
                                    <label class="text-sm text-body">Apellidos</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.surname }}
                                    </p>
                                </div>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row class="mt-0">
                                <v-col class="col-sm-4 col-12">
                                    <label class="text-sm text-body">Genero</label>
                                    <p class="text-sm text-body-1">
                                        {{ data.gender }}
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
                                    <label class="text-sm text-body">Direccion de residencia</label>
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
        switch1: true
    }),
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
