<template>
    <div>
        <v-img :src="bg" class="my-0 py-0">
            <v-footer
                class="px-0 my-0 py-0"
                style="background-color: rgba(8, 0, 56, 0.77);"
            >
                <v-container class="fill-height py-5">
                    <v-row
                        class="py-4 d-flex justify-between"
                        :style="
                            `height:${
                                $vuetify.breakpoint.mdAndUp ? '230px' : 'auto'
                            }`
                        "
                    >
                        <v-col>
                            <div>
                                <inertia-link href="/" class="mr-2">
                                    <v-img
                                        :src="logo"
                                        cover
                                        alt=""
                                        style="width: 150px !important;"
                                    />
                                </inertia-link>
                            </div>

                            <div
                                class="text-body-1 secondary--text text--lighten-2"
                            >
                                <div>Centro de Desarrollo Tecnológico</div>
                                <div class="mt-2">
                                    <v-btn
                                        v-for="item in socialMedia"
                                        :key="item.id"
                                        icon
                                        rounded
                                        light
                                        class="mr-1 secondary--text text--lighten-2"
                                    >
                                        <v-icon light>{{ item.icon }}</v-icon>
                                    </v-btn>
                                </div>
                            </div>
                        </v-col>

                        <v-col class="col-md-3 col-12">
                            <div
                                class="secondary--text font-weight-bold text-uppercase"
                            >
                                enlaces útiles
                            </div>
                            <div
                                class="mb-4 mt-1 white rounded-lg"
                                style="width: 80px; height: 3px;"
                            ></div>

                            <div class="d-flex flex-wrap">
                                <div
                                    class="w-half  mb-1"
                                    v-for="item in links"
                                    :key="item.id"
                                >
                                    <a
                                        :href="route(item.route)"
                                        class="text-decoration-none white--text"
                                    >
                                        {{ item.title }}
                                    </a>
                                </div>
                            </div>
                        </v-col>

                        <v-col class="col-md-3 col-12 justify-text">
                            <div
                                class="secondary--text font-weight-bold text-uppercase"
                            >
                                Información de contacto
                            </div>
                            <div
                                class="mb-4 mt-1 white rounded-lg"
                                style="width: 80px; height: 3px;"
                            ></div>

                            <div class="d-flex mb-2">
                                <v-icon
                                    class="mr-2 mdi secondary--text text--lighten-1"
                                >
                                    mdi-phone-outline
                                </v-icon>
                                <a
                                    href="tel:3504944938"
                                    class="text-decoration-none white--text text--lighten-2"
                                >
                                    3504944938
                                </a>
                                <span class="mx-1 white--text">-</span>
                                <a
                                    href="tel:3138161129"
                                    class="text-decoration-none white--text text--lighten-2"
                                >
                                    3138161129
                                </a>
                            </div>
                            <div class="d-flex mb-2">
                                <v-icon
                                    class="mr-2 mdi secondary--text text--lighten-1"
                                >
                                    mdi-email-outline
                                </v-icon>
                                <a
                                    href="mailto:informacion@ceindetec.org.co"
                                    class="text-decoration-none white--text text--lighten-2"
                                >
                                    informacion@ceindetec.org.co
                                </a>
                            </div>
                            <div class="d-flex mb-2  white--text ">
                                <v-icon
                                    class="mr-2 mdi secondary--text text--lighten-1"
                                >
                                    mdi-map-marker-outline
                                </v-icon>
                                Calle 10 39-30, Esperanza 3ra etapa
                            </div>
                        </v-col>
                        <v-col
                            class="col-auto col-sm-1 d-flex align-items-center"
                        >
                            <div
                                class="d-flex flex-column flex-wrap mr-3"
                                style="height: 100px"
                            ></div>
                        </v-col>
                    </v-row>
                </v-container>
                <section
                    class="pt-2 mx-0 mb-0"
                    style=" background-color: rgba(0, 0, 0, 0.3);width: 100% "
                >
                    <v-container>
                        <p class="text-white float-right d-sm-inline">
                            <a
                                class="base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0"
                                @click="
                                    dialogTermCondition = !dialogTermCondition
                                "
                            >
                                Términos y Condiciones
                            </a>
                            <span>|</span>
                            <a
                                class="base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0"
                                @click="
                                    dialogPrivacyPolicies = !dialogPrivacyPolicies
                                "
                            >
                                Políticas de Privacidad
                            </a>

                            <span v-if="$vuetify.breakpoint.smAndUp">
                                | &nbsp;
                            </span>
                            <br v-else />

                            Diseñado por
                            <span class="secondary--text">
                                Luisa María Alzate
                            </span>
                            © 2022
                        </p>
                    </v-container>
                </section>

                <!-- dialogs -->
                <div class="text-center">
                    <v-dialog v-model="dialogTermCondition" width="500">
                        <v-card>
                            <v-card-title class="text-h5 grey lighten-2">
                                Términos y Condiciones
                            </v-card-title>

                            <v-card-text>
                                Agregar términos y condiciones Lorem ipsum dolor
                                sit amet, consectetur adipiscing elit, sed do
                                eiusmod tempor incididunt ut labore et dolore
                                magna aliqua. Ut enim ad minim veniam, quis
                                nostrud exercitation ullamco laboris nisi ut
                                aliquip ex ea commodo consequat. Duis aute irure
                                dolor in reprehenderit in voluptate velit esse
                                cillum dolore eu fugiat nulla pariatur.
                                Excepteur sint occaecat cupidatat non proident,
                                sunt in culpa qui officia deserunt mollit anim
                                id est laborum.
                            </v-card-text>

                            <v-divider></v-divider>

                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn
                                    color="primary"
                                    text
                                    @click="dialogTermCondition = false"
                                >
                                    I accept
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </div>

                <div class="text-center">
                    <v-dialog v-model="dialogPrivacyPolicies" width="500">
                        <v-card>
                            <v-card-title class="text-h5 grey lighten-2">
                                Privacy Policy
                            </v-card-title>

                            <v-card-text>
                                Lorem ipsum dolor sit amet, consectetur
                                adipiscing elit, sed do eiusmod tempor
                                incididunt ut labore et dolore magna aliqua. Ut
                                enim ad minim veniam, quis nostrud exercitation
                                ullamco laboris nisi ut aliquip ex ea commodo
                                consequat. Duis aute irure dolor in
                                reprehenderit in voluptate velit esse cillum
                                dolore eu fugiat nulla pariatur. Excepteur sint
                                occaecat cupidatat non proident, sunt in culpa
                                qui officia deserunt mollit anim id est laborum.
                            </v-card-text>

                            <v-divider></v-divider>

                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn
                                    color="primary"
                                    text
                                    @click="dialogPrivacyPolicies = false"
                                >
                                    I accept
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </div>
            </v-footer>
        </v-img>
    </div>
</template>

<script>
import { mapMutations, mapState } from 'vuex';

import logo from '../../images/logo-ceindetec.png';
import bg from '@/../images/computer3.jpg';

export default {
    data() {
        return {
            bg,
            logo,
            dialogPrivacyPolicies: false,
            dialogTermCondition: false,
            socialMedia: [
                { icon: 'mdi-facebook', link: '' },
                { icon: ' mdi-twitter', link: '' },
                { icon: 'mdi-linkedin', link: '' },
                { icon: 'mdi-google-plus', link: '' },
                { icon: 'mdi-whatsapp', link: '' }
            ]
        };
    },
    computed: {
        ...mapState(['drawer', 'links'])
    }
};
</script>

<style>
.v-application .w-half {
    width: 50% !important;
}
</style>
