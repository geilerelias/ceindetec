<template>
    <v-app id="inspire">
        <div class="bg-gray-100 h-screen w-screen">
            <div class="flex flex-col items-center flex-1 h-full justify-center  sm:px-0">
                <v-card class="elevation-4 w-full sm:w-3/4 lg:w-1/2" style="padding: 11px !important;">
                    <v-row class="d-flex flex-row-reverse">
                        <v-col class="transparent d-none d-md-flex col-lg-6 col pa-0">

                        </v-col>
                        <v-col class="col-lg-6 col">
                            <div class="px-7 pt-6 px-sm-7">

                                <logo></logo>


                                <h2 class="font-weight-bold mt-4 blue-grey--text text--darken-2">
                                    Restablecimiento de contraseña
                                </h2>

                                <div class="mb-4 text-sm text-gray-600">
                                    ¿Olvidaste tu contraseña? No hay problema. Simplemente díganos su dirección de
                                    correo electrónico y le enviaremos un enlace para restablecer la contraseña que le
                                    permitirá elegir una nueva.
                                </div>

                                <v-form novalidate="novalidate"
                                        v-on:submit.prevent="login"
                                        ref="form"
                                        v-model="valid"
                                        lazy-validation
                                        class="mt-4">

                                    <v-text-field
                                        v-model="user.email"
                                        dense
                                        :rules="emailRules"
                                        label="Correo"
                                        required
                                        clearable
                                        outlined
                                    ></v-text-field>


                                    <v-container class="ma-0 pa-0 pb-8">
                                        <v-row
                                            class="justify-center aling-center text-center ma-0 pa-0"
                                        >
                                            <v-col class="ma-0 pa-1">
                                                <v-btn
                                                    block
                                                    :disabled="!valid"
                                                    color="primary"
                                                    dark @click="validate"
                                                >
                                                    Enviar Correo
                                                </v-btn>
                                            </v-col>
                                        </v-row>
                                        <v-row
                                            class="justify-center aling-center text-center ma-0 pa-0"
                                        >
                                            <v-col class="ma-0 pa-0">
                                                <inertia-link
                                                    :href="route('login')"
                                                    text
                                                >
                                                    iniciar session
                                                </inertia-link
                                                >
                                            </v-col>
                                        </v-row>
                                    </v-container>

                                </v-form>

                            </div>
                        </v-col>

                    </v-row>
                </v-card>
            </div>
        </div>

        <v-snackbar
            v-model="snackbar"
            :color="color"
            :right="true"
            :timeout="4000"
            :top="true"
        >
            {{ text }}
            <v-btn dark text icon @click="snackbar = false">
                <v-icon>mdi-close</v-icon>
            </v-btn>
        </v-snackbar>

        <div class="text-center">
            <v-overlay :absolute="true" :opacity="0.9" :value="overlay">
                <v-row class="mb-6" no-gutters>
                    <v-col sm="12"
                    >
                        <v-progress-circular
                            indeterminate
                            size="64"
                        ></v-progress-circular>
                    </v-col>

                    <v-col class="mt-5">
                        <span class="white--text">
                            Un momento por favor, estamos procesando su
                            solicitud
                        </span>
                    </v-col>
                </v-row>
            </v-overlay>
        </div>
    </v-app>
</template>

<script>
import logo from '@/Jetstream/ApplicationMark'

export default {
    name: "ForgotPassword",
    components: {
        logo,
    },
    data() {
        return {
            email: "",
            valid: true,
            snackbar: false,
            color: "",
            mode: "",
            text: "",
            user: {email: ""},
            emailRules: [
                v => !!v || "EL email es requerido",
                v => /.+@.+\..+/.test(v) || "El email debe ser válido"
            ],
            overlay: false,
            code: null
        };
    },
    mounted() {
        let params = new URLSearchParams(location.search);
        var status = params.get("status");
        var message = params.get("message");
        if (status !== null) {
            this.$swal(
                status === "200" ? "!Buen trabajo! 😀" : "Oops... 😮",
                message,
                status === "200" ? "success" : "error"
            );
        }
    },
    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
            this.sendEmail();
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },

        sendEmail() {
            console.log(this.user);
            const newUser = this.user;
            this.overlay = true;
            axios
                .post(`${route('password.email')}`, newUser)
                .then(response => {
                    this.color = "green";
                    this.mode = "";
                    this.text = "Información correcta 😀, Bienvenido! ";
                    this.snackbar = true;
                    console.log("hasta aqui yo voy");
                    console.log('response', response);

                    // console.log("despues del login");

                    try {
                        this.overlay = false;
                        this.$swal(
                            "¡Buen trabajo!",
                            "Información correcta 😀, Bienvenido! ",
                            "success"
                        ).then(result => {
                            if (response.status === 200) {
                                this.$inertia.get('/dashboard');
                            }
                        });
                    } catch (error) {
                        this.overlay = false;
                        console.log(error);
                    }
                })
                .catch(error => {
                    this.mode = "";
                    this.color = "red darken-3";
                    //console.log('soy error',error);
                    // console.log(`soy error.response.data ${error.response.data}`);
                    //console.log(
                    // `soy error.response.data.message ${error.response.data.message}`
                    // );
                    const array = error.response.data.errors;
                    this.overlay = false;
                    this.text = "";
                    for (var clave in array) {
                        this.text += clave + ": " + array[clave] + "\n ";
                    }
                    //console.log(this.text);
                    this.text += error.response.data.message;
                    // this.snackbar = true;

                    this.$swal("¡Algo salió mal! 😥", this.text, "error");
                    // if (typeof array === "undefined") {
                    //     setTimeout(() => location.reload(), 500);
                    // }
                });
        }
    }
};
</script>
<style>
div.v-image__placeholder > div > div {
    height: 100%;
}
</style>



