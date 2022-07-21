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
            <!--
                        <v-container id="printer" style="max-width: 21.6cm; border:solid 1px grey">
                            <v-row>
                                <v-col
                                    class="d-flex justify-center pa-1 "
                                    cols="3"
                                    v-for="n in 24" :key="n"
                                >
                                    <div class="saltopagina"
                                         :style="n%24==0?'margin-bottom: 2.8cm;':''">
                                        <inertia-link :href="`/qrcode/CONV005-00${n+1000}`">
                                            <v-card outlined
                                                    class="d-flex justify-center pa-2 rounded-0 " max-width="5cm"
                                                    max-height="4cm" height="4cm">
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
                                                                            :value="`http://sigac.almaguajira.com/qrcode/CONV005-00${n+1000}`"
                                                                            :size="60"
                                                                            level="H"/>
                                                            </div>

                                                            <div class="text-center mt-n1" style="font-size: 8px"
                                                                 v-text="`CONV005-00${n+1000}`"></div>
                                                        </div>
                                                    </v-card-text>
                                                </v-card>

                                            </v-card>
                                        </inertia-link>
                                    </div>
                                </v-col>
                            </v-row>
                        </v-container>
            -->


            <!--            <v-container id="printer" style="max-width: 21.6cm; border:solid 1px grey">
                            <v-row>
                                <v-col
                                    class="d-flex justify-center pa-1 "
                                    cols="3"
                                    v-for="(item, n) in data" :key="item.id"
                                >
                                    <div class="saltopagina"
                                         :style="(n+1)%36==0?'margin-bottom: 0.84cm;':''">
                                        <inertia-link :href="`/qrcode/${item.consecutive}`">
                                            <v-card outlined
                                                    class="d-flex justify-center pa-1 rounded-0 " max-width="5cm"
                                                    max-height="4cm" height="2.8cm">
                                                <v-card outlined class="rounded-lg pa-1" :aspect-ratio="16/9" width="5cm"
                                                        height="2.5cm"
                                                        style="border: 2px solid #001c47">
                                                    <v-row>
                                                        <v-col cols="6">
                                                            <div class="d-flex flex-column justify-center align-center">
                                                                <div class="circulo">
                                                                    <qrcode-vue class=""
                                                                                :value="`http://sigac.almaguajira.com/qrcode/${item.consecutive}`"
                                                                                :size="75"
                                                                                level="H"/>
                                                                </div>

                                                                <div class="text-center" style="font-size: 8px"
                                                                     v-text="`${item.consecutive}`"></div>
                                                            </div>
                                                        </v-col>
                                                        <v-col cols="6" class="ml-0 pl-0">
                                                            <div class="d-flex justify-space-around py-1 mb-0">
                                                                <logo :tile="true" :light="false" color="primary"
                                                                      :width="80"></logo>
                                                                <logo :tile="true" :light="false" color="primary" :width="80"
                                                                      src="logoAlcaldia"></logo>
                                                            </div>
                                                            <div class="text-left font-weight-black  mb-0 py-0"
                                                                 style="font-size: 9px; font-stretch: extra-condensed">
                                                                CONVENIO DE COOPERACIÓN
                                                                No 005 2021
                                                            </div>
                                                        </v-col>
                                                    </v-row>
                                                </v-card>
                                            </v-card>
                                        </inertia-link>
                                    </div>

                                </v-col>
                            </v-row>
                        </v-container>-->

            <v-container fluid>
                <v-data-iterator
                    :items="data"
                    :items-per-page.sync="itemsPerPage"
                    :page.sync="page"
                    :search="search"
                    :sort-by="sortBy.toLowerCase()"
                    :sort-desc="sortDesc"
                    hide-default-footer
                >
                    <template v-slot:header>
                        <v-toolbar
                            dark
                            color="primary"

                            class="mb-1 rounded-lg "
                        >
                            <v-text-field
                                v-model="search"
                                clearable
                                flat
                                solo-inverted
                                hide-details
                                prepend-inner-icon="mdi-magnify"
                                label="Buscar"
                            ></v-text-field>

                            <template v-if="$vuetify.breakpoint.mdAndUp">
                                <v-spacer></v-spacer>
                                <v-select
                                    v-model="sortBy"
                                    flat
                                    solo-inverted
                                    hide-details
                                    :items="keys"
                                    prepend-inner-icon="mdi-filter-variant"
                                    label="Ordenar por"
                                ></v-select>
                                <v-spacer></v-spacer>
                                <v-btn-toggle
                                    v-model="sortDesc"
                                    mandatory
                                >
                                    <v-btn
                                        large
                                        depressed
                                        color="secondary"
                                        :value="false"
                                    >
                                        <v-icon>mdi-arrow-up</v-icon>
                                    </v-btn>
                                    <v-btn
                                        large
                                        depressed
                                        color="secondary"
                                        :value="true"
                                    >
                                        <v-icon>mdi-arrow-down</v-icon>
                                    </v-btn>
                                </v-btn-toggle>
                            </template>
                        </v-toolbar>
                    </template>

                    <template v-slot:default="props">
                        <v-row>
                            <v-col
                                v-for="item in props.items"
                                :key="item.name"
                                cols="12"
                                sm="6"
                                md="4"
                                lg="3"
                            >
                                <v-card>
                                    <v-card-title class="subheading font-weight-bold">
                                        {{ item.consecutive }}
                                    </v-card-title>

                                    <v-divider></v-divider>

                                    <v-list dense>
                                        <v-list-item
                                            v-for="(key, index) in filteredKeys"
                                            :key="index"
                                        >
                                            <v-list-item-content :class="{ 'blue--text': sortBy === key }">
                                                {{ key }}:
                                            </v-list-item-content>
                                            <v-list-item-content
                                                class="align-end"
                                                :class="{ 'blue--text': sortBy === key }"
                                            >
                                                {{ item[key.toLowerCase()] }}
                                            </v-list-item-content>
                                        </v-list-item>
                                    </v-list>
                                </v-card>
                            </v-col>

                            <v-col
                                class="d-flex justify-center pa-1 "
                                cols="3"
                                v-for="(item, n) in  props.items" :key="item.id"
                            >
                                <div class="saltopagina"
                                     :style="(n+1)%36==0?'margin-bottom: 0.84cm;':''">
                                    <inertia-link :href="`/qrcode/${item.consecutive}`">
                                        <v-card outlined
                                                class="d-flex justify-center pa-1 rounded-0 " max-width="5cm"
                                                max-height="4cm" height="2.8cm">
                                            <v-card outlined class="rounded-lg pa-1" :aspect-ratio="16/9" width="5cm"
                                                    height="2.5cm"
                                                    style="border: 2px solid #001c47">
                                                <v-row>
                                                    <v-col cols="6">
                                                        <div class="d-flex flex-column justify-center align-center">
                                                            <div class="circulo">
                                                                <qrcode-vue class=""
                                                                            :value="`http://sigac.almaguajira.com/qrcode/${item.consecutive}`"
                                                                            :size="75"
                                                                            level="H"/>
                                                            </div>

                                                            <div class="text-center" style="font-size: 8px"
                                                                 v-text="`${item.consecutive}`"></div>
                                                        </div>
                                                    </v-col>
                                                    <v-col cols="6" class="ml-0 pl-0">
                                                        <div class="d-flex justify-space-around py-1 mb-0">
                                                            <logo :tile="true" :light="false" color="primary"
                                                                  :width="80"></logo>
                                                            <logo :tile="true" :light="false" color="primary"
                                                                  :width="80"
                                                                  src="logoAlcaldia"></logo>
                                                        </div>
                                                        <div class="text-left font-weight-black  mb-0 py-0"
                                                             style="font-size: 9px; font-stretch: extra-condensed">
                                                            CONVENIO DE COOPERACIÓN
                                                            No 005 2021
                                                        </div>
                                                    </v-col>
                                                </v-row>
                                            </v-card>
                                        </v-card>
                                    </inertia-link>
                                </div>

                            </v-col>
                        </v-row>
                    </template>

                    <template v-slot:footer>
                        <v-row
                            class="mt-2"
                            align="center"
                            justify="center"
                        >
                            <span class="grey--text">Items per page</span>
                            <v-menu offset-y>
                                <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                        dark
                                        text
                                        color="primary"
                                        class="ml-2"
                                        v-bind="attrs"
                                        v-on="on"
                                    >
                                        {{ itemsPerPage }}
                                        <v-icon>mdi-chevron-down</v-icon>
                                    </v-btn>
                                </template>
                                <v-list>
                                    <v-list-item
                                        v-for="(number, index) in itemsPerPageArray"
                                        :key="index"
                                        @click="updateItemsPerPage(number)"
                                    >
                                        <v-list-item-title>{{ number }}</v-list-item-title>
                                    </v-list-item>
                                </v-list>
                            </v-menu>

                            <v-spacer></v-spacer>

                            <span
                                class="mr-4
            grey--text"
                            >
            Page {{ page }} of {{ numberOfPages }}
          </span>
                            <v-btn
                                fab
                                dark
                                color="blue darken-3"
                                class="mr-1"
                                @click="formerPage"
                            >
                                <v-icon>mdi-chevron-left</v-icon>
                            </v-btn>
                            <v-btn
                                fab
                                dark
                                color="blue darken-3"
                                class="ml-1"
                                @click="nextPage"
                            >
                                <v-icon>mdi-chevron-right</v-icon>
                            </v-btn>
                        </v-row>
                    </template>
                </v-data-iterator>
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

        <v-btn id="no-print-btn"
               color="primary"
               dark
               bottom
               left
               fixed
               fab
               @click="savedConsecutive()"
        >
            <v-icon>mdi-content-save</v-icon>
        </v-btn>
        <spinner-component :value="inProcess"></spinner-component>
    </v-app>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout'
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'

