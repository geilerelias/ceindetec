<template>
    <simple-layout>
        <template v-slot:header>
            <div class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                Listados de consecutivos
            </div>
            <div class="text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                CONVENIO DE COOPERACIÓN No 005 2021
            </div>
        </template>
        <v-main class="d-flex justify-center align-center ">
            <v-container class="fill-height">
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
                            id="no-print"
                            dark
                            color="primary"

                            class="mb-3 rounded-lg"
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
                                    item-text="text"
                                    item-value="value"
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
                                class="d-flex justify-center"
                                cols="12"
                                sm="6"
                                md="3"
                                lg="2"
                                v-for="(item, n) in  props.items" :key="item.id"
                            >
                                <div class="saltopagina"
                                     :style="(n+1)%36==0?'margin-bottom: 0.84cm;':''">
                                    <v-card outlined @click="showEditDialog(item)"
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
                                </div>

                            </v-col>
                        </v-row>
                    </template>

                    <template v-slot:footer>
                        <v-row id="no-print"
                               class="mt-2 px-2"
                               align="center"
                               justify="center"
                        >
                            <span class="grey--text">elementos por página</span>
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


                            <v-btn
                                :disabled="page==1"
                                fab
                                text
                                dark
                                color="blue darken-3"
                                class="mr-1"
                                @click="formerPage"
                            >
                                <v-icon>mdi-chevron-left</v-icon>
                            </v-btn>
                            <div class="mr-4 grey--text">
                                Página {{ page }} de {{ numberOfPages }}
                            </div>
                            <v-btn
                                :disabled="page==numberOfPages"
                                fab
                                text
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

        <v-btn
            @click="sheet=!sheet"
            color="secondary"
            dark
            fab
            bottom
            right
            fixed
        >
            <v-icon v-if="fab">
                mdi-close
            </v-icon>
            <v-icon v-else>
                mdi-tune
            </v-icon>
        </v-btn>


        <!--        <v-btn id="no-print-btn"
                       color="primary"
                       dark
                       bottom
                       left
                       fixed
                       fab
                       @click="savedConsecutive()"
                >
                    <v-icon>mdi-content-save</v-icon>
                </v-btn>-->

        <spinner-component :value="inProcess"></spinner-component>

        <!--List into a Bottom sheet-->
        <div class="text-center">
            <v-bottom-sheet v-model="sheet">
                <v-list flat>
                    <v-subheader>Otras Operaciones</v-subheader>
                    <v-list-item-group
                        color="primary"
                    >
                        <inertia-link v-for="(item, i) in listSheet"
                                      :key="i" :href="item.route">
                            <v-list-item link>
                                <v-list-item-icon>
                                    <v-icon v-text="item.icon"></v-icon>
                                </v-list-item-icon>
                                <v-list-item-content>
                                    <v-list-item-title v-text="item.title"></v-list-item-title>
                                </v-list-item-content>
                            </v-list-item>
                        </inertia-link>
                    </v-list-item-group>
                </v-list>
            </v-bottom-sheet>
        </div>

        <!--Dialog edit Qrcode-->
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
import PageLayout from '@/Layouts/PageLayout.vue'
import SpinnerComponent from "@/Components/SpinnerComponent.vue";
import QrcodeVue from 'qrcode.vue'

import logo from "@/Components/Logo.vue";
import simpleLayout from "@/Layouts/SimpleLayout.vue";
import edit from "./Edit.vue";

