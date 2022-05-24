<template>
    <page-layout>
        <v-img
            :src="bg"
            :lazy-src="lazy"
            :aspect-ratio="16 / 9"
            style="height: 65vh"
            cover
            gradient="to top right, rgba(100,115,201,.33), rgba(25,32,72,.7)"
        >
            <v-row class="fill-height ma-0" align="center" justify="center">
                <v-responsive
                    class="d-flex align-center  fill-height"
                    style="height: 100%; width: 100%;"
                >
                    <h1
                        class="text-center text-white font-weight-bold text-h4"
                        id="frase1"
                    >
                        Bienvenido a
                    </h1>
                    <h1
                        class="text-center secondary--text font-weight-black text-h3 animate__animated animate__slideInLeft"
                        id="frase2"
                    >
                        Ceindetec Llanos
                    </h1>
                </v-responsive>
            </v-row>
        </v-img>
        <section
            :style="`height:${$vuetify.breakpoint.mdAndUp ? '35vh' : 'auto'}`"
            :class="$vuetify.breakpoint.mdAndUp ? 'orange' : 'primary'"
        >
            <v-row
                class="d-flex fill-height ma-0 justify-content-around"
                align="center"
                justify="center"
            >
                <v-col
                    style="height: 100%; width: 100%;min-height: 200px;"
                    class="col-12 col-md-6  grey lighten-2 d-flex justify-center animate__animated animate__bounceInLeft"
                >
                    <v-responsive
                        class="d-flex align-center "
                        style="height: 100%; width: 100%; "
                    >
                        <h2 class="text-center">
                            <v-icon color="primary" size="80">
                                mdi-seal-variant
                            </v-icon>
                        </h2>
                        <h2
                            class="text-center  primary--text font-weight-black text-h4"
                        >
                            Empresa #1
                        </h2>
                        <p
                            class="text-center text-bold"
                            style="font-size: 20px"
                        >
                            Reconocida por Colciencias en la región de la
                            Orinoquía
                        </p>
                    </v-responsive>
                </v-col>

                <v-col
                    style="height: 100%; width: 100%;min-height: 200px;"
                    class="col-12 col-md-6  white  d-flex justify-center animate__animated animate__bounceInRight"
                >
                    <v-responsive
                        class="d-flex align-center fill-height"
                        style="height: 100%; width: 100%;"
                    >
                        <h2 class="text-center">
                            <v-icon color="primary" size="80">
                                mdi-file-certificate-outline
                            </v-icon>
                        </h2>
                        <h2
                            class="text-center secondary--text font-weight-black text-h4"
                        >
                            Certificado ISO 29110
                        </h2>
                        <p
                            class="text-center text-bold"
                            style="font-size: 20px"
                        >
                            Calidad en el Desarrollo de Software
                        </p>
                    </v-responsive>
                </v-col>
            </v-row>
        </section>
    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';

import bg from '@/../images/computer3.jpg';
import lazy from '@/../images/computer3-lazy.jpg';

export default {
    components: {
        PageLayout,
        BreadCrumbs
    },
    name: 'Home',
    data: () => ({
        justify: ['start', 'end', 'center', 'baseline', 'auto', 'stretch'],
        bg,
        lazy,
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: 'breadcrumbs_dashboard'
            },
            {
                text: 'Link 1',
                disabled: false,
                href: 'breadcrumbs_link_1'
            },
            {
                text: 'Link 2',
                disabled: true,
                href: 'breadcrumbs_link_2'
            }
        ]
    }),
    mounted() {
        console.log('mounted');
    },
    created() {
        console.log('created');
    },
    methods: {
        getHeight() {
            return this.$vuetify.breakpoint.mdAndUp
                ? 136
                : this.$vuetify.breakpoint.xsOnly
                ? 88
                : 176;
        }
    }
};
</script>

<style scoped></style>
