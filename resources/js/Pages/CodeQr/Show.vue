<template>
    <v-app id="inspire">
        <v-card outlined tile id="no-print-header">
            <v-system-bar></v-system-bar>

            <v-toolbar
                color="primary"
                dark
                height="100"
            >
                <v-btn icon @click="back()">
                    <v-icon color="white">
                        mdi-arrow-left
                    </v-icon>
                </v-btn>
                <logo :tile="true" :light="true" color="primary" :width="150"></logo>
                <v-spacer></v-spacer>

                <div class="text-right">
                    <div class="text-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                        CONVENIO DE COOPERACIÓN No 005 2021
                    </div>
                    <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                        Listados de consecutivos
                    </div>
                </div>
            </v-toolbar>
            <v-toolbar dense class="secondary" max-height="10"></v-toolbar>
        </v-card>

        <v-main class="">

            <v-container>

                <v-row class="d-flex justify-center">
                    <v-col class="col-md-4 col-12">
                        <v-card class="h-full d-flex flex-column">
                            <div class="d-flex justify-space-around pt-1 pb-0 mb-0">
                                <logo :tile="true" :light="false" color="primary"
                                      :width="80"></logo>
                                <logo :tile="true" :light="false" color="primary" :width="80"
                                      src="logoAlcaldia"></logo>
                            </div>
                            <div class="pa-3 flex-grow-1">
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
                                        <v-chip small class="font-weight-bold  accent">
                                            {{ data.status }}
                                        </v-chip>
                                    </div>
                                </div>
                            </div>
                            <v-divider></v-divider>
                            <div class="d-flex">
                                <v-btn text
                                       class="flex-grow-1">
                                    <v-icon>mdi-text-box-edit-outline</v-icon>
                                    Actualizar información
                                </v-btn>
                            </div>
                        </v-card>
                    </v-col>
                </v-row>

            </v-container>
        </v-main>
    </v-app>
</template>

<script>
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'
import logo from "@/Components/Logo";

export default {
    name: "Show",
    props: ['data'],
    components: {
        SpinnerComponent,
        QrcodeVue,
        logo
    },
    methods: {
        back() {
            window.history.back()
        }
    }
}
</script>

<style scoped>

</style>
