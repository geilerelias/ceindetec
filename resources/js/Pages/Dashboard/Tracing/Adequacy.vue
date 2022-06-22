<template>
    <div>
        <v-app v-for="(item, pag) in allSedes" :key="item.id" id="inspire">
            {{ item }}
            <v-system-bar></v-system-bar>
            <v-card flat tile class="primary" style="max-height: 80px; height: 80px">

                <v-card-text class="d-flex justify-space-around align-center fill-height">
                    <img :src="logo" alt="" width="150px" class="float-right"/>
                    <v-spacer></v-spacer>
                    <div class="text-right">
                        <div class="text-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                            {{
                                getHeadquarters(item.headquarters_id)
                            }}
                        </div>
                        <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                            {{ getEstablishment(item.establishments_id) }}
                        </div>
                        <div class="text-subtitle-2 white--text font-weight-bold py-0 my-0">
                            {{ item.municipality }}
                        </div>
                    </div>
                    <p class="text-h5 white--text font-weight-bold text-uppercase text-center ma-12">

                    </p>
                </v-card-text>
            </v-card>
            <v-toolbar dense class="secondary" style="max-height: 10px;"></v-toolbar>
            <v-main class="bg pt-6">


                <v-container fluid>
                    <v-row>
                        <v-col class="d-flex" v-for="(elemento, i) in item.items" :key="item.id">
                            <v-card color="transparent" flat width="100%">
                                <v-card-title class="d-flex justify-center align-center">
                                    <v-card
                                        class=" white--text font-weight-bold text-center text-h6 white--text font-weight-bold"
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
                </v-container>


                <v-footer padless color="transparent">

                    <v-col
                        class="px-8"
                        cols="12"
                    >
                        <div
                            class="d-flex ">
                            {{
                                new Date().toLocaleDateString("es-Es")
                            }}
                            <v-spacer></v-spacer>
                            Pagina &nbsp; <span class="font-weight-bold">  {{ (pag + 1) }}</span>
                        </div>
                    </v-col>
                </v-footer>
            </v-main>
        </v-app>
    </div>
</template>

<script>
import logo from '@/../images/logo-ceindetec.png';
import * as VueGoogleMaps from 'vue2-google-maps'

export default {
    name: "Index",
    components: {
        VueGoogleMaps
    },
    props: ['data'],
    data: () => ({
        logo,
        allSedes: [],
        headquarters: [],
        establishments: []

    }),
    async created() {
        this.establishments = await axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                console.log(error)
            })

        this.headquarters = await axios.get('/dashboard/headquarters/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                console.log(error)
            })

        this.allSedes = this.data
        this.$nextTick(async () => {
            console.log('este es headquarters => ', this.headquarters)
            console.log('este es establishments => ', this.establishments)
            for (let i = 0; i < this.allSedes.length; i++) {
                console.log('esta es all Sedes => ', this.allSedes[i])
                let municipality = this.allSedes[i].municipality
                let establishments = await this.getEstablishment(this.allSedes[i].establishments_id)
                let headquarters = await this.getHeadquarters(this.allSedes[i].headquarters_id)
                axios
                    .get(`/get/tracing/adequacy/${municipality}/${headquarters}/${establishments}`)
                    .then(response => {
                        console.log(response.data);
                    });
            }
        })

        for (const key in this.data) {
            console.log('esta es data key => ', this.data[key])
        }

        var lista = [];
        /* for (let s = 0; s < this.allSedes.length; s++) {
             let folder = this.allSedes[s].name;
             console.log('este es el folder => ', folder)

             axios
                 .get(`/find/adecuacion/${folder}/antes`)
                 .then(response => {
                     lista = response.data;
                     console.log('esta es la lista => ', lista)
                     let images = [];
                     let firtImage = ``;
                     for (let i = 0; i < lista.length; i++) {
                         images.push(`/src/adecuacion/${folder}/antes/${lista[i]}`);
                         console.log(`/src/adecuacion/${folder}/antes/${lista[i]}`)
                     }
                     console.log(this.allSedes[s].items[0])
                     this.allSedes[s].items[0].src = images;
                 })
                 .catch(error => {
                     console.log(error);
                 });

             axios
                 .get(`/find/adecuacion/${folder}/durante`)
                 .then(response => {
                     lista = response.data;
                     console.log('esta es la lista => ', lista)
                     let images = [];
                     let firtImage = ``;
                     for (let i = 0; i < lista.length; i++) {
                         images.push(`/src/adecuacion/${folder}/durante/${lista[i]}`);
                         console.log(`/src/adecuacion/${folder}/durante/${lista[i]}`)
                     }
                     console.log(this.allSedes[s].items[1])
                     this.allSedes[s].items[1].src = images;
                 })
                 .catch(error => {
                     console.log(error);
                 });

             axios
                 .get(`/find/adecuacion/${folder}/despues`)
                 .then(response => {
                     lista = response.data;
                     console.log('esta es la lista => ', lista)
                     let images = [];
                     let firtImage = ``;
                     for (let i = 0; i < lista.length; i++) {
                         images.push(`/src/adecuacion/${folder}/despues/${lista[i]}`);
                         console.log(`/src/adecuacion/${folder}/despues/${lista[i]}`)
                     }
                     console.log(this.allSedes[s].items[2])
                     this.allSedes[s].items[2].src = images;
                 })
                 .catch(error => {
                     console.log(error);
                 });
         }
 */
    },
    methods: {
        getNumber(id) {
            // console.log('este es id =>', id, ' type => ', typeof (parseInt(id)));
            return parseInt(id)
        },
        getEstablishment(id) {
            try {
                console.log(id)
                console.log(typeof (id))
                let found = null;

                console.log(this.establishments)
                found = this.establishments.find((element) => {
                    console.log('element => ', element)
                    return element.id === id
                });

                console.log('este es found =>', found)
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
    }
}
</script>

<style>
.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}

.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Montserrat", sans-serif !important;
}
</style>