export default {
    name: "Index",
    props: ['data'],
    components: {
        SpinnerComponent,
        QrcodeVue,
        simpleLayout,
        logo,
        edit
    },

    data: () => ({
        value: 'https://example.com',
        inProcess: false,
        itemsPerPageArray: [36, 72, 144, 'all'],
        search: '',
        filter: {},
        sortDesc: false,
        page: 1,
        itemsPerPage: 36,
        sortBy: 'consecutive',
        keys: [
            {text: 'Consecutivo', value: 'consecutive'},
            {text: 'Estado', value: 'status'},
            {text: 'Descripción', value: 'description'},
            {text: 'Municipio', value: 'municipality'},
            {text: 'Departamento', value: 'department'},
            {text: 'Establecimiento', value: 'establishments_id'},
            {text: 'Sede', value: 'headquarters_id'},
            {text: 'Creado en ', value: 'created_at'},
            {text: 'Actualizado en', value: 'updated_at'},
        ],
        editItem: null,
        listaQr: [
            {id: 1, consecutive: "CONV005-000356", description: `<div class="text-h5">Ceindetec</div>`},
            {id: 2, consecutive: "CONV005-000141", description: `<div class="text-h5">Santa fé</div>`},
            {id: 3, consecutive: "CONV005-000898", description: `<div class="text-h5">itaka</div>`},
            {id: 4, consecutive: "CONV005-000052", description: `<div class="text-h5">almirante padilla</div>`},
            {id: 5, consecutive: "CONV005-000553", description: `<div class="text-h5">la granjita</div>`},
            {id: 6, consecutive: "CONV005-000143", description: `<div class="text-h5">site de junio</div>`},
            {id: 7, consecutive: "CONV005-000091", description: `<div class="text-h5">campana</div>`},
            {id: 8, consecutive: "CONV005-000661", description: `<div class="text-h5">tomas emilio</div>`},
            {id: 9, consecutive: "CONV005-000130", description: `<div class="text-h5">mañature</div>`},
            {id: 10, consecutive: "CONV005-000176", description: `<div class="text-h5">kousachon</div>`},
            {id: 11, consecutive: "CONV005-000140", description: `<div class="text-h5">paraver</div>`},
            {id: 12, consecutive: "CONV005-000175", description: `<div class="text-h5">el pasito</div>`},
            {id: 13, consecutive: "CONV005-000148", description: `<div class="text-h5">maracari</div>`},
            {id: 14, consecutive: "CONV005-000146", description: `<div class="text-h5">ricardo gomez</div>`},
            {id: 15, consecutive: "CONV005-000142", description: `<div class="text-h5">iyospa</div>`},
            {id: 16, consecutive: "CONV005-000149", description: `<div class="text-h5">manzana</div>`},
            {id: 17, consecutive: "CONV005-000900", description: `<div class="text-h5">laachon</div>`},
            {id: 18, consecutive: "CONV005-000899", description: `<div class="text-h5">cassia</div>`},
            {id: 19, consecutive: "CONV005-000127", description: `<div class="text-h5">chojochon</div>`},
            {id: 20, consecutive: "CONV005-000897", description: `<div class="text-h5">ishashimana</div>`},
            {id: 21, consecutive: "CONV005-000993", description: `<div class="text-h5">kannan</div>`},
            {id: 22, consecutive: "CONV005-000555", description: `<div class="text-h5">primero de octubre</div>`},
            {id: 23, consecutive: "CONV005-000147", description: `<div class="text-h5">tatailamana</div>`},
            {id: 24, consecutive: "CONV005-000554", description: `<div class="text-h5">amaichon</div>`},
            {id: 25, consecutive: "CONV005-000917", description: `<div class="text-h5">pajaro</div>`},
            {id: 26, consecutive: "CONV005-000916", description: `<div class="text-h5">Emira armenta</div>`},
            {id: 27, consecutive: "CONV005-000915", description: `<div class="text-h5">cleotilde</div>`},
        ],
        establishments: [],
        headquarters: [],
        fab: false,
        dialog: false,
        sheet: false,
        listSheet: [
            {
                title: 'Buscar y mostrar QrCode',
                icon: 'mdi-magnify',
                route: '/qrcode/search-show',
                color: "green"
            }, {
                title: 'Buscar y editar QrCode',
                icon: 'mdi-pencil',
                route: '/qrcode/search-edit',
                color: "green"
            },
            {
                title: 'Imprimir Qrcode',
                icon: 'mdi-file-document-outline',
                route: '/qrcode/print',
                color: "red darken-4",
            }, {
                title: 'Agregar Qrcode',
                icon: 'mdi-plus',
                route: '#',
                color: "indigo"
            }, {
                title: 'Eliminar Qrcode',
                icon: 'mdi-delete',
                route: '#',
                color: "red"
            }
        ]
    }),
    created() {
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
    computed: {
        numberOfPages() {
            return Math.ceil(this.data.length / this.itemsPerPage)
        },
        filteredKeys() {
            return this.keys.filter(key => key !== 'consecutive')
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
            if (number == 'all') {
                this.itemsPerPage = this.data.length
            } else {
                this.itemsPerPage = number
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
        back() {
            window.history.back()
        }
    },


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
/* This is for documentation purposes and will not be needed in your application */
#create .v-speed-dial {
    position: absolute;
}

#create .v-btn--floating {
    position: relative;
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

