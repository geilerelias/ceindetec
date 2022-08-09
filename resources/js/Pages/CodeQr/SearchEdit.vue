<template>
    <simple-layout>
        <template v-slot:header>
            <p class="text-h5 white--text font-weight-bold text-uppercase text-center ma-12">
                Buscar y Editar
            </p>
        </template>

        <v-main>
            <v-container>
                <h1 class="text-h4 font-weight-bold mb-0 text-left">Buscar y editar </h1>
                <div class="primary--text text-subtitle-1 font-weight-bold mb-4 text-left">
                    Ingresa el serial del código a Buscar
                </div>
                <p class="base-body text-body-1 grey--text text--darken-1 text-left mb-10">
                    A partir del consecutivo <span class="font-weight-bold text--primary">CONV005-</span> ingresa el
                    serial correspondiente para consultar y modificar, si este se encuentra registrado; de ser así,
                    automáticamente
                    el sistema te mostrara la información para posteriormente actualizar.
                </p>
                <div>
                    <div class="ma-auto position-relative" style="max-width: 300px">
                        <v-otp-input
                            v-model="otp"
                            :disabled="loading"
                            @finish="onFinish"
                        ></v-otp-input>
                        <v-overlay absolute :value="loading">
                            <v-progress-circular
                                indeterminate
                                color="primary"
                            ></v-progress-circular>
                        </v-overlay>
                    </div>

                    <div v-if="qrCode!==null">
                        <edit :data="qrCode"></edit>
                    </div>

                    <v-snackbar
                        v-model="snackbar"
                        :color="snackbarColor"
                        :timeout="2000"
                    >
                        {{ text }}
                    </v-snackbar>
                </div>
            </v-container>


        </v-main>


    </simple-layout>
</template>

<script>
import simpleLayout from "@/Layouts/SimpleLayout";
import edit from './Edit'

export default {
    name: "SearchEdit",
    components: {
        simpleLayout,
        edit
    },
    data: () => ({
        loading: false,
        snackbar: false,
        snackbarColor: 'default',
        otp: '',
        text: '',
        expectedOtp: '133707',
        qrCode: null
    }),
    methods: {
        onFinish(rsp) {
            this.loading = true
            this.qrCode = null
            axios.get(`/qrcode/search/CONV005-${rsp}`)
                .then(response => {
                    this.qrCode = response.data
                    this.loading = false
                    this.snackbarColor = 'success'
                    this.text = `Búsqueda exitosa de consecutivo "CONV005-${rsp}" (${this.snackbarColor})`
                    this.snackbar = true
                })
                .catch(error => {
                    console.log(error)
                    this.loading = false
                    this.snackbarColor = 'error'
                    this.text = `Búsqueda errónea de consecutivo "CONV005-${rsp}" (${this.snackbarColor})`
                    this.snackbar = true
                })
        },
    },
}
</script>

<style scoped>
.position-relative {
    position: relative;
}
</style>
