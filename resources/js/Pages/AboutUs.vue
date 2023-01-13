<template>
    <page-layout>
        <section>
            <v-row class="no-gutters">
                <v-col class="col col-12">
                    <section>
                        <v-img
                            cover
                            color="#45516b"
                            gradient="to top, rgba(5, 11, 31, 0.8), rgba(5, 11, 31, 0.8)"
                            :src="bg"
                            max-width="100%"
                            style="height: 250px; max-width: 100%;"
                        >
                            <v-row
                                class="ma-0 fill-height text-center d-flex align-center justify-center"
                            >
                                <v-col class="col-12">
                                    <h1
                                        class="text-h3 font-weight-500 mb-2  white--text animate__animated animate__zoomIn"
                                    >
                                        Nosotros
                                    </h1>
                                    <v-responsive
                                        dense
                                        class="secondary mx-auto mb-6 base-divider--dense"
                                        style="max-width: 28px;"
                                    >
                                        <div class="v-responsive__content">
                                            <v-divider></v-divider>
                                        </div>
                                    </v-responsive>
                                    <v-breadcrumbs
                                        class="secondary--text justify-center pa-0 theme--dark "
                                        :items="items"
                                        divider="/"
                                    >
                                        <template v-slot:item="{ item }">
                                            <v-breadcrumbs-item
                                                :href="item.href"
                                                :disabled="item.disabled"
                                            >
                                                <span
                                                    :class="
                                                        item.disabled
                                                            ? 'white--text'
                                                            : 'secondary--text'
                                                    "
                                                >
                                                    {{
                                                        item.text.toUpperCase()
                                                    }}
                                                </span>
                                            </v-breadcrumbs-item>
                                        </template>
                                    </v-breadcrumbs>
                                </v-col>
                            </v-row>
                        </v-img>
                    </section>
                </v-col>
            </v-row>
        </section>

        <section>
            <v-container>
                <v-row class="px-sm-12">
                    <v-col class="col-12">
                        <div class="text-left my-12">
                            <h1 class="text-uppercase text-h5 font-weight-bold mb-2 text-left">
                                ¿QUIENES SOMOS?
                            </h1>
                            <v-responsive class=" rounded-lg primary mr-auto mb-6" style="max-width: 100px;">
                                <v-divider light class="pb-1 rounded-lg"/>
                            </v-responsive>

                            <p class="base-body text-body-1  grey--text text--darken-1  mb-10 text-justify">
                                La Corporación Centro de Investigación y Desarrollo Tecnológico de los llanos –
                                CEINDETEC Llanos es una entidad sin ánimo de lucro dedicada al fomento de la
                                Investigación y al diseño y desarrollo de tecnologías innovadoras, de alta calidad que
                                se adaptan a las necesidades específicas de nuestros clientes.
                            </p>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </section>

        <section
            style="background-color: rgb(218, 218, 218);"
        >
            <v-row class="py-5 my-0">
                <v-col class="col">
                    <v-container class="container">
                        <v-row
                            class="d-flex justify-content-around justify-center "
                        >
                            <v-col class="col-12 col-md-6 col-lg-5">
                                <v-card
                                    tile
                                    class="mr-1 fill-height animate__animated animate__bounceInLeft"
                                >
                                    <v-card-title>
                                        <h4
                                            class="white--text d-flex justify-center secondary pt-2 pb-2 white--text fill-width"
                                            style="width: 100%"
                                        >
                                            Misión
                                        </h4>
                                    </v-card-title>

                                    <v-card-text>
                                        <p
                                            class="mx-2 my-3 text-subtitle-1 text-justify"
                                        >
                                            Desarrollar tecnología,
                                            investigación e innovación de alta
                                            calidad para el desarrollo humano.
                                        </p>
                                    </v-card-text>
                                </v-card>
                            </v-col>
                            <div class="col-12 col-md-6 col-lg-5 mt-4 mt-md-0">
                                <v-card
                                    class="mr-1 fill-height  animate__animated animate__bounceInRight"
                                >
                                    <v-card-title class="">
                                        <h4
                                            class="white--text d-flex justify-center primary pt-2 pb-2 white--text fill-width"
                                            style="width: 100%"
                                        >
                                            Visión
                                        </h4>
                                    </v-card-title>

                                    <v-card-text>
                                        <p
                                            class="mx-2 my-3 text-subtitle-1 text-justify"
                                        >
                                            Para el año 2025 ser líderes en
                                            investigación, desarrollo
                                            tecnológico e innovación a nivel
                                            nacional, apoyando a personas y
                                            empresas en la creación, innovación
                                            e implementación de productos y
                                            servicios tecnológicos de alto
                                            impacto social que aporten al
                                            desarrollo de ecosistemas
                                            industriales, ambientales y humanos
                                            Integrando a la academia, las
                                            empresas privadas y el estado.
                                        </p>
                                    </v-card-text>
                                </v-card>
                            </div>
                        </v-row>
                    </v-container>
                </v-col>
            </v-row>
        </section>

        <section>
            <v-container>
                <v-row class="px-sm-12">
                    <v-col class="col-12">
                        <div class="text-left my-12">
                            <h1 class="text-uppercase text-h5 font-weight-bold mb-2 text-left">
                                NUESTROS SERVICIOS
                            </h1>
                            <v-responsive class=" rounded-lg primary mr-auto mb-6" style="max-width: 100px;">
                                <v-divider light class="pb-1 rounded-lg"/>
                            </v-responsive>

                            <div class="pa-4 mt-6 ">
                                <v-row>
                                    <v-col v-for="item in services" :key="item.id"
                                           class="col-12  col-md-6 col-lg-4 ">
                                        <div class="d-flex align-center">
                                            <div class="mr-2">
                                                <v-avatar class="elevation-4" color="primary" size="144">
                                                    <v-avatar size="140" class="">
                                                        <v-img :src="`/src/about-us/services/null/${item.src}`">
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
                                                    </v-avatar>
                                                </v-avatar>
                                            </div>
                                            <div>
                                                <div class="text-body-1 font-weight-black">{{ item.title }}</div>
                                                <div class="text-subtitle-1 text-md-justify text-lg-left">
                                                    {{ item.description }}
                                                </div>
                                            </div>
                                        </div>
                                    </v-col>
                                </v-row>
                            </div>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </section>

        <section>
            <v-container>
                <v-row class="px-sm-12">
                    <v-col class="col-12">
                        <div class="text-left my-12">
                            <h1 class="text-uppercase text-h5 font-weight-bold mb-2 text-left">
                                NUESTROS PRODUCTOS
                            </h1>

                            <v-responsive class=" rounded-lg primary mr-auto mb-6" style="max-width: 100px;">
                                <v-divider light class="pb-1 rounded-lg"/>
                            </v-responsive>

                            <div class="pa-4 mt-6 ">
                                <v-row>
                                    <v-col v-for="(item, n) in products" :key="item.id"
                                           class="col-sm-6 col-12">
                                        <div class="d-flex align-center"
                                             :class="{'flex-row-reverse':n%2!==0}">
                                            <div class="mr-2">
                                                <v-avatar class="elevation-4" color="grey" size="124">
                                                    <v-avatar size="120" class="">
                                                        <v-img :src="`/src/about-us/products/null/${item.src}`">
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
                                                    </v-avatar>
                                                </v-avatar>
                                            </div>
                                            <div>
                                                <div class="text-body-1 font-weight-black">{{ item.title }}</div>
                                                <div class="text-subtitle-1">{{ item.description }}
                                                </div>
                                            </div>
                                        </div>
                                    </v-col>
                                </v-row>
                            </div>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </section>
    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout.vue';
