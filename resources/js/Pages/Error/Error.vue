<template>
    <v-app class="fill-height d-flex flex-column">
        <v-container class="text-center" id="error-view">
            <v-row>
                <v-col>
                    <logo :size="150" :tile="true"></logo>
                </v-col>
            </v-row>
            <v-row class="justify-center">
                <v-col class="col col-auto">
                    <h1 class="text-h1 mb-8 font-weight-bold secondary--text">{{ title }}</h1>
                    <div class="text-h3  primary--text font-weight-bold">
                        <span class="red--text ">Oops!</span> {{ message }}
                    </div>
                    <div class="text-h6 mt-3 mb-6">
                        {{ description }}
                    </div>
                    <v-btn href="/" class="secondary mb-14">
                        <v-icon left>
                            mdi-arrow-left
                        </v-icon>
                        volver
                    </v-btn>
                </v-col>
            </v-row>
        </v-container>
        <v-card flat
                class="d-flex align-end">
            <img style="width: 100%;" cover :src="footerImage"></img>
        </v-card>
    </v-app>
</template>

<script>
import logo from '@/Components/Logo'

import footerImage from '@/../images/errorcurva.png'

export default {
    props: {
        status: Number,
    },
    components: {
        logo
    },
    data: () => ({
        footerImage,
    }),
    computed: {
        title() {
            return {
                401: '401',
                403: '403',
                404: '404',
                419: '419',
                429: '429',
                500: '500',
                503: '503',
            }[this.status]
        },
        message() {
            return {
                401: 'No autorizado',
                403: 'Error Prohibido',
                404: 'Pagina no encontrada',
                419: 'Página Caducada',
                429: 'Demasiadas solicitudes',
                500: 'Error del servidor',
                503: 'Servicio no disponible',

            }[this.status]
        },
        description() {
            return {
                401: 'Es necesario autenticar para obtener la respuesta solicitada.',
                403: 'Lo sentimos, tienes prohibido acceder a esta página.',
                404: 'Lo sentimos, no se pudo encontrar la página que está buscando.',
                419: 'la autenticación previamente válida ha expirado.',
                429: 'El usuario ha enviado solicitudes excesivas en un periodo de tiempo dado.',
                500: 'Vaya, algo salió mal en nuestros servidores.',
                503: 'Lo sentimos, estamos haciendo mantenimiento. Por favor, revise luego.',

            }[this.status]
        },
    },
}
</script>

<style>
.v-application {
    font-family: "Nunito", sans-serif !important;
}

.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Nunito", sans-serif !important;
}
</style>
