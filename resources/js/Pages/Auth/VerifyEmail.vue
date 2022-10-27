<template>
    <auth-layout>
        <div class="pa-7 pa-sm-12">
            <v-row class="">

                <v-col class="col-lg-9 col-xl-6 col-12">
                    <div
                        aria-current="page"
                        class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
                    >
                        <inertia-link :href="route('home')">
                            <v-avatar color="white" size="90">
                                <v-img
                                    :src="logo"
                                    alt="logo"
                                    cover
                                ></v-img>
                            </v-avatar>
                        </inertia-link>
                    </div>

                    <h2
                        class="font-weight-bold mt-4 blue-grey--text text--darken-2"
                    >
                        Verificación de email
                    </h2>
                    <h6 class="subtitle-1 mb-2 text-justify">
                        Gracias por registrarte!
                        <br>
                        Antes de comenzar, ¿podría verificar su dirección de correo electrónico
                        haciendo clic en el enlace que le acabamos de enviar? <br>
                        Si no recibiste el correo electrónico, con
                        gusto te enviaremos otro.
                    </h6>

                    <v-form
                        ref="form"
                        v-model="valid"
                        :lazy-validation="false"
                        valid="true"
                    >
                        <v-row class="mt-2">
                            <v-col class=" text-center">
                                <v-btn block color="primary" @click="ResendVerification">Reenviar correo</v-btn>
                            </v-col>

                            <v-col class="text-center">
                                <inertia-link :href="route('logout')">
                                    <v-btn color="secondary" outlined>Cerrar sesión</v-btn>
                                </inertia-link>
                            </v-col>
                        </v-row>
                    </v-form>
                </v-col>
            </v-row>
        </div>
        <spinner-component :opacity="0.9" :value="overlay" color="primary"></spinner-component>

    </auth-layout>
</template>

<script>
import authLayout from "@/Layouts/AuthLayout";
import logo from '@/../images/logo-ceindetec-circle.png';
import SpinnerComponent from '@/Components/SpinnerComponent';

export default {
    name: "VerifyEmail",
    components: {
        authLayout,
        SpinnerComponent
    },
    data: () => ({
        logo,
        valid: true,
        overlay: false
    }),
    methods: {
        ResendVerification() {
            this.overlay = true;
            axios
                .post(`${route('verification.send')}`)
                .then(response => {
                    console.log(response)
                    this.$swal(
                        "!Buen trabajo! 😀",
                        "Se ha enviado un nuevo enlace de verificación a la dirección de correo electrónico que proporcionó durante el registro.",
                        "success"
                    )
                    this.overlay = false;
                })
                .catch(error => {
                    this.overlay = false;

                    console.log(error);
                    console.log(error.response.data);
                    console.log(error.response.data.message);
                    const array = error.response.data.errors;
                    console.log(array);
                    this.text = "";
                    for (var clave in array) {
                        this.text += clave + ": " + array[clave] + "\n ";
                    }
                    console.log(this.text);
                    this.$swal("Oops... 😮", this.text, "error");
                });
        }
    }
}
</script>

<style scoped>

</style>