import bg from '@/../images/computer3.jpg';
import LoadingComponent from "@/Components/LoadingComponent.vue";

export default {
    name: 'AboutUs',
    components: {
        LoadingComponent,
        PageLayout
    },
    data: () => ({
        bg,
        items: [
            {
                text: 'Inicio',
                disabled: false,
                href: '/'
            },
            {
                text: 'Nosotros',
                disabled: true,
                href: ''
            }
        ],
        services: [
            {
                title: 'Desarrollo de software y hardware ',
                description: 'Software y hardware a la medida, software estándar, sistemas inteligentes, Apps móviles.',
                src: 'Imagen1.png'
            }, {
                title: 'Consultoría, interventoría y auditoría en software y hardware',
                description: 'Asesorías especializadas para su empresa.',
                src: 'Imagen2.png'
            }, {
                title: 'Cursos y capacitaciones ',
                description: 'Capacitaciones en distintas tecnologías y temáticas sobre ciencias básicas e ingenierías.',
                src: 'Imagen3.png'
            }, {
                title: 'Automatización de procesos',
                description: 'Mejore la productividad de su negocio, tecnifique sus procesos y reduzca riesgos\n',
                src: 'Imagen4.png'
            }, {
                title: 'Investigación y desarrollo de nuevos productos y servicios',
                description: 'Sistemas inalámbricos y Diseños de prototipos',
                src: 'Imagen5.png'
            }, {
                title: 'Redes eléctricas ',
                description: 'Electricidad y alternativas energéticas.',
                src: 'Imagen6.png'
            }, {
                title: 'Diseño de circuitos impresos',
                description: 'Fabricación de tarjetas electrónicas.',
                src: 'Imagen7.png'
            }, {
                title: 'Tecnología en realidad aumentada ',
                description: 'Experiencias digitales de alto impacto para el comercio y la academia.',
                src: 'Imagen8.png'
            }, {
                title: 'Suministro de componentes tecnológicos',
                description: 'Venta de equipos de cómputo y de red, instalación de redes en oficinas u hogares.',
                src: 'Imagen9.png'
            }, {
                title: 'Producción de sistemas holográficos ',
                description: 'Muestre sus productos de manera diferente e innovadora',
                src: 'Imagen10.png'
            },
        ],
        products: [
            {
                title: 'PHYSILAB+',
                description: 'Tus prácticas de laboratorio de física en un solo lugar, fácil, rápidas e interactivas.',
                src: 'Imagen1.png'
            }, {
                title: 'CUSTODE',
                description: 'Olvídate de abrir o cerrar la puerta de tu negocio u hogar de forma manual. Con Custode, toma el control y permite únicamente   el   ingreso   de   personal autorizado.',
                src: 'Imagen2.png'
            }, {
                title: 'IKARO',
                description: 'Diseño y fabricación de prótesis utilizando tecnología de impresión 3D.',
                src: 'Imagen3.png'
            }, {
                title: 'LEARNING WORDS',
                description: 'La plataforma aliada de los estudiantes que te ayudará a ampliar tu vocabulario, en diferentes idiomas.',
                src: 'Imagen4.png'
            }, {
                title: 'WICKO',
                description: 'Tener un hogar inteligente ahora es posible. Esta es tu oportunidad, disfruta de la comodidad, la seguridad y el confort que Wicko tiene para ti.',
                src: 'Imagen5.png'
            }, {
                title: 'GOADVISERS',
                description: 'Mejora la presencia digital de tu negocio y obtén herramientas digitales que harán tu negocio más competitivo ante el mundo.',
                src: 'Imagen6.png'
            },
        ]
    })
};
</script>

<style>


/* Spinner 1 starts here */

@keyframes spinnerOne {
    0% {
        transform: rotate(0deg)
    }
    100% {
        transform: rotate(360deg)
    }
}

/* Spinner 1 ends here */
</style>
