<template>
    <page-layout class="bg">
        <div class="bg">
            <v-container class="mb-6">
                <v-row class="ma-0">
                    <v-col>
                        <v-card style="width: 100%;">
                            <v-card-text class="">
                                <v-row class="no-gutters">
                                    <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                        <inertia-link href="/before-during-after">
                                            <v-btn
                                                class="mr-3 secondary">
                                                Cambios
                                            </v-btn>
                                        </inertia-link>

                                        <v-menu
                                            v-model="menu"
                                            :close-on-content-click="false"
                                            :nudge-width="200"
                                            offset-x
                                            transition="scale-transition"
                                        >
                                            <template v-slot:activator="{ on, attrs }">
                                                <v-btn v-bind="attrs"
                                                       v-on="on"
                                                       outlined
                                                       class="button-shadow primary--text">
                                                    <v-icon aria-hidden="true"
                                                            class="notranslate mr-2">
                                                        mdi-filter-variant
                                                    </v-icon>
                                                    Filtros
                                                </v-btn>
                                            </template>

                                            <v-card>
                                                <v-list>
                                                    <v-list-item>

                                                        <v-list-item-content>
                                                            <v-list-item-title>Filtro de búsqueda
                                                            </v-list-item-title>
                                                            <v-list-item-subtitle>Desactiva o activa las
                                                                opciones de
                                                                búsquedas
                                                            </v-list-item-subtitle>

                                                        </v-list-item-content>
                                                        <v-list-item-action>
                                                            <v-btn
                                                                icon
                                                                @click="menu = false"
                                                            >
                                                                <v-icon>
                                                                    mdi-close
                                                                </v-icon>
                                                            </v-btn>
                                                        </v-list-item-action>

                                                    </v-list-item>
                                                </v-list>

                                                <v-divider></v-divider>

                                                <v-list>
                                                    <v-list-item>
                                                        <v-list-item-action>
                                                            <v-switch
                                                                v-model="isMunicipality"
                                                                @change="applyChanges"
                                                            ></v-switch>
                                                        </v-list-item-action>
                                                        <v-list-item-title>Municipios</v-list-item-title>
                                                    </v-list-item>

                                                    <v-list-item>
                                                        <v-list-item-action>
                                                            <v-switch
                                                                v-model="isWorkType"
                                                                @change="applyChanges"
                                                            ></v-switch>
                                                        </v-list-item-action>
                                                        <v-list-item-title>Tipo de obra</v-list-item-title>
                                                    </v-list-item>

                                                    <v-list-item>
                                                        <v-list-item-action>
                                                            <v-switch
                                                                v-model="isEstablishments"
                                                                @change="applyChanges"
                                                            ></v-switch>
                                                        </v-list-item-action>
                                                        <v-list-item-title>Establecimiento</v-list-item-title>
                                                    </v-list-item>
                                                </v-list>
                                                <v-divider></v-divider>
                                                <v-list>
                                                    <v-subheader>
                                                        Agrupar por
                                                    </v-subheader>
                                                    <v-list-item>
                                                        <v-radio-group
                                                            v-model="group"
                                                            row
                                                        >
                                                            <v-radio
                                                                label="Tipo de obra"
                                                                value="work_type"
                                                                @click="applyChanges"
                                                            ></v-radio>

                                                            <v-radio
                                                                label="Establecimientos"
                                                                value="establishments_id"
                                                                @click="applyChanges"
                                                            ></v-radio>

                                                            <v-radio
                                                                label="Municipio"
                                                                value="municipality"
                                                                @click="applyChanges"
                                                            ></v-radio>
                                                        </v-radio-group>
                                                    </v-list-item>
                                                </v-list>
                                            </v-card>
                                        </v-menu>
                                    </div>

                                    <v-spacer></v-spacer>

                                    <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                        <v-text-field hide-details dense enclosed outlined
                                                      prepend-inner-icon="mdi-magnify"
                                                      placeholder="Buscar"
                                                      v-model="search"
                                                      clearable
                                        ></v-text-field>
                                    </div>
                                </v-row>
                            </v-card-text>
                        </v-card>
                    </v-col>
                </v-row>

                <v-row class="ma-0">
                    <v-col>
                        <v-sheet min-height="70vh" rounded="lg" class="pa-8">
                            <div v-for="(info, n) in getData">
                                <v-list two-line>
                                    <v-subheader>
                                        <div v-if="group==null">
                                            Todos
                                        </div>
                                        <div class="text-uppercase font-weight-bold"
                                             v-else-if="group=='establishments_id'">
                                            {{ getEstablishment(n) }}
                                        </div>
                                        <div class="text-uppercase font-weight-bold" v-else>
                                            {{ n }}
                                        </div>
                                        <v-spacer></v-spacer>
                                        cantidad: {{ info.length }}
                                    </v-subheader>

                                    <v-divider></v-divider>

                                    <v-row class="mt-2">
                                        <v-col cols="12" md="6" lg="4" v-for="(item, j) in info" :key="item.id">


                                            <inertia-link
                                                :href="`/benefited-detail/${getDirectory(item)}`"
                                                class="text-decoration-none">
                                                <v-hover v-slot="{ hover }">
                                                    <v-card class="pa-0 rounded-b-0"
                                                            @click="getFolder(item.municipality,getEstablishment(item.establishment_id),item.name)">
                                                        <v-img cover
                                                               :aspect-ratio="16/9"
                                                               style="transition: all 0.5s;"
                                                               :class="hover ? 'zoom' : ''"
                                                               :src="`/get/img/${getDirectory(item)}/Img aula/`"
                                                        >
                                                            <v-expand-transition>
                                                                <div
                                                                    v-if="hover"
                                                                    class="d-flex pa-2 transition-fast-in-fast-out primary darken-2 v-card--reveal text-h6 white--text"
                                                                    style="height: 100%;"
                                                                >
                                                                    <v-card>
                                                                        <v-list-item>
                                                                            <v-list-item-content>
                                                                                <v-list-item-title
                                                                                    class="text-subtitle-1 mb-1">
                                                                                    {{
                                                                                        getHeadquarters(item.headquarters_id)
                                                                                    }}
                                                                                </v-list-item-title>
                                                                                <v-list-item-subtitle>
                                                                                    {{
                                                                                        getEstablishment(item.establishments_id)
                                                                                    }}
                                                                                </v-list-item-subtitle>
                                                                            </v-list-item-content>
                                                                        </v-list-item>
                                                                    </v-card>

                                                                </div>
                                                            </v-expand-transition>

                                                            <template v-slot:placeholder>
                                                                <v-row
                                                                    class="fill-height ma-0"
                                                                    align="center"
                                                                    justify="center"
                                                                >
                                                                    <loading-component/>
                                                                </v-row>

                                                            </template>
                                                        </v-img>
                                                    </v-card>

                                                </v-hover>

                                            </inertia-link>

                                            <v-card class="rounded-t-0">

                                                <v-list-item>
                                                    <template v-slot:default="{ active }">
                                                        <v-list-item-avatar color="grey lighten-2">
                                                            <v-icon class="text--white" color='orange'
                                                                    v-if="item.work_type=='Construcción'"
                                                                    v-text="'mdi-account-hard-hat'">
                                                            </v-icon>
                                                            <v-icon v-else color='green'
                                                                    v-text="'mdi-account-wrench'">
                                                            </v-icon>

                                                        </v-list-item-avatar>
                                                        <v-list-item-content>
                                                            <v-tooltip top>
                                                                <template v-slot:activator="{ on, attrs }">
                                                                    <v-list-item-title
                                                                        v-bind="attrs"
                                                                        v-on="on"
                                                                        class="text-uppercase"
                                                                        v-text="getHeadquarters(item.headquarters_id)">
                                                                    </v-list-item-title>
                                                                </template>
                                                                <span class="white--text text-uppercase">
                                                                    {{ getHeadquarters(item.headquarters_id) }}
                                                                </span>
                                                            </v-tooltip>
                                                            <v-tooltip bottom>
                                                                <template v-slot:activator="{ on, attrs }">
                                                                    <v-list-item-subtitle v-bind="attrs"
                                                                                          v-on="on"
                                                                                          class="text--primary text-uppercase"
                                                                                          v-text="getEstablishment(item.establishments_id)">
                                                                    </v-list-item-subtitle>
                                                                </template>
                                                                <span class="white--text text-uppercase">
                                                                    {{
                                                                        getEstablishment(item.establishments_id)
                                                                    }}
                                                                </span>
                                                            </v-tooltip>

                                                            <v-list-item-subtitle class="text-uppercase"
                                                                                  v-text="item.municipality">
                                                            </v-list-item-subtitle>
                                                        </v-list-item-content>
                                                        <v-list-item-action>


                                                            <v-tooltip top>
                                                                <template v-slot:activator="{ on, attrs }">
                                                                    <v-btn icon @click="openDialog(item)"
                                                                           v-bind="attrs"
                                                                           v-on="on">
                                                                        <v-icon color="grey lighten-1">
                                                                            mdi-map-marker-path
                                                                        </v-icon>
                                                                    </v-btn>
                                                                </template>
                                                                <span>Ruta desde el centro de soporte</span>
                                                            </v-tooltip>
                                                            <v-tooltip bottom>
                                                                <template v-slot:activator="{ on, attrs }">
                                                                    <v-btn icon @click="dailyRecords(item)"
                                                                           v-bind="attrs"
                                                                           v-on="on">
                                                                        <v-icon color="grey lighten-1"
                                                                                class="mr-1">
                                                                            mdi-chart-timeline
                                                                        </v-icon>
                                                                    </v-btn>
                                                                </template>
                                                                <span>Seguimiento de actividades</span>
                                                            </v-tooltip>
                                                        </v-list-item-action>
                                                    </template>
                                                </v-list-item>
                                            </v-card>
                                        </v-col>
                                    </v-row>
                                </v-list>
                            </div>
                            <div v-if="Object.keys(information).length<=0">
                                <v-row class="mt-2">
                                    <v-col cols="12" md="6" lg="4" v-for="item in 10" :key="item.id">
                                        <v-skeleton-loader
                                            v-bind="attrs"
                                            type="image,list-item-avatar-three-line"
                                        ></v-skeleton-loader>
                                    </v-col>
                                </v-row>
                            </div>
                        </v-sheet>
                    </v-col>
                </v-row>
            </v-container>


            <!--Dialog fullscreen-->
            <v-row justify="center">
                <v-dialog v-model="dialog" fullscreen hide-overlay transition="dialog-bottom-transition">
                    <v-card>

                        <v-toolbar dark color="primary">
                            <v-btn icon dark @click="dialog = false">
                                <v-icon>mdi-close</v-icon>
                            </v-btn>
                            <v-toolbar-title> {{ sede }}</v-toolbar-title>
                            <v-spacer></v-spacer>
                            <v-toolbar-items>
                                <v-btn dark text @click="dialog = false">
                                    cerrar
                                </v-btn>
                            </v-toolbar-items>
                        </v-toolbar>

                        <v-container style="height: 100vh;">
                            <v-sheet class="gray" min-height="70vh" rounded="lg">
                                <div class="iframe-container mx-auto rounded-lg" elevation="12">
                                    <iframe class="rounded-lg" :src="ruta" style="border: 0px; display: block;"
                                            allowfullscreen=""
                                            loading="lazy">
                                    </iframe>
                                </div>
                            </v-sheet>
                        </v-container>

                    </v-card>
                </v-dialog>
            </v-row>
        </div>
    </page-layout>
