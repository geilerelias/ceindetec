<template>
    <page-layout>
        <v-img
            :src="bg"
            :lazy-src="lazy"
            :aspect-ratio="16 / 9"
            style="height: 65vh"
            cover
            gradient="to top,rgb(5 11 31 / 48%), rgb(0 28 71 / 35%)"
        >
            <v-row class="fill-height ma-0" align="center" justify="center">
                <v-responsive
                    class="d-flex align-center  fill-height"
                    style="height: 100%; width: 100%;"
                >
                    <h1
                        class="text-center text--white  white--text font-weight-bold text-h3"
                        id="frase1"
                    >
                        Software de
                    </h1>
                    <h1
                        class="text-center secondary--text font-weight-black text-h2 animate__animated animate__slideInLeft"
                        id="frase2"
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
       
        <v-sheet light class="rounded-0 py-8">
            <div class="my-12">
                <h1
                    class="text-uppercase text-h5 font-weight-black mb-2 text-center"> Características del Sistema </h1>
                <v-responsive class="primary mx-auto mb-6" style="max-width: 48px;">
                    <v-divider/>
                </v-responsive>
                <v-container>
                    <p class="text-body-1 mx-auto grey--text text--darken-1 text-justify">
                        El Sistema para la Gestión Académica (SIGAC) surge como una solución de software desarrollado
                        por
                        Ceindetec, para agilizar los
                        procesos inherentes a las instituciones educativas. Con esta aplicación se pueden llevar a cabo
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

    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';

import bg from '@/../images/infantes_guajiros.jpg';
import lazy from '@/../images/infantes_guajiros_lazy.jpg';

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

<style>
.base-avatar--outlined {
    /*border: solid 1px grey;*/
    /*border-radius: 50%;*/
    height: 84px;
    min-width: 84px;
    width: 84px;
}
</style>
