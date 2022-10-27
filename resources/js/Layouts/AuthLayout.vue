<template>
    <v-app>
        <v-row class="my-0 py-0">
            <v-col v-if="banner"
                   class="d-none d-md-flex primary align-center justify-center col-12 col-md-6 col-lg-7 col-xl-6 my-0 py-0"
            >
                <v-row class="fill-height">
                    <v-col
                        class="transparent d-md-flex align-center justify-center"
                    >
                        <v-container>
                            <div class="pa-10">
                                <v-row class="justify-center">
                                    <v-col class="col-xl-5 col-8">
                                        <div>
                                            <h2
                                                class="display-1 white--text font-weight-medium"
                                            >
                                                <v-img :src="logoFinal"></v-img>
                                            </h2>
                                            <h6
                                                class="subtitle-1 mt-4 white--text op-5 font-weight-regular text-justify"
                                            >
                                                El Sistema para la Gestión Académica (SIGAC) surge como una solución de
                                                software desarrollado por Ceindetec, para agilizar los procesos
                                                inherentes a las instituciones educativas. Con esta aplicación se pueden
                                                llevar a cabo procesos administrativos, que redundan en la
                                                centralización de la información de cada uno de los estudiantes de la
                                                institución.
                                            </h6>

                                            <inertia-link href="/about-us">
                                                <v-btn
                                                    depressed
                                                    outlined
                                                    x-large
                                                    class="mt-4 text-capitalize white--text"
                                                >
                                                    Saber más
                                                </v-btn>
                                            </inertia-link>
                                        </div>
                                    </v-col>
                                </v-row>
                            </div>
                        </v-container>
                    </v-col>
                </v-row>
            </v-col>
            <v-divider></v-divider>
            <v-col
                class="d-flex align-center col-12 col-md-6 col-lg-5 col-xl-6 "
            >
                <v-container class="container">
                    <slot></slot>
                </v-container>
            </v-col>
        </v-row>
    </v-app>
</template>

<script>
import logoFinal from "@/../images/logofinal.png";
import bg from "@/../images/computer3.jpg";
import logo from "@/../images/logo-ceindetec-circle.png";

export default {
    name: "AuthLayout",
    props: {
        banner: {
            type: Boolean,
            default: true
        }
    },
    data: () => ({
        logoFinal,
        bg: bg,
        logo: logo,
    })
}
</script>

<style scoped>

</style>
