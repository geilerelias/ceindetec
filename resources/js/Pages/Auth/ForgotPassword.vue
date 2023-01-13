<template>
    <auth-layout>
        <div class="pa-7 pa-sm-12">
            <v-row class="">
                <v-col class="col-lg-9 col-xl-6 col-12">
                    <div
                        class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
                        aria-current="page"
                    >
                        <inertia-link :href="route('home')">
                            <v-avatar color="white" size="90">
                                <v-img
                                    cover
                                    :src="logo"
                                    alt="logo"
                                ></v-img>
                            </v-avatar>
                        </inertia-link>
                    </div>

                    <h2
                        class="font-weight-bold mt-4 blue-grey--text text--darken-2"
                    >
                        Enviar notificación de restablecimiento de contraseña
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
                        novalidate="novalidate"
                        @submit.prevent="login"
                    >
                        <v-alert
                            v-if="getErrors('email')"
                            text
                            prominent
                            type="error"
                            icon="mdi-alert"
                            dismissible
                        >
                            {{ this.text }}
                        </v-alert>

                        <v-text-field
                            dense
                            v-model="email"
                            label="E-mail"
                            clearable
                            outlined
                            :rules="emailRules"
                            @change="isValid=true"
                        ></v-text-field>


                        <v-btn
                            block
                            contained
                            :disabled="!valid"
                            @click="sendNotification"
                            class="mr-4 mb-4 primary"
                        >
                            Enviar
                        </v-btn>
                    </v-form>
                </v-col>
            </v-row>
        </div>
        <spinner-component :value="overlay" color="primary" :opacity="0.9"></spinner-component>
    </auth-layout>
</template>

<script>
import logoFinal from '@/../images/logofinal.png';
import logo from '@/../images/logo-ceindetec-circle.png';
import bg from '../../../images/computer3.jpg';
import SpinnerComponent from '@/Components/SpinnerComponent.vue';
import AuthLayout from "@/Layouts/AuthLayout.vue";


export default {
    components: {
        SpinnerComponent,
        AuthLayout
    },
    data() {
        return {
            logoFinal,
            bg: bg,
            logo: logo,
            show: null,
            isValid: true,
            valid: true,
            email: "",
            emailRules: [
                v => !!v || "E-mail es requerido",
                v => /.+@.+\..+/.test(v) || "E-mail invalido"
            ],

            overlay: false
        };
    },

    methods: {
        changePassword() {
            axios.post('/reset-password', {'email': this.email, password: 'example', token: 'akahhdad'}).then(res => {
                console.log(res)
            })
        },
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
            this.sendNotification();
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        sendNotification() {
            this.overlay = true;
            var data = {email: this.email};
            axios
                .post(`${route('password.email')}`, data)
                .then(response => {
                    console.log(response)

                    this.$swal(
                        "!Buen trabajo! 😀",
                        response.data.message,
                        "success"
                    );
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
        },
        getErrors(name) {
            try {
                this.isValid = false
                return this.messageErrors[name]
            } catch (e) {

            }
        }
    }
};
</script>
