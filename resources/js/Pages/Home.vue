<template>
    <page-layout>
        <inertia-head>
            <title>Inicio</title>
            <meta content="pagina principal del sistema de gestión académica" name="description">
        </inertia-head>
        <v-img
            :aspect-ratio="16 / 9"
            :lazy-src="lazy"
            :src="bg"
            cover
            gradient="to top,rgb(5 11 31 / 48%), rgb(0 28 71 / 35%)"
            style="height: 65vh"
        >
            <v-row align="center" class="fill-height ma-0" justify="center">
                <v-responsive
                    class="d-flex align-center  fill-height"
                    style="height: 100%; width: 100%;"
                >
                    <h1
                        id="frase1"
                        class="text-center text--white  white--text font-weight-bold text-h3"
                    >
                        Software de
                    </h1>
                    <h1
                        id="frase2"
                        class="text-center secondary--text font-weight-black text-h2 animate__animated animate__slideInLeft"
                    >
                        Gestión Académica
                    </h1>
                </v-responsive>
            </v-row>
        </v-img>

        <!--
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
                                    class="text-center  primary&#45;&#45;text font-weight-black text-h4"
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
                                    class="text-center secondary&#45;&#45;text font-weight-black text-h4"
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
        -->

        <v-sheet class="rounded-0 py-8" light>
            <div class="px-3 pt-md-5 pb-0 mx-auto text-center">
                <div
                    class="base-section-heading text-center mb-0 animate__animated animate__animated:hover animate__zoomIn">
                    <div class="d-inline-flex mb-4">
                        <v-avatar color="secondary" size="56">
                            <v-icon dark large>
                                mdi-bulletin-board
                            </v-icon>
                        </v-avatar>
                    </div>
                    <h1
                        class="text-uppercase text-h5 font-weight-black mb-2 text-center">
                        Características del Sistema
                    </h1>

                    <v-responsive class="primary mx-auto mb-6" style="max-width: 48px;">
                        <v-divider/>
                    </v-responsive>
                </div>

                <v-container>
                    <p class="text-body-1 mx-auto grey--text text--darken-1 text-justify">
                        El Sistema para la Gestión Académica (SIGAC) surge como una solución de software desarrollado
                        por Ceindetec, para agilizar los procesos inherentes a las instituciones educativas. Con esta
                        aplicación se pueden llevar a cabo
                        procesos administrativos, que redundan en la centralización de la información de cada uno de los
                        estudiantes de la institución.
                    </p>
                    <div class="font-weight-bold text-left mx-auto mb-10">
                        Algunas de las características son:
                    </div>
                </v-container>
            </div>

            <v-container>
                <v-row>
                    <v-col v-for="item in features" :key="item.id" class="col-md-6 col-12">
                        <div class="pt-2 mb-8 d-flex">
                            <div class="text-center">
                                <div
                                    class="d-flex justify-center align-center d-inline-flex mb-3 base-avatar--outlined">
                                    <v-img :src="`/src/icons/null/null/${item.icon}`">
                                        <template v-slot:placeholder>
                                            <v-row
                                                align="center"
                                                class="fill-height ma-0"
                                                justify="center"
                                            >
                                                <loading-component/>
                                            </v-row>
                                        </template>
                                    </v-img>
                                </div>
                                <div class="text-caption" style="font-size: xx-small !important;"
                                     v-html="item.attribution"></div>
                            </div>
                            <div class="ml-6">
                                <h3 class="text-uppercase text-h6 font-weight-bold mb-3 text-left">
                                    {{ item.title }}
                                </h3>
                                <p class="base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0"
                                   style="max-width: 700px;">
                                    {{ item.description }}
                                </p>

                            </div>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </v-sheet>


        <v-sheet id="news" class=" theme--light rounded-0">

            <div class="px-3 pt-md-5 pb-0 mx-auto text-center">
                <div class="base-section-heading text-center mb-0 animate__animated:hover animate__zoomIn">
                    <div class="d-inline-flex mb-4">
                        <v-avatar color="secondary" size="56">
                            <v-icon dark large>
                                mdi-newspaper-variant-multiple-outline
                            </v-icon>
                        </v-avatar>
                    </div>
                    <h1 class="headline font-weight-bold mb-2 text-center">
                        NOTICIAS
                    </h1>

                    <v-responsive class="primary mx-auto mb-6" style="max-width: 48px;">
                        <v-divider/>
                    </v-responsive>

                    <p class="base-body body-1 mx-auto grey--text text--darken-1 text-center mb-10">
                        Estas son algunas noticias.
                    </p>
                </div>
            </div>


            <v-container>
                <v-row>

                    <v-col class="">
                        <v-sheet v-for="item in notices" :key="item.id" class="mb-12">
                            <v-img :src="`/storage/${item.image}`"
                                   cover
                                   height="350">

                                <template v-slot:placeholder>
                                    <v-row
                                        align="center"
                                        class="fill-height ma-0"
                                        justify="center"
                                    >
                                        <loading-component/>
                                    </v-row>
                                </template>


                                <v-row class="row ma-0 fill-height align-end justify-end">
                                    <v-sheet
                                        class="pa-2 d-inline-flex align-center justify-center  rounded-0 primary"
                                        dark
                                        style="height: 40px; width: 40px;">
                                        <v-icon dark>
                                            mdi-image
                                        </v-icon>
                                    </v-sheet>
                                </v-row>
                            </v-img>
                            
                            <v-sheet class="d-flex rounded-0" dark style="max-width: 100%;">
                                <div class="grow pa-2 body-2">
                                    <div class="d-flex align-center fill-height">
                                        <span class="px-2">{{ item.time }}</span>
                                        / <span class="px-2">{{ getDate(item.date) }} </span>
                                        / <span class="px-2 text-uppercase">{{ item.city }}</span>
                                    </div>
                                </div>
                            </v-sheet>

                            <div class="py-4">
                                <h3
                                    class="text-truncate text-uppercase text-h6 font-weight-bold mb-4 text-left">
                                    {{ item.title }}
                                </h3>
                                <div class="base-body text-body-1 grey--text text--darken-1 text-left mb-0"
                                     v-html="item.description">

                                </div>
                            </div>
                            <v-divider class="mt-6" light></v-divider>
                        </v-sheet>
                    </v-col>


                </v-row>
            </v-container>
        </v-sheet>

    </page-layout>
