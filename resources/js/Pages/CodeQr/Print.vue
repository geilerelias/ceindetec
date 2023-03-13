<template>
    <v-app class="no-print">
        <v-main>
            <v-container id="printer" style="max-width: 21.6cm; border:solid 1px grey">
                <v-row>
                    <!--
                                        {{ qrCodes.slice(1, 10) }}
                    -->
                    <v-col
                        class="d-flex justify-center pa-1 "
                        cols="3"
                        v-for="n in qrCodes" :key="n"
                    >

                        <inertia-link :href="`/qrcode/CONV005-00${n+1000}`">
                            <v-card outlined
                                    class="d-flex justify-center align-center pa-2 rounded-0 "
                                    max-width="5.3cm"
                                    max-height="3cm"
                                    height="3cm">
                                <v-card outlined class="rounded-lg pa-1" style="border:solid 2.5px #001c47;"
                                        max-height="2.6cm"
                                        height="2.6cm"
                                        max-width="5cm"
                                        width="5cm"
                                >
                                    <v-row>
                                        <v-col cols="6">
                                            <div class="d-flex flex-column justify-center align-center">
                                                <div class="circulo">
                                                    <qrcode-vue class=""
                                                                :value="`http://sigac.almaguajira.com/qrcode/${n.consecutive}`"
                                                                :size="75"
                                                                level="H"/>
                                                </div>

                                                <div class="mt-n1 text-center text--black black--text"
                                                     style="font-size: 8px"
                                                     v-text="`${n.consecutive}`"></div>
                                            </div>
                                        </v-col>
                                        <v-col cols="6" class="ml-0 pl-0">
                                            <div class="d-flex justify-space-around py-1 mb-0">
                                                <logo :tile="true" :light="false" color="primary"
                                                      :width="40"></logo>
                                                <logo :tile="true" :light="false" color="primary"
                                                      :width="40"
                                                      src="logoAlcaldia"></logo>
                                            </div>
                                            <div class="text-left font-weight-black ml-n1  mb-0 py-0"
                                                 style="font-size: 10px; font-stretch: extra-condensed">
                                                CONVENIO DE COOPERACIÓN
                                                No 005 2021
                                            </div>
                                        </v-col>
                                    </v-row>
                                </v-card>
                                <!--
                                                                    <v-card outlined class="rounded-lg" :aspect-ratio="16/9" width="5cm"
                                                                            height="3.5cm"
                                                                            style="border: 2px solid #001c47">

                                                                        <v-card-title class="d-flex justify-space-around pt-1 pb-0 mb-0">
                                                                            <logo :tile="true" :light="false" color="primary" :width="40"></logo>
                                                                            <logo :tile="true" :light="false" color="primary" :width="40"
                                                                                  src="logoAlcaldia"></logo>
                                                                        </v-card-title>

                                                                        <v-card-text>
                                                                            <div class="text-center font-weight-black mb-0 py-0"
                                                                                 style="font-size: 8px; font-stretch: extra-condensed">
                                                                                CONVENIO DE COOPERACIÓN
                                                                            </div>
                                                                            <div class="text-center font-weight-black py-0 my-0 mt-n3"
                                                                                 style="font-size: 8px; font-stretch: extra-condensed">
                                                                                No 005 2021 7
                                                                            </div>

                                                                            <div class="d-flex flex-column justify-center align-center">
                                                                                <div class="circulo">
                                                                                    <qrcode-vue class="mt-n1"
                                                                                                :value="`/qrcode/CONV005-00${n+1000}`"
                                                                                                :size="60"
                                                                                                level="H"/>
                                                                                </div>

                                                                                <div class="text-center mt-n1" style="font-size: 8px"
                                                                                     v-text="`CONV005-00${n+1000}`"></div>
                                                                            </div>
                                                                        </v-card-text>
                                                                    </v-card>
                                -->

                            </v-card>
                        </inertia-link>

                    </v-col>
                </v-row>
            </v-container>

            <!--
                        <div class="d-flex justify-center align-center flex-column">
                            <div
                                class="d-flex justify-center align-center"
                                v-for="(item, n) in data" :key="item.id"
                                style="min-height: 21.59cm;max-height: 21.59cm;height: 21.59cm;min-width:27.94cm;max-width:27.94cm;width:27.94cm"
                            >
                                <div class="saltopagina"
                                     :style="(n+1)%36==0?'margin-bottom: 0.84cm;':''">
                                    <v-card outlined
                                            min-height="15cm" max-height="15cm" min-width="20cm" max-width="20cm"
                                            class="d-flex justify-center align-center pa-1 rounded-0 ">
                                        <v-card outlined class="rounded-lg" :aspect-ratio="16/9"
                                                min-height="14cm" max-height="14cm" min-width="19cm" max-width="19cm"
                                                style="border: 2px solid #001c47">
                                            <v-row>
                                                <v-col class="mt-2 ml-0 pl-0">
                                                    <div class="d-flex justify-space-around  mx-0 py-1 mb-0">
                                                        <logo :tile="true" :light="false" color="primary"
                                                              :width="200"></logo>
                                                        <logo :tile="true" :light="false" color="primary" :width="200"
                                                              src="logoAlcaldia"></logo>
                                                    </div>
                                                    <v-container>

                                                        <div class="text-center font-weight-black mt-1  mb-0 py-0"
                                                             style="font-size: 35px; font-stretch: extra-condensed">
                                                            CONVENIO DE COOPERACIÓN
                                                        </div>
                                                        <div class="text-center font-weight-black mt-n6  mb-0 py-0"
                                                             style="font-size: 35px; font-stretch: extra-condensed">
                                                            No 005 2021
                                                        </div>
                                                        <v-container class="px-6">
                                                            <div class="px-3">
                                                                <div class="text-h5 text-uppercase">{{
                                                                        getHeadquarters(item.headquarters_id)
                                                                    }}
                                                                </div>
                                                                <div class="text-h6 secondary&#45;&#45;text text-uppercase">
                                                                    {{ getEstablishment(item.establishment_id) }}
                                                                </div>
                                                                <div class="text-h6 terciar&#45;&#45;text text-caption text-uppercase">
                                                                    {{ getMunicipalityDeparment(item.headquarters_id) }}
                                                                </div>
                                                                <div class="text-h6 mt-3 description"
                                                                     v-html="item.description"></div>
                                                            </div>
                                                        </v-container>
                                                        <div class="d-flex justify-center  ">
                                                            <div class="d-flex flex-column">
                                                                <a href="">
                                                                    {{ item.consecutive }}
                                                                </a>
                                                                <div class="primary pb-1 rounded-lg" style="width: 132px"></div>

                                                            </div>
                                                        </div>
                                                    </v-container>
                                                </v-col>
                                            </v-row>
                                        </v-card>
                                    </v-card>
                                </div>

                            </div>
                        </div>
            -->


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
import simpleLayout from "@/Layouts/SimpleLayout.vue";
import logo from "@/Components/Logo.vue";
import QrcodeVue from 'qrcode.vue'