import logo from "@/Components/Logo";


export default {
    name: "Index",
    props: ['data'],
    components: {
        PageLayout,
        SpinnerComponent,
        QrcodeVue,
        logo
    },
    data: () => ({
        value: 'https://example.com',
        inProcess: false,
        itemsPerPageArray: [4, 8, 12],
        search: '',
        filter: {},
        sortDesc: false,
        page: 1,
        itemsPerPage: 4,
        sortBy: 'name',
        keys: [
            'consecutive',
            'status',
            'description',
            'municipality',
            'department',
            'establishments_id',
            'headquarters_id',
            'created_at',
            'updated_at',
        ],
    }),
    computed: {
        numberOfPages() {
            return Math.ceil(this.data.length / this.itemsPerPage)
        },
        filteredKeys() {
            return this.keys.filter(key => key !== 'Name')
        },
    },
    methods: {
        imprimir() {
            window.print();
        },
        savedConsecutive() {
            this.inProcess = true;
            this.$inertia.post('/qrcode/generate/1000/3500', {
                onSuccess: page => {
                    console.log('onSuccess')
                },
                onError: errors => {
                    console.log('onError')
                },
                onFinish: visit => {
                    console.log('onFinish')
                },
            })
            this.inProcess = false;
        },
        nextPage() {
            if (this.page + 1 <= this.numberOfPages) this.page += 1
        },
        formerPage() {
            if (this.page - 1 >= 1) this.page -= 1
        },
        updateItemsPerPage(number) {
            this.itemsPerPage = number
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

