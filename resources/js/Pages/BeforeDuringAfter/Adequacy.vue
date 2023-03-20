<template>
    <div>
        <simple-layout v-for="(item, pag) in allSedes" id="inspire" :key="item.id" class="bg">
            <template v-slot:header>
                <p class="text-h5 white--text font-weight-bold text-uppercase text-center ma-12">
                    {{ item.sede }}
                </p>
            </template>
            <v-main class="bg pt-6 fill-height">
                <v-container fluid>
                    <v-row>
                        <v-col v-for="(elemento, i) in item.items" :key="item.id"
                               :style="i!==0?'border-left: solid 3px rgba(158,158,158,1)':''" class="d-flex">
                            <v-card color="transparent" flat width="100%">
                                <v-card-title class="d-flex justify-center align-center">
                                    <v-card
                                        :color="getColor(elemento.title)"
                                        class=" white--text font-weight-bold text-center text-h6 white--text font-weight-bold"
                                        width="150">
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
                                                :aspect-ratio="16/9"
                                                :elevation="5"
                                                :src="src"
                                                class="grey lighten-2 rounded"
                                                @click="showImage(src)"
                                            >
                                                <template v-slot:placeholder>
                                                    <v-row
                                                        align="center"
                                                        class="fill-height ma-0"
                                                        justify="center"
                                                    >
                                                        <v-progress-circular
                                                            color="grey lighten-5"
                                                            indeterminate
                                                        ></v-progress-circular>
                                                    </v-row>
                                                </template>
                                            </v-img>
                                        </v-col>
                                    </v-row>
                                </v-card-text>
                            </v-card>
                        </v-col>
                    </v-row>
                </v-container>
                <v-footer color="transparent" padless>

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

            <div class="text-center">
                <v-dialog
                    v-model="dialog"
                    fullscreen
                    hide-overlay
                    transition="dialog-bottom-transition"
                >
                    <v-card>
                        <v-toolbar
                            color="primary"
                            dark
                        >
                            <v-btn
                                dark
                                icon
                                @click="dialog = false"
                            >
                                <v-icon>mdi-close</v-icon>
                            </v-btn>
                            <v-toolbar-title>Settings</v-toolbar-title>
                            <v-spacer></v-spacer>
                            <v-toolbar-items>
                                <v-btn
                                    dark
                                    text
                                    @click="dialog = false"
                                >
                                    Save
                                </v-btn>
                            </v-toolbar-items>
                        </v-toolbar>
                        <v-img
                            :aspect-ratio="16/9"
                            :src="pathImage"
                            class="grey lighten-2 rounded"
                            contain
                        >
                            <template v-slot:placeholder>
                                <v-row
                                    align="center"
                                    class="fill-height ma-0"
                                    justify="center"
                                >
                                    <v-progress-circular
                                        color="grey lighten-5"
                                        indeterminate
                                    ></v-progress-circular>
                                </v-row>
                            </template>
                        </v-img>
                    </v-card>
                </v-dialog>
            </div>

        </simple-layout>
    </div>
</template>

<script>
import logo from "@/Components/Logo.vue";


import SimpleLayout from "@/Layouts/SimpleLayout.vue";

export default {
    name: "Index",
    components: {
        SimpleLayout,
        VueGoogleMaps,
        logo
    },
    data: () => ({
        logo,
        allSedes: [
            {
                sede: "Escuela Indígena Almirante Padilla",
                name: 'almirante_padilla',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            },
            {
                sede: "Escuela Rural de Santa Fe",
                name: 'santa_fe',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            },
            {
                sede: "Escuela Rural Siete de Junio",
                name: 'siete_de_junio',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            },
            {
                sede: "Instititucion educativa rural san antonio de palomino",
                name: 'san_antonio_de_palomino',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Cleotilde Povea de Romero",
                name: 'povea',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Tomas Emilio Medina Curiel",
                name: 'tomas_emilio',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Mixta Emira Armenta",
                name: 'emira_armenta',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            },
            {
                sede: "Centro etnoeducativo rural de ishashimana",
                name: 'ishashimana',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Rural Indígena Manzana",
                name: 'manzana',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Urbana Mixta Primero de Octubre",
                name: 'primero_de_octubre',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Escuela Urbana Santa Rita de Cassia",
                name: 'santa_rita_de_cassia',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Institución etnoducativa rural internado laachon mayapo",
                name: 'laachon',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            }, {
                sede: "Institución etnoeducativa san rafael del pájaro",
                name: 'el_pajaro',
                items: [
                    {
                        title: 'Antes',
                        src: []
                    },
                    {
                        title: "Durante",
                        src: []
                    },
                    {
                        title: "Después",
                        src: []
                    },
                ]
            },
        ],
        dialog: false,
        pathImage: ''
    }),
    created() {
        var lista = [];
        for (let s = 0; s < this.allSedes.length; s++) {
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

    },
    methods: {
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
        showImage(src) {
            this.pathImage = src
            this.dialog = true
        },
        back() {
            window.history.back()
        }
    }
}
</script>

<style scoped>
.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}

</style>
