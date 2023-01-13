<template>
    <div class="bg">
        <v-app id="inspire">
            <v-card outlined id="no-print-header" tile>
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
                            Antes, Durante y Después
                        </div>
                        <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0"
                             v-if="$vuetify.breakpoint.smAndUp">
                            comparativa del proceso de construcción y adecuación
                        </div>
                    </div>
                </v-toolbar>
                <v-toolbar dense class="secondary" max-height="10"></v-toolbar>
            </v-card>

            <v-main class="transparent pt-6 bg">
                <v-container>
                    <v-row class="d-flex justify-center">
                        <v-col class="col-sm-6 col-md-4 col-lg-3 col-12" v-for="item in items" :key="item.id">
                            <inertia-link :href="item.link"
                                          class="text-decoration-none">
                                <v-hover v-slot="{ hover }">
                                    <v-card class="pa-0">
                                        <v-img cover
                                               :aspect-ratio="1/1"
                                               style="transition: all 0.5s;"
                                               :class="hover ? 'zoom' : ''"
                                               :src="`/src/null/null/null/${item.src}`">
                                            <v-expand-transition>
                                                <div
                                                    v-if="hover"
                                                    class="d-flex transition-fast-in-fast-out primary darken-2 v-card--reveal text-h4 white--text"
                                                    style="height: 100%;"
                                                >
                                                    {{ item.title }}
                                                </div>
                                            </v-expand-transition>
                                            <template v-slot:placeholder>
                                                <v-row
                                                    class="fill-height ma-0"
                                                    align="center"
                                                    justify="center"
                                                >
                                                    <v-progress-circular
                                                        indeterminate
                                                        color="primary"
                                                    ></v-progress-circular>
                                                </v-row>

                                            </template>
                                        </v-img>
                                    </v-card>

                                </v-hover>
                            </inertia-link>
                        </v-col>
                    </v-row>
                </v-container>
            </v-main>
        </v-app>
    </div>
</template>

<script>
import logo from "@/Components/Logo.vue";

export default {
    components: {
        logo
    },
    name: "Index",
    data: () => ({
        items: [{
            link: '/before-during-after/building',
            title: 'Construcciones',
            src: 'construcciones.jpeg'
        }, {
            link: '/before-during-after/adequacy',
            title: 'Adecuaciones',
            src: 'adecuaciones.jpeg'
        }]
    }),
    methods: {
        back() {
            window.history.back()
        }
    }
}
</script>

<style>
.v-card--reveal {
    align-items: center;
    bottom: 0;
    justify-content: center;
    opacity: .5;
    position: absolute;
    width: 100%;
}

/*zoom en imagenes*/
.v-image .v-image__image {
    transition: all 0.6s;
}

.v-image.zoom .v-image__image {
    transform: scale(1.2);
}

.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}


</style>
