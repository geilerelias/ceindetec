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

        <section
            style="background-color: rgb(218, 218, 218); height: calc(100vh - 250px);"
        >
            <v-row class="py-5 my-0 fill-height">
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
        
    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';
import bg from '@/../images/computer3.jpg';

export default {
    name: 'AboutUs',
    components: {
        PageLayout,
        BreadCrumbs
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
        ]
    })
};
</script>

<style scoped></style>
