<template>
    <div>
        <simple-layout v-for="(item, pag) in allSedes" :key="item.id" id="inspire">
            <v-system-bar></v-system-bar>
            <template v-slot:header>
                <p class="text-h5 white--text font-weight-bold text-uppercase text-center ma-12">
                    {{ item.sede }}
                </p>
            </template>

            <v-main class="bg pt-6">
                <v-container fluid>
                    <v-row>
                        <v-col style="border-left: solid 3px rgba(158,158,158,1)" class="d-flex"
                               v-for="(elemento, i) in item.items"
                               :key="item.id">
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
        logo
    },
    data: () => ({
        allSedes: [
            {
                sede: "Centro educativo rural buenos aires de campana",
                name: 'campana',
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
                sede: "Centro etnoeducativo #4 (El Pasito)",
                name: 'el_pasito',
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
                sede: "Escuela Indígena Itaka",
                name: 'itaka',
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
                sede: "Escuela Rural Indígena iyospa",
                name: 'iyospa',
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
                sede: "Escuela Rural de La Granjita",
                name: 'la_granjita',
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
                sede: "Centro etnoeducativo #8 (paraver)",
                name: 'paraver',
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
                sede: "Escuela Rural Indígena Ricardo Gómez",
                name: 'ricardo_gomez',
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
                sede: "Escuela Rural Indígena Tatailamana",
                name: 'tatailamana',
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
        ]
    }),
    created() {
        var lista = [];
        for (let s = 0; s < this.allSedes.length; s++) {
            let folder = this.allSedes[s].name;
            console.log('este es el folder => ', folder)

            axios
                .get(`/find/construccion/${folder}/antes`)
                .then(response => {
                    lista = response.data;
                    console.log('esta es la lista => ', lista)
                    let images = [];
                    for (let i = 0; i < lista.length; i++) {
                        images.push(`/src/construccion/${folder}/antes/${lista[i]}`);
                        console.log(`/src/construccion/${folder}/antes/${lista[i]}`)
                    }
                    console.log(this.allSedes[s].items[0])
                    this.allSedes[s].items[0].src = images;
                })
                .catch(error => {
                    console.log(error);
                });

            axios
                .get(`/find/construccion/${folder}/durante`)
                .then(response => {
                    lista = response.data;
                    console.log('esta es la lista => ', lista)
                    let images = [];
                    let firtImage = ``;
                    for (let i = 0; i < lista.length; i++) {
                        images.push(`/src/construccion/${folder}/durante/${lista[i]}`);
                        console.log(`/src/construccion/${folder}/durante/${lista[i]}`)
                    }
                    console.log(this.allSedes[s].items[1])
                    this.allSedes[s].items[1].src = images;
                })
                .catch(error => {
                    console.log(error);
                });

            axios
                .get(`/find/construccion/${folder}/despues`)
                .then(response => {
                    lista = response.data;
                    console.log('esta es la lista => ', lista)
                    let images = [];
                    let firtImage = ``;
                    for (let i = 0; i < lista.length; i++) {
                        images.push(`/src/construccion/${folder}/despues/${lista[i]}`);
                        console.log(`/src/construccion/${folder}/despues/${lista[i]}`)
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

.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Montserrat", sans-serif !important;
}
</style>
