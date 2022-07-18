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
            <v-container id="printer">
                <v-row>
                    <v-col
                        class="d-flex justify-center pa-1 "
                        cols="6"
                        v-for="n in 1500" :key="n"
                    >
                        <div class="saltopagina"
                             :style="n%10==0?'margin-bottom: 1.885cm;':''">
                            <v-card outlined
                                    class="d-flex justify-center pa-2 rounded-0 " max-width="10cm"
                                    max-height="5.5cm" height="5cm">
                                <v-card outlined class="rounded-lg" :aspect-ratio="16/9" width="9.5cm" height="4.5cm"
                                        style="border: 2px solid #001c47">

                                    <v-card-title class="d-flex justify-space-around py-1">
                                        <logo :tile="true" :light="false" color="primary" :width="80"></logo>
                                        <logo :tile="true" :light="false" color="primary" :width="80"
                                              src="logoAlcaldia"></logo>
                                    </v-card-title>

                                    <v-card-text>
                                        <span class="text-center font-weight-black caption">
                                            CONVENIO DE COOPERACIÓN No 005 2021
                                        </span>
                                        <div class="d-flex justify-center align-center">

                                            <qrcode-vue class="mr-3" :value="`CONV005-00${n+1000}`" :size="80"
                                                        level="H"/>


                                            <div class="text-center" v-text="`CONV005-00${n+1000}`"></div>
                                        </div>
                                    </v-card-text>
                                </v-card>
                            </v-card>
                        </div>

                    </v-col>


                </v-row>
            </v-container>
        </v-main>
        <v-btn id="no-print-btn"
               color="secondary"
               dark
               bottom
               right
               fixed
               fab
               @click="imprimir()"
        >
            <v-icon>mdi-printer-outline</v-icon>
        </v-btn>
    </v-app>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout'
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'

import logo from "@/Components/Logo";


export default {
    name: "Index",
    components: {
        PageLayout,
        SpinnerComponent,
        QrcodeVue,
        logo
    },
    data: () => ({
        value: 'https://example.com',
    }),
    methods: {
        imprimir() {
            window.print();
        },
    },
    back() {
        window.history.back()
    }

}
</script>

<style type="text/css" media="print">
@media print {
    #no-print-btn {
        display: none;
    }

    #no-print-header {
        display: none;
    }

    #no-print-footer {
        display: none;
    }

    div.saltopagina {
        page-break-before: always;
    }

    /*ul, img, table {*/
    /*    page-break-inside: avoid;*/
    /*}*/
    /*#printer > div > div > div > div {*/
    /*    page-break-inside: avoid !important;*/
    /*}*/
    @page {
        margin-top: 1cm;
        margin-left: 1cm;
        margin-right: 1cm;
    }

    .bg {
        background: rgb(255, 255, 255) !important;
    }

}
</style>

<style>


</style>
