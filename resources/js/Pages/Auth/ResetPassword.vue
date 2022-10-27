<template>
    <auth-layout id="inspire">

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
                        Restablecimiento de contraseña
                    </h2>
                    <h6 class="subtitle-1 mb-2">
                        ¿No tienes cuenta?
                        <inertia-link :href="route('auth.user.activation')">
                            activación de usuario
                        </inertia-link>
                    </h6>

                    <v-form
                        ref="form"
                        v-model="valid"
                        :lazy-validation="false"
                        valid="true"
                    >
                        Ingresa la nueva contraseña y su
                        confirmación para actualizar
                        <v-row>
                            <v-col class="mt-2">

                                <v-text-field
                                    v-model="item.password"
                                    :append-icon="show1? 'mdi-eye': 'mdi-eye-off'"
                                    :rules="passwordRules"
                                    :type="show1? 'text' : 'password'"
                                    counter
                                    hint="Al menos 4 caracteres"
                                    label="Password"
                                    outlined
                                    @click:append="show1 = !show1"
                                ></v-text-field>

                                <v-text-field
                                    v-model="item.password_confirmation"
                                    :append-icon="show2? 'mdi-eye': 'mdi-eye-off'"
                                    :rules="passwordConfirmRules"
                                    :type="show2? 'text': 'password' "
                                    counter
                                    hint="Al menos 4 caracteres"
                                    label="Confirmar password"
                                    outlined
                                    @click:append="show2 = !show2 "
                                ></v-text-field>
                            </v-col>
                        </v-row>
                    </v-form>

                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="error" @click="reset">
                            Limpiar
                        </v-btn>
                        <v-btn
                            :disabled="!valid"
                            class="white--text"
                            color="primary"
                            @click="validate"
                        >
                            Continuar
                        </v-btn>
                    </v-card-actions>
                </v-col>
            </v-row>


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

        </div>
    </auth-layout>
</template>

<script>
import AuthLayout from "@/Layouts/AuthLayout";
import logo from '@/../images/logo-ceindetec-circle.png';

export default {
    components: {AuthLayout},
    props: ["request"],
    data() {
        return {
            logo,
            message: "",
            tokenFound: false,
            item: {
                email: "",
                password: "",
                password_confirmation: "",
                token: ""
            },
            valid: true,
            emailRules: [
                v => !!v || "E-mail es requerido",
                v => /.+@.+\..+/.test(v) || "E-mail invalido"
            ],
            show1: false,
            show2: false,
            passwordRules: [
                v => !!v || "Requerido.",
                v => (v && v.length >= 4) || "Mínimo 4 caracteres"
            ],
            passwordConfirmRules: [
                v => !!v || "Requerido.",
                v => (v && v.length >= 4) || "Mínimo 4 caracteres",
                v => v === this.item.password || "No coinciden."
            ],
            overlay: false
        };
    },
    created: function () {
        console.log('email', this.request)
        let path = window.location.pathname
        console.log('path => ', path.split('/')[2])

        this.item.email = this.request.email
        this.item.token = path.split('/')[2]
    },
    methods: {

        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
            this.resetPassword();
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        resetPassword() {
            this.overlay = true;
            var data = this.item;
            axios
                .post(`${route('password.update')}`, data)
                .then(response => {
                    console.log(response)
                    this.$swal(
                        "!Buen trabajo! 😀",
                        response.data.message,
                        "success"
                    ).then(result => {
                        this.$inertia.get('/login')
                    });
                    this.reset();
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
};
</script>
