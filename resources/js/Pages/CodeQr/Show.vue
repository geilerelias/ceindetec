<template>
    <simple-layout>
        <template v-slot:header>
            <div class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                Detalle de código
            </div>
            <div class="text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                CONVENIO DE COOPERACIÓN No 005 2021
            </div>
        </template>

        <v-container>

            <v-row class="d-flex justify-center">
                <v-col class="col-md-4 col-12">
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
                                                :value="`http://sigac.almaguajira.com/qrcode/${data.consecutive}`"
                                                :size="150"
                                                level="H"/>
                                </v-avatar>
                                <div class="text-center mt-2">
                                    <div class="font-weight-bold text-body-2">
                                        {{ data.consecutive }}
                                    </div>
                                </div>
                                <div class="d-flex  justify-space-around">
                                    <div>
                                        <v-input label="Estado:"></v-input>
                                    </div>
                                    &nbsp;
                                    <v-chip v-if="data.status=='inactive'" small
                                            class="font-weight-bold  accent">
                                        {{ data.status }}
                                    </v-chip>
                                    <v-chip v-else small
                                            class="font-weight-bold secondary">
                                        {{ data.status }}
                                    </v-chip>

                                </div>
                            </div>
                            <div v-if="data.status!=='inactive'">
                                <div>
                                    Descripción:
                                    <div class="font-weight-black text--primary description" v-html="data.description ">

                                    </div>
                                </div>
                                <div>
                                    Establecimiento:
                                    <span class="font-weight-black text--primary">
                                            {{ getEstablishment(data.establishment_id) }}
                                        </span>
                                </div>
                                <div>
                                    Sede:
                                    <span class="font-weight-black text--primary">
                                            {{ getHeadquarters(data.headquarters_id) }}
                                        </span>
                                </div>
                            </div>
                        </v-card-text>

                        <v-divider></v-divider>

                        <v-card-actions style="height: 50px">
                            <v-spacer></v-spacer>
                            <v-btn text fab small
                                   class="mr-3"
                                   @click="showEditDialog(data)">
                                <v-icon>mdi-text-box-edit-outline</v-icon>
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-col>
            </v-row>

        </v-container>

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
import SpinnerComponent from "@/Components/SpinnerComponent.vue";
import QrcodeVue from 'qrcode.vue'
import logo from "@/Components/Logo.vue";
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import edit from "./Edit.vue";

export default {
    name: "Show",
    props: ['data'],
    components: {
        SpinnerComponent,
        QrcodeVue,
        SimpleLayout,
        logo,
        edit
    },
    data: () => ({
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
    }
}
</script>

<style>
.description > ul > li {
    list-style-type: circle;
}
</style>