</template>

<script>


import PageLayout from '@/Layouts/PageLayout.vue';
import BreadCrumbs from '@/Components/BreadCrumbs.vue';

import bg from '@/../images/infantes_guajiros.jpg';
import lazy from '@/../images/infantes_guajiros_lazy.jpg';
import LoadingComponent from "@/Components/LoadingComponent.vue";


export default {
    components: {
        PageLayout,
        BreadCrumbs,
        "loading-component": LoadingComponent
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

        ],
        features: [
            {
                icon: 'cliente-servidor.png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/servidor" target="_blank" target="_blank" title="servidor iconos"> Flat Icons - Flaticon</a>',
                title: 'Tecnología cliente – servidor',
                description: 'Diseño y desarrollo con tecnología cliente – servidor óptimo para manejo de la información en redes e Internet, con niveles de usuario y seguridad personalizados.'
            }, {
                icon: 'curso-por-internet.png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/educacion-en-linea" target="_blank" title="educación en línea iconos">shmai - Flaticon</a>',
                title: 'En línea y tiempo real',
                description: 'Actualización, acceso a la información en línea y tiempo real, agilizando los procesos de manera fiable y efectiva desde cualquier lugar del mundo.'
            }, {
                icon: 'aprendizaje-electronico.png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/e-aprendizaje" target="_blank" title="e aprendizaje iconos">shmai - Flaticon</a>',
                title: 'Información actualizada',
                description: 'Realización de Procesos como: matrículas, actualización de información de las sedes y/ó estudiantes, calificación de estudiantes, promoción de estudiantes.'
            }, {
                icon: 'la-licenciatura.png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/elearning" target="_blank" title="elearning iconos">shmai - Flaticon</a>',
                title: 'Informes en línea',
                description: 'Asignación de carga académica a los docentes,  boletines de calificación,entrega de informes en línea pre-formateados para impresión, estadísticas por grado, grupo y sede.'
            }, {
                icon: 'calificaciones-de-los-estudiantes.png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/elearning" target="_blank" title="elearning iconos">shmai - Flaticon</a>',
                title: 'Información del personal',
                description: 'Registro y actualización de Docentes, Estudiantes, creación rápida de Novedades, Nivelaciones, Matrícula'
            }, {
                icon: 'curso-por-internet (1).png',
                attribution: '<a href="https://www.flaticon.es/iconos-gratis/aprendizaje" target="_blank" title="aprendizaje iconos">shmai - Flaticon</a>',
                title: 'Principios de desarrollo',
                description: 'Sistema modular, escalable, abierto a cambios, modificaciones y actualizaciones para que su aplicabilidad sea optima a través del tiempo.'
            },

        ],
        notices: []
    }),
    mounted() {
        console.log('mounted');
    },
    created() {
        console.log('created');
        axios.get('/notices/all')
            .then(response => {
                console.log(response.data)
                this.notices = response.data;
            })
            .catch(e => {
                // Podemos mostrar los errores en la consola
                console.log(e);
            });

    },
    methods: {
        getHeight() {
            return this.$vuetify.breakpoint.mdAndUp
                ? 136
                : this.$vuetify.breakpoint.xsOnly
                    ? 88
                    : 176;
        },
        getDate(date) {
            const opciones = {weekday: 'long', year: 'numeric', month: 'short', day: 'numeric'};
            let fecha = new Date(date);
            return fecha.toLocaleDateString('es-ES', opciones)
        }
    }
};
</script>

<style>
.base-avatar--outlined {
    /*border: solid 1px grey;*/
    /*border-radius: 50%;*/
    height: 84px;
    min-width: 84px;
    width: 84px;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
</style>
