<template>
    <app-layout>
        <v-container class="mt-5">
            <v-row class="row">
                <v-col class=" col col-12">
                    <v-row class="row">
                        <v-col class="py-0 mb-7 col-sm-6 col-lg-3 col-12">
                            <v-card class="v-card v-sheet theme--light">
                                <v-card-text class=" pa-5">
                                    <div class="d-flex align-center">
                                        <v-btn contained fab rounded dark
                                               class="elevation-0 info">
                                            <v-icon dark>
                                                mdi-wallet
                                            </v-icon>
                                        </v-btn>
                                        <div class="ml-2 mr-1">
                                            <h2 class="headline font-weight-light"> 3 </h2>
                                            <h5
                                                class="subtitle-2 font-weight-regular">
                                                Cursos totales
                                            </h5>
                                        </div>
                                    </div>
                                </v-card-text>
                            </v-card>
                        </v-col>


                        <div revenuecard="[object Object]" class="py-0 mb-7 col-sm-6 col-lg-3 col-12">
                            <div class="v-card v-sheet theme--light">
                                <div class="v-card__text pa-5">
                                    <div class="d-flex align-center">
                                        <button type="button"
                                                class="elevation-0 v-btn v-btn--contained v-btn--fab v-btn--round theme--dark v-size--default deep-purple accent-2">
                                            <span class="v-btn__content"><i aria-hidden="true"
                                                                            class="v-icon notranslate mdi mdi-home-clock theme--dark"></i></span>
                                        </button>
                                        <div class="ml-2 mr-1"><h2 class="headline font-weight-light"> 2 </h2><h5
                                            class="subtitle-2 font-weight-regular"> Total de sedes </h5></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div revenuecard="[object Object]" class="py-0 mb-7 col-sm-6 col-lg-3 col-12">
                            <div class="v-card v-sheet theme--light">
                                <div class="v-card__text pa-5">
                                    <div class="d-flex align-center">
                                        <button type="button"
                                                class="elevation-0 v-btn v-btn--contained v-btn--fab v-btn--round theme--dark v-size--default warning">
                                            <span class="v-btn__content"><i aria-hidden="true"
                                                                            class="v-icon notranslate mdi mdi-account-tie  theme--dark"></i></span>
                                        </button>
                                        <div class="ml-2 mr-1"><h2 class="headline font-weight-light"> 3 </h2><h5
                                            class="subtitle-2 font-weight-regular"> Cantidad de docentes </h5></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div revenuecard="[object Object]" class="py-0 mb-7 col-sm-6 col-lg-3 col-12">
                            <div class="v-card v-sheet theme--light">
                                <div class="v-card__text pa-5">
                                    <div class="d-flex align-center">
                                        <button type="button"
                                                class="elevation-0 v-btn v-btn--contained v-btn--fab v-btn--round theme--dark v-size--default error">
                                            <span class="v-btn__content"><i aria-hidden="true"
                                                                            class="v-icon notranslate mdi mdi-account-supervisor theme--dark"></i></span>
                                        </button>
                                        <div class="ml-2 mr-1"><h2 class="headline font-weight-light"> 30 </h2><h5
                                            class="subtitle-2 font-weight-regular"> Total de estudiantes </h5></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </v-row>
                </v-col>

                <v-col class="col-sm-12 col-lg-8 col-12">
                    <v-card class="mb-7 w-100 v-card v-card--flat v-sheet theme--light">
                        <v-card-text class="v-card__text pa-5">
                            <div class="d-md-flex align-start">
                                <h3 class="title font-weight-regular">
                                    Areas y Asignaturas
                                </h3>
                                <v-spacer class="spacer"></v-spacer>
                                <div class="ml-auto">
                                    <div style="width: 150px;">
                                        <div
                                            class="v-input pt-0 mt-0 v-input--is-label-active v-input--is-dirty theme--light v-text-field v-text-field--single-line v-text-field--is-booted v-select">
                                            <div class="v-input__control">
                                                <div role="button" aria-haspopup="listbox" aria-expanded="false"
                                                     aria-owns="list-2652" class="v-input__slot">
                                                    <div class="v-select__slot">
                                                        <div class="v-select__selections">
                                                            <div class="v-select__selection v-select__selection--comma">
                                                                Septiembre
                                                            </div>
                                                            <input id="input-2652" readonly="readonly" type="text"
                                                                   aria-readonly="false" autocomplete="off"></div>
                                                        <div class="v-input__append-inner">
                                                            <div class="v-input__icon v-input__icon--append"><i
                                                                aria-hidden="true"
                                                                class="v-icon notranslate mdi mdi-menu-down theme--light"></i>
                                                            </div>
                                                        </div>
                                                        <input type="hidden" value="[object Object]"></div>
                                                    <div class="v-menu"><!----></div>
                                                </div>
                                                <div class="v-text-field__details">
                                                    <div class="v-messages theme--light">
                                                        <div class="v-messages__wrapper"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="v-data-table month-table theme--light">
                                <div class="v-data-table__wrapper">
                                    <table>
                                        <thead class="primary">
                                        <tr class="b-solid">
                                            <th :rowspan="4"
                                                class=" b-solid font-weight-bold subtitle-2 text-uppercase text-center white--text">
                                                Areas Curriculares
                                            </th>
                                            <th :rowspan="4"
                                                class=" b-solid font-weight-bold subtitle-2 text-uppercase text-center white--text">
                                                Asignatura
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="5"
                                                class="b-solid font-weight-bold subtitle-1 text-center white--text">
                                                ciclos o grados de
                                                estudio
                                            </th>
                                        </tr>
                                        <tr>
                                            <th colspan="2"
                                                class="b-solid font-weight-regular subtitle-2 text-center white--text">
                                                VI CICLO
                                            </th>
                                            <th colspan="3"
                                                class="b-solid font-weight-regular subtitle-2 text-center white--text">
                                                VII CICLO
                                            </th>
                                        </tr>
                                        <tr class="b-solid">
                                            <th v-for="i in 5"
                                                class="b-solid  font-weight-regular subtitle-2 white--text">
                                                {{ (i + 1) }}º
                                            </th>
                                        </tr>
                                        </thead>

                                        <tbody>

                                        <template v-for="elements in tabla">
                                            <template v-for="(element,area) in elements">
                                                <tr class="b-solid">
                                                    <td class="primary b-solid- white--text text-center"
                                                        :rowspan="element.length+1">
                                                        {{ area }}
                                                    </td>
                                                </tr>
                                                <tr class="b-solid " v-for="item in element">
                                                    <td class="b-solid text-center" v-for="i in item">
                                                        {{ i }}
                                                    </td>
                                                </tr>
                                            </template>

                                        </template>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>

                <v-col class="col-sm-12 col-lg-4 col-12">
                    <v-card flat light class="mb-7 rounded-b-0">
                        <v-card-text class="pa-0 rounded-b-0">
                            <div class="primary rounded rounded-b-0" style="z-index: 1 !important;">
                                <v-img
                                    style="z-index: 1 !important;"
                                    :src="logo"
                                    height="100"
                                    contain
                                    class="img-fluid rounded-top bt4 w-100 rounded-b-0"/>
                            </div>
                            <div class="pa-4 mt-n12 text-center">
                                <div class="d-flex justify-center mt-n5">
                                    <img class="rounded-full h-20 w-20"
                                         style="z-index: 2 !important;"
                                         :src="$page.user.profile_photo_url"
                                         :alt="$page.user.name"
                                         height="128"
                                         width="128"
                                    >
                                </div>
                                <h2 class="mb-0 mt-4 font-weight-regular">{{ $page.user.name }}</h2>
                                <p class="font-weight-light subtitle-2">{{ $page.user.email }}</p>
                                <p>
                                    <small>
                                        Lorem ipsum dolor sit amet, this is a consectetur adipisicing elit orem ipsum
                                        dolor sit amet, this is a consectetur adipisicing elit orem ipsum dolor sit amet
                                        adipisicing elit orem ipsum
                                    </small>
                                </p>
                                <v-btn x-large rounded
                                       class="text-capitalize font-weight-regular px-7 primary accent-2">
                                    Follow
                                </v-btn>
                                <v-row class="mt-3">
                                    <v-col class="col col-4">
                                        <h2 class="mb-0 font-weight-light">1099</h2>
                                        <small>Articles</small>
                                    </v-col>
                                    <v-col class="col col-4">
                                        <h2 class="mb-0 font-weight-light">23,469</h2><small>Followers</small>
                                    </v-col>
                                    <v-col class="col col-4">
                                        <h2 class="mb-0 font-weight-light">6035</h2>
                                        <small>Following</small>
                                    </v-col>
                                </v-row>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>

            </v-row>
        </v-container>

        <div class="py-12">
            <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                <div class="bg-white overflow-hidden shadow-xl sm:rounded-lg">
                    <template>
                        <div v-if="$page.user!==null" dense>
                            <div v-permission="'Ver dashboard'">
                                puedo ver el dashboard
                            </div>

                            <div v-permission="'Ver calificaciones'">
                                puedo ver calificaciones
                            </div>

                            <div v-permission="'Ver calificaciones'">
                                puedo ver calificaciones
                            </div>

                            <div v-role="'Admin'">
                                Soy administrador
                            </div>

                            <div v-role="'Directivo'">
                                Soy directivo
                            </div>
                        </div>
                        <div>
                            {{ $page.auth.roles[0] === 'Admin' ? true : false }}
                            <br>
                            {{ $page.auth.permissions[0] === 'view dashboard' ? true : false }}
                            <br>
                            {{ $page.auth }}
                        </div>
                    </template>
                </div>
            </div>
        </div>
    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout'