</template>
<script>
import PageLayout from '@/Layouts/PageLayout.vue'
import SpinnerComponent from "@/Components/SpinnerComponent.vue";
import loadingComponent from "@/Components/LoadingComponent.vue";

export default {
    name: "Follow",
    components: {
        PageLayout,
        SpinnerComponent,
        loadingComponent
    },
    props: ['data', 'errors'],
    data: () => ({
        tab: null,
        markers: [
            {id: 'a', position: {lat: 3, lng: 101}},
            {id: 'b', position: {lat: 5, lng: 99}},
            {id: 'c', position: {lat: 6, lng: 97}}
        ],
        lines: [
            {id: '1', path: [{lat: 3, lng: 101}, {lat: 5, lng: 99}]},
            {id: '2', path: [{lat: 5, lng: 99}, {lat: 6, lng: 97}]}
        ],
        sede: '',
        dialog: false,
        ruta: null,
        fav: true,
        menu: false,
        message: false,
        hints: true,
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/dashboard',
            },
            {
                text: 'Seguimientos',
                disabled: true,
                href: '#',
            },
        ],
        search: '',
        establishments: [],
        headquarters: [],
        information: [],
        works: [],
        isMunicipality: false,
        isWorkType: false,
        isEstablishments: false,
        group: null,
        element: null,
        attrs: {
            class: 'mb-6',
            elevation: 2,
        },
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

        axios.get('/dashboard/work/all')
            .then((response) => {
                //console.log(response.data)
                this.works = response.data
            })
            .catch((error) => {
                console.log(error)
            })

        this.applyChanges();
    },
    computed: {
        getData() {
            try {
                let search = this.search.toLowerCase()
                console.log('this is information => ', this.information, ' type => ', typeof this.information)

                let data = new Array();

                for (const key in this.information) {
                    // console.log(this.information[key])

                    let values = this.information[key].filter(item => {
                        console.log('this item =>', item)
                        const municipio = item.municipality.toLowerCase()
                        console.log("municipio")

                        console.log('establecimiento')
                        const establecimiento = this.getEstablishment(item.establishments_id).toLowerCase()
                        console.log("sede")
                        const sede = this.getHeadquarters(item.headquarters_id).toLowerCase()
                        console.log("tipo")
                        const tipo = item.work_type.toLowerCase()
                        if (this.isMunicipality && !this.isWorkType && !this.isEstablishments) {
                            return municipio.indexOf(search) > -1
                        } else if (this.isMunicipality && this.isWorkType && !this.isEstablishments) {
                            return municipio.indexOf(search) > -1 || tipo.indexOf(search) > -1
                        } else if (this.isMunicipality && !this.isWorkType && this.isEstablishments) {
                            return municipio.indexOf(search) > -1 || establecimiento.indexOf(search) > -1
                        } else if (!this.isMunicipality && this.isWorkType && !this.isEstablishments) {
                            return tipo.indexOf(search) > -1
                        } else if (!this.isMunicipality && this.isWorkType && !this.isEstablishments) {
                            return tipo.indexOf(search) > -1
                        } else if (!this.isMunicipality && !this.isWorkType && this.isEstablishments) {
                            return establecimiento.indexOf(search) > -1
                        } else {
                            return municipio.indexOf(search) > -1 ||
                                establecimiento.indexOf(search) > -1 ||
                                sede.indexOf(search) > -1 ||
                                tipo.indexOf(search) > -1
                        }

                    })
                    // console.log('this is key => ', key);
                    data[key] = values;
                    // console.log('this is values  => ', values);
                }

                console.log('this is data => ', data)
                return Object.assign({}, data);

            } catch (e) {
                console.log("Error inesperado => ", e)
                return this.information
            }
        }
    },
    methods: {
        async dailyRecords(item) {
            try {
                console.log('daily Records', item)
                let municipality = item.municipality
                let establishments = await this.getEstablishment(item.establishments_id)
                let headquarters = await this.getHeadquarters(item.headquarters_id)
                let work_type = item.work_type

                if (work_type === "Adecuación") {
                    let options = {
                        target: "_blank"
                    }
                    this.$inertia.get(route('work.adequacy', {
                        municipality,
                        establishments,
                        headquarters
                    }), null, options);

                    /*window.open(route('work.adequacy', {
                        municipality,
                        establishments,
                        headquarters
                    }), '_blank');*/

                } else {
                    window.open(route('work.building', {
                        municipality,
                        establishments,
                        headquarters
                    }), '_blank');
                }

            } catch (e) {
                console.error(e)
            }

        },
        openDialog(item) {
            console.log(item)
            this.element = item
            this.sede = this.getHeadquarters(item.headquarters_id);
            this.ruta = item.coordinates;
            this.dialog = true;
        },
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
                // console.log(id)
                let found = null;
                if (typeof (id) !== 'number') {
                    let nuevo = this.getNumber(id)
                    //console.log(nuevo)
                    found = this.headquarters.find(
                        element => element.id === nuevo
                    );
                } else {
                    found = this.headquarters.find(
                        element => element.id === id
                    );
                }
                return found.name;
            } catch (e) {
                return null;
            }
        },


        applyChanges() {
            console.log('se ejecuta apply changes')
            const headers = {
                'Access-Control-Allow-Origin': 'http://127.0.0.1:8000/',
                'Access-Control-Allow-Credentials': 'true'
            }
            axios.get(`/dashboard/work/group-by/${this.group}`, headers)
                .then((response) => {
                    console.log(response.data)
                    this.information = response.data
                })
                .catch((error) => {
                    console.log(error)
                })
        },
        getDirectory(item) {
            return encodeURIComponent(item.municipality + '/' + this.getEstablishment(item.establishments_id) + '/' + this.getHeadquarters(item.headquarters_id))
        }
    }
}
</script>

<style>
.v-card--reveal {
    align-items: center;
    bottom: 0;
    justify-content: center;
    opacity: .8;
    position: absolute;
    width: 100%;
}

.iframe-container iframe {
    border: 0;
    height: calc(100vh - 100px);
    width: 100%;
    margin-right: auto !important;
    margin-left: auto !important;
}

.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}
</style>
