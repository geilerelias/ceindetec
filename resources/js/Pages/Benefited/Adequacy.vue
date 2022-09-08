<template class="bg">
    <simple-layout>
        <template v-slot:header>
            <div class="text-right">
                <div class="text-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                    {{
                        data.headquarters
                    }}
                </div>
                <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                    {{ data.establishments }}
                </div>
                <div class="text-subtitle-2 white--text font-weight-bold py-0 my-0">
                    {{ data.municipality }}
                </div>
            </div>
        </template>
        <template v-slot:extension>
            <v-tabs
                v-model="tab"
                align-with-title
            >
                <v-tabs-slider color="white"></v-tabs-slider>
                <v-tab
                    v-for="item in getRecords"
                    :key="item.folder"
                >
                    {{ item.folder }}
                </v-tab>
            </v-tabs>
        </template>

        <v-main class="transparent pt-6 bg">

            <v-container id="printer" class="white rounded-lg container-adequacy "
                         :style="{'min-height':localHeight, 'height':localHeight}">
                <v-card outlined flat class="rounded-lg rounded-b-0 pb-0" style="width: 100%">
                    <v-row class="justify-center my-0 py-0  ">
                        <v-col class="d-flex justify-center align-center ">

                            <logo :tile="true" color="primary" :width="200"></logo>
                        </v-col>
                        <v-divider vertical></v-divider>
                        <v-col class="col-md-8 col-8 text-center ">
                            <h3 class="my-4 text-h5 primary--text font-weight-bold ">
                                CONTRATO 002
                            </h3>
                            <v-divider></v-divider>
                            <v-row class="my-0 py-0">
                                <v-col class="col-6 my-1 py-0  font-weight-bold">
                                    INFORME DIARIO DE AVANCE DE OBRA
                                </v-col>
                                <v-divider vertical></v-divider>
                                <v-col class="col-6 my-1 py-0">
                                    CONSECUTIVO 002
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                            <v-row class="my-0 py-0">
                                <v-divider></v-divider>
                                <v-col class="col-6 my-1 py-0 font-weight-bold">
                                    FECHA
                                </v-col>
                                <v-divider vertical></v-divider>
                                <v-col class="col-6 my-1 py-0">
                                    {{ getDate(tab) }}
                                </v-col>
                            </v-row>
                            <v-divider></v-divider>
                        </v-col>
                    </v-row>
                </v-card>
                <v-card outlined flat class="rounded-0 px-2" style="width: 100%">
                    <div v-for="(item, i) in information"
                         :key="item.id">
                        <v-divider v-if="i!==0"></v-divider>
                        <v-row class="my-0 py-0 ">
                            <v-col class="col-3 my-0 py-0 text-body-2 font-weight-bold">
                                {{ item.title }}
                            </v-col>
                            <v-divider vertical></v-divider>
                            <v-col class="my-0 py-0 text-justify text-body-2">
                                {{ item.description }}
                            </v-col>
                        </v-row>

                    </div>
                </v-card>
                <v-card outlined flat class="rounded-0 px-2 py-4" style="width: 100%">
                    <div>
                        <v-row class="my-0 py-0 ">
                            <v-col class="col-3 my-0 py-0 font-weight-bold text-body-2">
                                SEDE:
                            </v-col>
                            <v-divider vertical></v-divider>
                            <v-col class="my-0 py-0">
                                <div class="primary--text text-body-2 font-weight-bold text-uppercase py-0 my-0">
                                    {{
                                        data.headquarters
                                    }}
                                </div>
                            </v-col>
                        </v-row>
                        <v-divider></v-divider>
                        <v-row class="my-0 py-0 ">
                            <v-col class="col-3 my-0 py-0 text-body-2 font-weight-bold">
                                ESTABLECIMIENTO:
                            </v-col>
                            <v-divider vertical></v-divider>
                            <v-col class="my-0 py-0">
                                <div class="primary--text text-body-2 font-weight-bold text-uppercase py-0 my-0">
                                    {{
                                        data.establishments
                                    }}
                                </div>
                            </v-col>
                        </v-row>
                        <v-divider></v-divider>
                        <v-row class="my-0 py-0 ">
                            <v-col class="col-3 my-0 py-0 text-body-2 font-weight-bold">
                                MUNICIPIO:
                            </v-col>
                            <v-divider vertical></v-divider>
                            <v-col class="my-0 py-0">
                                <div class=" primary--text text-body-2 font-weight-bold text-uppercase py-0 my-0">
                                    {{
                                        data.municipality
                                    }}
                                </div>
                            </v-col>
                        </v-row>
                    </div>
                </v-card>

                <v-tabs-items class="transparent" v-model="tab">
                    <v-tab-item
                        v-for="(item,k) in getRecords"
                        :key="item.folder"
                        class="transparent"
                    >
                        <v-card outlined flat class="rounded-0 pa-2" style="width: 100%;page-break-before:avoid">

                            <v-row>
                                <v-col class="col-12 font-weight-bold primary--text ">
                                    ACTIVIDADES REALIZADAS EN EL DIA
                                    <div class="pb-1 secondary rounded-lg" style="width: 100px"/>
                                </v-col>
                                <v-col class="grey--text text-body-2">
                                    {{ getDate(tab) }}
                                </v-col>
                                <v-col class="text-right grey--text text-body-2">
                                    ESTADO DEL TIEMPO: SOLEADO
                                </v-col>
                            </v-row>


                            <div v-if="existFile(item.sub)" class="mt-3">

                                <show-data-file
                                    :link="`/get/src/seguimiento/Adecuación/${data.municipality}/${data.establishments}/${data.headquarters}/${item.folder}/actividades.txt`"
                                ></show-data-file>
                            </div>

                            <div class="mt-3" v-else>
                                no existe información de las actividades realizadas en esta fecha
                            </div>
                        </v-card>
                        <v-card outlined flat class="rounded-0 pa-2" style="width: 100%;page-break-before:avoid">
                            <v-row>
                                <v-col class="col-12 font-weight-bold primary--text">
                                    ACTIVIDADES A REALIZAR EN EL SIGUIENTE DIA
                                    <div class="pb-1 mb-3 secondary rounded-lg" style="width: 100px"/>
                                </v-col>
                            </v-row>
                            <div class="mt-3">
                                no se registro información de las actividades a realizar
                            </div>

                        </v-card>
                        <v-card id="contenedor_image" style="page-break-before:avoid" outlined flat
                                class="rounded-lg rounded-t-0 px-2 py-3 fill-height"
                        >
                            <v-row>
                                <v-col class="font-weight-bold primary--text">
                                    REGISTRO FOTOGRÁFICO
                                    <div class="pb-1 secondary rounded-lg" style="width: 100px"></div>
                                </v-col>
                            </v-row>

                            <v-row>
                                <v-col
                                    v-for="(src, h) in item.sub" :key="`${item.folder}${k}${h}`"
                                    class="d-flex child-flex"
                                    cols="4"
                                >
                                    <v-img
                                        v-if="src!=='actividades.txt'"
                                        :src="`/get/src/seguimiento/Adecuación/${data.municipality}/${data.establishments}/${data.headquarters}/${item.folder}/${src}`"
                                        :aspect-ratio="16/9"
                                        :elevation="5"
                                        class="grey lighten-2 rounded "
                                    >
                                        <template v-slot:placeholder>
                                            <v-row
                                                class="fill-height ma-0"
                                                align="center"
                                                justify="center"
                                            >
                                                <v-progress-circular
                                                    indeterminate
                                                    color="grey lighten-5"
                                                ></v-progress-circular>
                                            </v-row>
                                        </template>
                                    </v-img>

                                </v-col>
                            </v-row>
                        </v-card>
                    </v-tab-item>
                </v-tabs-items>

            </v-container>

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

            <!--`                <v-container fluid>
                                <v-row>
                                    <div v-for="(record, i )in item.records" :key="record.id">
                                        {{ record }}{{ i }}
                                    </div>

                                    <v-col class="d-flex" v-for="(elemento, i) in item.items" :key="item.id">
                                        <v-card color="transparent" flat width="100%">
                                            <v-card-title class="d-flex justify-center align-center">
                                                <v-card
                                                    class=" white&#45;&#45;text font-weight-bold text-center text-h6 white&#45;&#45;text font-weight-bold"
                                                    width="150"
                                                    :color="getColor(elemento.title)">
                                                    {{ elemento.title }}
                                                </v-card>
                                            </v-card-title>
                                            <v-card-text>
                                                <v-row>
                                                    <v-col
                                                        v-for="(src, n) in elemento.src"
                                                        :key="n"
                                                        class="d-flex child-flex"
                                                        cols="12"
                                                    >
                                                        <v-img
                                                            :src="src"
                                                            :aspect-ratio="16/9"
                                                            :elevation="5"
                                                            class="grey lighten-2 rounded"
                                                        >
                                                            <template v-slot:placeholder>
                                                                <v-row
                                                                    class="fill-height ma-0"
                                                                    align="center"
                                                                    justify="center"
                                                                >
                                                                    <v-progress-circular
                                                                        indeterminate
                                                                        color="grey lighten-5"
                                                                    ></v-progress-circular>
                                                                </v-row>
                                                            </template>
                                                        </v-img>
                                                    </v-col>
                                                </v-row>
                                            </v-card-text>
                                        </v-card>
                                        <div v-if="i!==2" class="ml-4 mt-12 pl-1 grey rounded-xl"></div>
                                    </v-col>
                                </v-row>
                            </v-container>-->
            <v-footer class="mt-12 primary" id="no-print-footer" padless>
                <v-col
                    class="px-8"
                    cols="12"
                >
                    <div
                        class="text-center white--text">
                        Centro de Desarrollo Tecnologico de los Llanos -
                        {{
                            new Date().toLocaleDateString("es-Es")
                        }}
                    </div>
                </v-col>
            </v-footer>
        </v-main>
    </simple-layout>

</template>

<script>
// import logo from '@/../images/logo-ceindetec.png';
import * as VueGoogleMaps from 'vue2-google-maps'
import logo from '@/Components/Logo'
import showDataFile from "@/Components/ShowDataFile";
import SimpleLayout from "@/Layouts/SimpleLayout";


export default {
    name: "Index",
    components: {
        SimpleLayout,
        logo,
        showDataFile
    },
    props: ['data'],
    data: () => ({
        records: [],
        headquarters: [],
        establishments: [],
        tab: null,
        titles: [],
        information: [
            {
                title: "PROYECTO No.:",
                description: '002'
            },
            {
                title: 'OBJETO PROYECTO:',

                description: `FORTALECIMIENTO DE CAPACIDADES PARA LA INNOVACIÓN EDUCATIVA EN INSTITUCIONES OFICIALES
                MEDIANTE EL USO DE TECNOLOGÍAS DE LA
                INFORMACIÓN Y LAS COMUNICACIONES EN EL MARCO DE LA MODALIDAD DE ALTERNANCIA EN EL DEPARTAMENTO
                DE LA GUAJIRA`
            },
            {
                title: 'CONTRATISTA:',
                description: 'SERVICIOS GENERALES Y ESPECIALIZADOS DE COLOMBIA S.A.S.'
            },
            {
                title: 'INTERVENTOR:',
                description: 'G.V Ltda'
            },
            {
                title: 'SUPERVISOR:',
                description: 'SECRETARIA DE EDUCACION'
            }
        ],
        files: [],
        height: null
    }),

    async created() {

        this.establishments = await axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                // console.log(error)
            })

        this.headquarters = await axios.get('/dashboard/headquarters/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                // console.log(error)
            })

        console.log('this is data => ', this.data)
        console.log('this is municipality => ', this.data.municipality)
        console.log('this is establishments => ', this.data.establishments)
        console.log('this is headquarters => ', this.data.headquarters)

        axios
            .get(`/get/route/seguimiento/Adecuación/${this.data.municipality}/${this.data.establishments}/${this.data.headquarters}`)
            .then(response => {
                this.records = response.data
                console.log('this is response data ==>', response.data)
            });

        this.getHeight
    },

    computed: {
        localHeight() {
            try {
                return this.height
            } catch (e) {

            }
        },
        getRecords: function () {
            let array = null
            try {
                console.log('this is record', this.records[0])
                let aux = this.records[0].sub
                console.log(aux)
                array = aux.sort((a, b) => {
                    if (new Date(a.folder).getTime() > new Date(b.folder).getTime())
                        return -1
                    else
                        return 1
                    return 0
                })
            } catch (e) {
                console.log('error => ', e)
            }
            return array
        },

        getHeight: () => {
            try {
                let element = document.getElementById('container');
                // console.log("este es elemnt => ", element.clientHeight)
                let height = element.clientHeight
                let res = height / 1000
                let cant = Math.ceil(res);
                if (height > 1056) {
                    this.height = 1090 * cant
                }
                return this.height
            } catch (e) {

            }
            return "auto"
        },
    },

    methods: {

        getNumber(id) {
            // console.log('este es id =>', id, ' type => ', typeof (parseInt(id)));
            return parseInt(id)
        },
        getEstablishment(id) {
            try {
                //console.log(id)
                //console.log(typeof (id))
                let found = null;
                //console.log(this.establishments)
                found = this.establishments.find((element) => {
                    // console.log('element => ', element)
                    return element.id === id
                });
                //console.log('este es found =>', found)
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

        getColor(title) {
            let color = '';
            if (title === 'Antes') {
                color = 'amber';
            } else if (title === 'Durante') {
                color = 'red';
            } else {
                color = 'green';
            }
            return color;
        },
        getDate(tab) {
            try {
                //.log('this is tab => ', tab)
                //console.log(this.getRecords[tab].folder)
                let date = new Date(this.getRecords[tab].folder + " 00:00:00").toLocaleDateString("es-ES",
                    {
                        weekday: 'long',
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

        imprimir() {
            window.print();
        },
        existFile(items) {
            //console.log('file => ', items)
            //let res = items.find((item) => item === 'actividades.txt')
            let res = items.indexOf('actividades.txt')
            //console.log(res)
            if (res > -1) {
                //console.log('existe')
                return true;
            } else {
                //console.log('no existe')
                return false
            }


        },
        back() {
            window.history.back()
        }
    }
}
</script>

<style type="text/css" media="print">
@media print {
    #no-print-btn {
        display: none;
    }

    .no-print {
        display: none;
    }

    #no-print-header {
        display: none;
    }

    #no-print-footer {
        display: none;
    }

    ul, img, table {
        page-break-inside: avoid;
    }

    #contenedor_image {
        page-break-inside: avoid;
    }

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
.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}


.container-adequacy {
    max-width: 1000px;
}

.bs {
    border: 1px solid #cccccc;
}

.v-btn {
    outline: none !important;
}

/*
.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Montserrat", sans-serif !important;
}*/
</style>
