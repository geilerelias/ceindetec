<template>
    <page-layout>
        <inertia-head>
            <title>Inicio</title>
            <meta name="description" content="pagina principal del sistema de gestión académica">
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
                <div class="base-section-heading text-center mb-0 animate__animated animate__animated:hover animate__zoomIn">
                    <div class="d-inline-flex mb-4">
                        <v-avatar color="secondary" size="56">
                            <v-icon large dark>
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
                        por Ceindetec, para agilizar los procesos inherentes a las instituciones educativas. Con esta aplicación se pueden llevar a cabo
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
                            <v-icon large dark>
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
                        Estas son algunas de las
                        noticias mas destacadas.
                    </p>
                </div>
            </div>


            <v-container>
                <v-row>
                    <v-col class="col-md-8 col-12">
                        <div class="mb-12">
                            <a class="d-block" href="/news/lorem-ipsum-dolor-sit-amet-consectetur">
                                <div class="v-image v-responsive theme--light" flat="" height="250"
                                     src="/img/article-3.31c0885e.jpg"
                                     style="height: 250px;" tile="">
                                    <div class="v-responsive__sizer" style="padding-bottom: 66.7188%;"></div>

                                    <div class="v-image__image v-image__image--cover"
                                         style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/article-3.31c0885e.jpg&quot;); background-position: center center;"></div>

                                    <div class="v-responsive__content" style="width: 640px;">
                                        <div class="row ma-0 fill-height align-end justify-end">
                                            <div
                                                class="pa-2 d-inline-flex align-center justify-center v-sheet theme--dark rounded-0 primary"
                                                style="height: 40px; width: 40px;"><i aria-hidden="true"
                                                                                      class="v-icon notranslate mdi mdi-image theme--dark"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <div class="d-flex v-sheet theme--dark rounded-0" style="max-width: 100%;">
                                <div class="grow pa-2 body-2">
                                    <div class="d-flex align-center fill-height"><span class="px-2">Jan 12, 2020</span>
                                        / <span class="px-2">Research Discussions</span> / <span
                                            class="px-2">5 Comments</span></div>
                                </div>
                            </div>
                            <div class="pa-4"><h3
                                class="text-truncate text-uppercase text-h6 font-weight-bold mb-4 text-left"> Lorem
                                ipsum dolor, sit amet consectetur </h3>
                                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-0">
                                <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero dolorem, eos
                                    sapiente, ad voluptatem eveniet, a cum blanditiis consequatur esse facere minima!
                                    Non, minus ullam facere earum labore aperiam aliquam.
                                </div>
                                </p></div><!---->
                            <hr aria-orientation="horizontal" class="mt-6 v-divider theme--light" role="separator">
                        </div>
                        <div class="mb-12"><a class="d-block" href="/news/lorem-ipsum-dolor-sit-amet-consectetur">
                            <div class="v-image v-responsive theme--light" flat="" height="250"
                                 src="/img/article-1.bfc29386.jpg"
                                 style="height: 250px;" tile="">
                                <div class="v-responsive__sizer" style="padding-bottom: 66.5625%;"></div>
                                <div class="v-image__image v-image__image--cover"
                                     style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/article-1.bfc29386.jpg&quot;); background-position: center center;"></div>
                                <div class="v-responsive__content" style="width: 640px;">
                                    <div class="row ma-0 fill-height align-end justify-end">
                                        <div
                                            class="pa-2 d-inline-flex align-center justify-center v-sheet theme--dark rounded-0 primary"
                                            style="height: 40px; width: 40px;"><i aria-hidden="true"
                                                                                  class="v-icon notranslate mdi mdi-play theme--dark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                            <div class="d-flex v-sheet theme--dark rounded-0" style="max-width: 100%;">
                                <div class="grow pa-2 body-2">
                                    <div class="d-flex align-center fill-height"><span class="px-2">Oct 19, 2019</span>
                                        / <span class="px-2">Growth Strategy</span> / <span
                                            class="px-2">8 Comments</span></div>
                                </div>
                            </div>
                            <div class="pa-4"><h3
                                class="text-truncate text-uppercase text-h6 font-weight-bold mb-4 text-left"> Lorem
                                ipsum dolor, sit amet consectetur </h3>
                                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-0">
                                <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero dolorem, eos
                                    sapiente, ad voluptatem eveniet, a cum blanditiis consequatur esse facere minima!
                                    Non, minus ullam facere earum labore aperiam aliquam.
                                </div>
                                </p></div><!---->
                            <hr aria-orientation="horizontal" class="mt-6 v-divider theme--light" role="separator">
                        </div>
                        <div class="mb-12"><a class="d-block" href="/news/lorem-ipsum-dolor-sit-amet-consectetur">
                            <div class="v-image v-responsive theme--light" flat="" height="250"
                                 src="/img/article-4.0a696b03.jpg"
                                 style="height: 250px;" tile="">
                                <div class="v-responsive__sizer" style="padding-bottom: 66.5625%;"></div>
                                <div class="v-image__image v-image__image--cover"
                                     style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/article-4.0a696b03.jpg&quot;); background-position: center center;"></div>
                                <div class="v-responsive__content" style="width: 640px;">
                                    <div class="row ma-0 fill-height align-end justify-end">
                                        <div
                                            class="pa-2 d-inline-flex align-center justify-center v-sheet theme--dark rounded-0 primary"
                                            style="height: 40px; width: 40px;"><i aria-hidden="true"
                                                                                  class="v-icon notranslate mdi mdi-text theme--dark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                            <div class="d-flex v-sheet theme--dark rounded-0" style="max-width: 100%;">
                                <div class="grow pa-2 body-2">
                                    <div class="d-flex align-center fill-height"><span class="px-2">Jul 24, 2019</span>
                                        / <span class="px-2">Business Partnerships</span> / <span class="px-2">16 Comments</span>
                                    </div>
                                </div>
                            </div>
                            <div class="pa-4"><h3
                                class="text-truncate text-uppercase text-h6 font-weight-bold mb-4 text-left"> Lorem
                                ipsum dolor, sit amet consectetur </h3>
                                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-0">
                                <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero dolorem, eos
                                    sapiente, ad voluptatem eveniet, a cum blanditiis consequatur esse facere minima!
                                    Non, minus ullam facere earum labore aperiam aliquam.
                                </div>
                                </p></div><!---->
                            <hr aria-orientation="horizontal" class="mt-6 v-divider theme--light" role="separator">
                        </div>
                        <div class="mb-12"><a class="d-block" href="/news/lorem-ipsum-dolor-sit-amet-consectetur">
                            <div class="v-image v-responsive theme--light" flat="" height="250"
                                 src="/img/article-2.48ca80f7.jpg"
                                 style="height: 250px;" tile="">
                                <div class="v-responsive__sizer" style="padding-bottom: 66.0938%;"></div>
                                <div class="v-image__image v-image__image--cover"
                                     style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/article-2.48ca80f7.jpg&quot;); background-position: center center;"></div>
                                <div class="v-responsive__content" style="width: 640px;">
                                    <div class="row ma-0 fill-height align-end justify-end">
                                        <div
                                            class="pa-2 d-inline-flex align-center justify-center v-sheet theme--dark rounded-0 primary"
                                            style="height: 40px; width: 40px;"><i aria-hidden="true"
                                                                                  class="v-icon notranslate mdi mdi-text theme--dark"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </a>
                            <div class="d-flex v-sheet theme--dark rounded-0" style="max-width: 100%;">
                                <div class="grow pa-2 body-2">
                                    <div class="d-flex align-center fill-height"><span class="px-2">May 4, 2019</span> /
                                        <span class="px-2">Analytics Implementation</span> / <span class="px-2">5 Comments</span>
                                    </div>
                                </div>
                            </div>
                            <div class="pa-4"><h3
                                class="text-truncate text-uppercase text-h6 font-weight-bold mb-4 text-left"> Lorem
                                ipsum dolor, sit amet consectetur </h3>
                                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-0">
                                <div>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vero dolorem, eos
                                    sapiente, ad voluptatem eveniet, a cum blanditiis consequatur esse facere minima!
                                    Non, minus ullam facere earum labore aperiam aliquam.
                                </div>
                                </p></div><!----><!----></div>
                    </v-col>
                    <div class="col-md-4 col-12">
                        <div>
                            <div
                                append-icon="mdi-magnify"
                                class="v-input v-input--dense theme--light v-text-field v-text-field--single-line v-text-field--is-booted v-text-field--enclosed v-text-field--outlined"
                                label="Search articles">
                                <div class="v-input__control">
                                    <div class="v-input__slot">
                                        <fieldset aria-hidden="true">
                                            <legend><span class="notranslate">​</span></legend>
                                        </fieldset>
                                        <div class="v-text-field__slot"><label class="v-label theme--light"
                                                                               for="input-766"
                                                                               style="left: 0px; right: auto; position: absolute;">Search
                                            articles</label><input id="input-766" type="text"></div>
                                        <div class="v-input__append-inner">
                                            <div class="v-input__icon v-input__icon--append"><i aria-hidden="true"
                                                                                                class="v-icon notranslate mdi mdi-magnify theme--light"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="v-text-field__details">
                                        <div class="v-messages theme--light">
                                            <div class="v-messages__wrapper"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="container pa-0">
                                <div class="row no-gutters justify-start"><!---->
                                    <div class="col col-12"><!----><h3
                                        class="text-uppercase text-h6 font-weight-bold mb-1 text-left"> About Us </h3>
                                        <div class="v-responsive base-divider primary mr-auto mb-6"
                                             style="max-width: 28px;">
                                            <div class="v-responsive__content">
                                                <hr aria-orientation="horizontal" class="v-divider theme--light"
                                                    role="separator">
                                            </div>
                                        </div>
                                        <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-6">
                                        <div class="v-image v-responsive mb-4 theme--light" color="grey lighten-1"
                                             height="196" src="/img/conference.548b171e.jpg"
                                             style="height: 196px; width: 100%;" tile=""
                                             width="100%">
                                            <div class="v-responsive__sizer" style="padding-bottom: 66.4062%;"></div>
                                            <div class="v-image__image v-image__image--cover"
                                                 style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/conference.548b171e.jpg&quot;); background-position: center center;"></div>
                                            <div class="v-responsive__content" style="width: 640px;"></div>
                                        </div>
                                        <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-10">
                                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsum, distinctio
                                            tempore? Nihil nemo quae ex cum. </p></p></div><!----></div>
                            </div>
                        </div>
                        <div class="container pa-0">
                            <div class="row no-gutters justify-start"><!---->
                                <div class="col col-12"><!----><h3
                                    class="text-uppercase text-h6 font-weight-bold mb-1 text-left"> Post
                                    Categories </h3>
                                    <div class="v-responsive base-divider primary mr-auto mb-6"
                                         style="max-width: 28px;">
                                        <div class="v-responsive__content">
                                            <hr aria-orientation="horizontal" class="v-divider theme--light"
                                                role="separator">
                                        </div>
                                    </div>
                                    <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-6">
                                    <ul class="pl">
                                        <li class="mb-3">Analytics Implementation</li>
                                        <li class="mb-3">Business Partnerships</li>
                                        <li class="mb-3">Growth Strategy</li>
                                        <li class="mb-3">Research Discussions</li>
                                    </ul>
                                    </p></div><!----></div>
                        </div>
                        <div class="container pa-0">
                            <div class="row no-gutters justify-start"><!---->
                                <div class="col col-12"><!----><h3
                                    class="text-uppercase text-h6 font-weight-bold mb-1 text-left"> Archives </h3>
                                    <div class="v-responsive base-divider primary mr-auto mb-6"
                                         style="max-width: 28px;">
                                        <div class="v-responsive__content">
                                            <hr aria-orientation="horizontal" class="v-divider theme--light"
                                                role="separator">
                                        </div>
                                    </div>
                                    <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-6">
                                    <ul class="pl">
                                        <li class="mb-3">November 2019 (8)</li>
                                        <li class="mb-3">October 2019 (8)</li>
                                        <li class="mb-3">August 2018 (8)</li>
                                        <li class="mb-3">December 2017 (8)</li>
                                    </ul>
                                    </p></div><!----></div>
                        </div>
                        <div class="container pa-0">
                            <div class="row no-gutters justify-start"><!---->
                                <div class="col col-12"><!----><h3
                                    class="text-uppercase text-h6 font-weight-bold mb-1 text-left"> Top Tags </h3>
                                    <div class="v-responsive base-divider primary mr-auto mb-6"
                                         style="max-width: 28px;">
                                        <div class="v-responsive__content">
                                            <hr aria-orientation="horizontal" class="v-divider theme--light"
                                                role="separator">
                                        </div>
                                    </div>
                                    <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-6">
                                    <div class="row mb-10 row--dense">
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Business </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Analyze </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Video </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Branding </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Packaging </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Motion </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Web Pages </span></button>
                                        </div>
                                        <div class="col col-auto">
                                            <button
                                                class="text-capitalize v-btn v-btn--outlined v-btn--tile theme--light v-size--default grey--text text--darken-2"
                                                type="button">
                                                <span class="v-btn__content"> Drag &amp; Drop </span></button>
                                        </div>
                                    </div>
                                    <div class="v-image v-responsive theme--light" color="grey lighten-1" height="250"
                                         src="/img/tags.5366dd35.jpg" style="height: 250px; width: 100%;" tile=""
                                         width="100%">
                                        <div class="v-responsive__sizer" style="padding-bottom: 66.4062%;"></div>
                                        <div class="v-image__image v-image__image--cover"
                                             style="background-image: url(&quot;https://zero-theme-pro.vuetifyjs.com/img/tags.5366dd35.jpg&quot;); background-position: center center;"></div>
                                        <div class="v-responsive__content" style="width: 640px;"></div>
                                    </div>
                                    </p></div><!----></div>
                        </div>
                    </div>
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
