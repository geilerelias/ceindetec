<template>
    <simple-layout>
        <template v-slot:header>
            <p class="text-h5 white--text font-weight-bold text-uppercase text-center ma-12">
                Buscar y Mostrar
            </p>
        </template>

        <v-main>
            <v-container>
                <h1 class="text-h4 font-weight-bold mb-0 text-left">Buscar y mostrar </h1>
                <div class="primary--text text-subtitle-1 font-weight-bold mb-4 text-left">
                    Ingresa el serial del código a Buscar
                </div>
                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-10">
                    A partir del consecutivo <span class="font-weight-bold text--primary">CONV005-</span> ingresa el
                    serial correspondiente para consultar y modificar, si este se encuentra registrado; de ser así,
                    automáticamente
                    el sistema te mostrara la información para posteriormente actualizar.
                </p>
                <div>
                    <div class="ma-auto position-relative" style="max-width: 300px">
                        <v-otp-input
                            v-model="otp"
                            :disabled="loading"
                            @finish="onFinish"
                        ></v-otp-input>
                        <v-overlay absolute :value="loading">
                            <v-progress-circular
                                indeterminate
                                color="primary"
                            ></v-progress-circular>
                        </v-overlay>
                    </div>

                    <div v-if="qrCode!==null">
                        <v-row class="d-flex justify-center">
                            <v-col class="col-md-8 col-12">
                                <v-card class="h-full d-flex flex-column">

                                    <v-card-title class="d-flex justify-space-around pt-1 pb-0 mb-0">
                                        <logo :tile="true" :light="false" color="primary"
                                              :width="80"></logo>
                                        <logo :tile="true" :light="false" color="primary" :width="80"
                                              src="logoAlcaldia"></logo>
                                    </v-card-title>

                                    <v-card-text class="pa-3 flex-grow-1">
                                        <div class="d-flex align-center flex-column">
                                            <v-avatar tile size="150" color="">
                                                <qrcode-vue class=""
                                                            :value="`http://sigac.almaguajira.com/qrcode/${qrCode.consecutive}`"
                                                            :size="150"
                                                            level="H"/>
                                            </v-avatar>
                                            <div class="text-center mt-2">
                                                <div class="font-weight-bold text-body-2">
                                                    {{ qrCode.consecutive }}
                                                </div>
                                            </div>
                                            <div class="d-flex  justify-space-around">
                                                <div>
                                                    <v-input label="Estado:"></v-input>
                                                </div>
                                                &nbsp;
                                                <v-chip v-if="qrCode.status=='inactive'" small
                                                        class="font-weight-bold  accent">
                                                    {{ qrCode.status }}
                                                </v-chip>
                                                <v-chip v-else small
                                                        class="font-weight-bold secondary">
                                                    {{ qrCode.status }}
                                                </v-chip>

                                            </div>
                                        </div>
                                        <div v-if="qrCode.status!=='inactive'">
                                            <div>
                                                Descripción:
                                                <div class="font-weight-black text--primary description"
                                                     v-html="qrCode.description ">

                                                </div>
                                            </div>
                                            <div>
                                                Establecimiento:
                                                <span class="font-weight-black text--primary">
                                            {{ getEstablishment(qrCode.establishment_id) }}
                                        </span>
                                            </div>
                                            <div>
                                                Sede:
                                                <span class="font-weight-black text--primary">
                                            {{ getHeadquarters(qrCode.headquarters_id) }}
                                        </span>
                                            </div>
                                        </div>
                                    </v-card-text>

                                    <v-divider></v-divider>

                                    <v-card-actions style="height: 50px">
                                        <v-spacer></v-spacer>
                                        <v-btn text fab small
                                               class="mr-3"
                                               @click="showEditDialog(qrCode)">
                                            <v-icon>mdi-text-box-edit-outline</v-icon>
                                        </v-btn>
                                    </v-card-actions>
                                </v-card>
                            </v-col>
                        </v-row>

                    </div>

                    <v-snackbar
                        v-model="snackbar"
                        :color="snackbarColor"
                        :timeout="2000"
                    >
                        {{ text }}
                    </v-snackbar>
                </div>
            </v-container>

            <div>
                {{ $page.auth.roles[0] === 'Admin' ? true : false }}
                <br>
                {{ $page.auth.permissions[0] === 'view dashboard' ? true : false }}
                <br>
                {{ $page.auth.permissions }}
                {{ $page.auth.permissions.find(element => element > 'view dashboard') }}
                {{ $page.auth.permissions.find(element => element > 'Ver dashboard') }}
            </div>

        </v-main>
        <v-row justify="center">
            <v-dialog
                v-model="dialog"
                fullscreen
                hide-overlay
                transition="dialog-bottom-transition"
                persistent
            >
                <v-card class="rounded-0">
                    <v-toolbar
                        dark
                        color="primary"
                        height="100"
                    >
                        <v-toolbar-title>
                            <div
                                class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                                Actualización de información
                            </div>
                            <div class="text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                                CONVENIO DE COOPERACIÓN No 005 2021
                            </div>
                        </v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-btn
                            icon
                            dark
                            @click="closeDialog()"
                        >
                            <v-icon>mdi-close</v-icon>
                        </v-btn>
                    </v-toolbar>
                    <v-toolbar dense class="secondary" max-height="10"></v-toolbar>
                    <edit v-if="editItem!==null" :data="editItem"></edit>
                </v-card>
            </v-dialog>
        </v-row>


    </simple-layout>
</template>

<script>
import simpleLayout from "@/Layouts/SimpleLayout";
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'
import logo from "@/Components/Logo";
import SimpleLayout from "@/Layouts/SimpleLayout";
import edit from "./Edit";

export default {
    name: "SearchEdit",
    components: {
        SpinnerComponent,
        QrcodeVue,
        SimpleLayout,
        logo,
        simpleLayout,
        edit
    },
    data: () => ({
        loading: false,
        snackbar: false,
        snackbarColor: 'default',
        otp: '',
        text: '',
        expectedOtp: '133707',
        qrCode: null,
        establishments: [],
        headquarters: [],
        dialog: false,
        editItem: null
    }),
    created() {
        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            });

        axios.get(`/dashboard/headquarters/all`)
            .then((response) => {
                console.log(response.data)
                this.headquarters = response.data
            })
    },
    methods: {
        getEstablishment(id) {
            try {
                let found = this.establishments.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getHeadquarters(id) {
            try {
                let found = this.headquarters.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
        showEditDialog(item) {
            this.editItem = item
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.editItem = null
        },
        onFinish(rsp) {
            this.loading = true
            this.qrCode = null
            axios.get(`/qrcode/search/CONV005-${rsp}`)
                .then(response => {
                    this.qrCode = response.data
                    this.loading = false
                    this.snackbarColor = 'success'
                    this.text = `Búsqueda exitosa de consecutivo "CONV005-${rsp}" (${this.snackbarColor})`
                    this.snackbar = true
                })
                .catch(error => {
                    console.log(error)
                    this.loading = false
                    this.snackbarColor = 'error'
                    this.text = `Búsqueda errónea de consecutivo "CONV005-${rsp}" (${this.snackbarColor})`
                    this.snackbar = true
                })
        },
    },
}
</script>

<style scoped>
.position-relative {
    position: relative;
}
</style>
<style>
.description > ul > li {
    list-style-type: circle;
}
</style>