export default {
    name: "Print",
    props: ['data'],
    components: {simpleLayout, logo, QrcodeVue},
    data: () => ({
        establishments: [],
        headquarters: [],
        qrCodes: []

    }),
    created() {
        axios.get('/qrcode/all')
            .then((response) => {
                //console.log(response.data)
                this.qrCodes = response.data
            })
            .catch((error) => {
                console.log(error)
            })

        axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                this.establishments = response.data
            })
            .catch((error) => {
                console.log(error)
            })

        axios.get('/dashboard/headquarters/all')
            .then((response) => {
                //console.log(response.data)
                this.headquarters = response.data
            })
            .catch((error) => {
                console.log(error)
            })
    },

    methods: {
        getNumber(id) {
            // console.log('este es id =>', id, ' type => ', typeof (parseInt(id)));
            return parseInt(id)
        },

        getEstablishment(id) {
            try {
                // console.log(id)
                let found = null;
                if (typeof (id) !== 'number') {
                    let nuevo = this.getNumber(id)
                    //console.log(nuevo)
                    found = this.establishments.find(
                        element => element.id === nuevo
                    );
                } else {
                    found = this.establishments.find(
                        element => element.id === id
                    );
                }
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

        getMunicipalityDeparment(id) {
            try {
                let found = this.headquarters.find(element => element.id === id);
                return `Municipio de ${found.municipality} Departamento de ${found.department}`
            } catch (e) {
                return null;
            }
        },

        imprimir() {
            window.print();
        },
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

    #no-print {
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
div.description > ul > li {
    list-style-type: circle;
}

.first {
    writing-mode: vertical-rl;
    text-orientation: mixed;
    -webkit-transform: rotate(180deg);
    -moz-transform: rotate(180deg);
}

.terciar {
    writing-mode: vertical-rl;
    text-orientation: mixed;
}

</style>