import Welcome from '@/Jetstream/Welcome'
import logo from '@/../images/logo-ceindetec.png'

export default {
    components: {
        AppLayout,
        Welcome,
    },

    data: () => ({
        logo,
        tabla: [
            {
                'Comunicación': [
                    ['comunicación', 4, 4, 4, 4, 4],
                    ['literatura', 2, 2, 2, 2, 2],
                    ['lectura y redacción', 2, 2, 2, 2, 2]
                ],
                'Matemática': [
                    ['aritmética', 4, 4, 4, 4, 4],
                    ['geometría', 2, 2, 2, 2, 2],
                    ['trigonometría', 2, 2, 2, 2, 2]
                ],
                'Ciencia y tecnología': [
                    ['anatomía', 4, 4, 4, 4, 4],
                    ['biología', 2, 2, 2, 2, 2],
                    ['química', 2, 2, 2, 2, 2],
                    ['física', 2, 2, 2, 2, 2],
                ], 'Ciencias sociales': [
                    ['Historia', 4, 4, 4, 4, 4],
                    ['geografía', 2, 2, 2, 2, 2],
                    ['economía', 2, 2, 2, 2, 2],
                ]
            }
        ]
    })
}
</script>
<style>
.b-solid {
    border: solid 1px #e0e0e0;
}
</style>
