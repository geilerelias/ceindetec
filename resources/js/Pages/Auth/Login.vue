<template>
    <v-app>
        <v-row class="my-0 py-0">
            <v-col
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
                                    Ingresar
                                </h2>
                                <h6 class="subtitle-1 mb-2">
                                    ¿No tienes cuenta?
                                    <inertia-link href="/register">
                                        registrarse
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
                                        v-model="form.email"
                                        label="E-mail"
                                        clearable
                                        outlined
                                        :rules="[
                                            emailRules.required,
                                            emailRules.valid
                                        ]"
                                        @change="isValid=true"
                                    ></v-text-field>

                                    <v-text-field
                                        dense
                                        v-model="form.password"
                                        :append-icon="
                                            show ? 'mdi-eye' : 'mdi-eye-off'
                                        "
                                        :rules="[
                                            passwordRules.required,
                                            passwordRules.min
                                        ]"
                                        :type="show ? 'text' : 'password'"
                                        label="password"
                                        outlined
                                        hint="At least 8 characters"
                                        @click:append="show = !show"
                                        @keyup.enter="submit"
                                        name="password"
                                        required
                                        autocomplete="new-password"
                                    ></v-text-field>

                                    <div
                                        class="d-block d-sm-flex align-center mb-4 mb-sm-0"
                                    >
                                        <v-checkbox
                                            v-model="form.remember"
                                            label="Recuerdame"
                                        ></v-checkbox>
                                        <div class="ml-auto">
                                            <inertia-link
                                                :href="
                                                    route('password.request')
                                                "
                                            >
                                                Olvidé mi contraseña
                                            </inertia-link>
                                        </div>
                                    </div>

                                    <v-btn
                                        block
                                        contained
                                        :disabled="!valid"
                                        @click="submit"
                                        class="mr-4 mb-4 primary"
                                    >
                                        Ingresar
                                    </v-btn>
                                </v-form>
                            </v-col>
                        </v-row>
                    </div>
                </v-container>
            </v-col>
        </v-row>

        <spinner-component :value="overlay" color="primary" :opacity="0.9"></spinner-component>
    </v-app>
</template>

<script>
import logoFinal from '@/../images/logofinal.png';
import logo from '@/../images/logo-ceindetec-circle.png';
import bg from '../../../images/computer3.jpg';
import SpinnerComponent from '@/Components/SpinnerComponent';

export default {
    name: 'Register',
    props: ['errors'],
    components: {
        SpinnerComponent
    },
    data: () => ({
        logoFinal,
        overlay: false,
        bg: bg,
        logo: logo,
        show: null,
        valid: true,
        isValid: true,
        form: {
            email: '',
            password: '',
            remember: null
        },
        emailRules: {
            required: v => !!v || 'E-mail is required',
            valid: v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
        },
        passwordRules: {
            required: value => !!value || 'Required.',
            min: v => v.length >= 8 || 'Min 8 characters'
        },
        messageErrors: [],
    }),
    methods: {
        updateValidation() {
            this.isValid = true
        },
        submit() {
            const isFormValid = this.$refs.form.validate();
            if (isFormValid) {
                this.login();
            }
        },
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        },
        login() {
            console.log(this.form);
            this.overlay = true;
            axios
                .post('/login', this.form)
                .then(response => {
                    this.color = 'green';
                    this.mode = '';
                    this.text = 'Información correcta 😀, Bienvenido! ';

                    console.log('response', response);

                    // console.log("despues del login");

                    try {
                        this.overlay = false;
                        this.$inertia.get('/dashboard');
                        this.$swal(
                            'Bienvenido!',
                            '¡Has iniciado sesión correctamente!',
                            'success'
                        );
                    } catch (error) {
                        this.overlay = false;
                        console.log(error);
                    }
                })
                .catch(error => {
                    this.mode = '';
                    this.color = 'red darken-3';
                    //console.log('soy error',error);
                    // console.log(`soy error.response.data ${error.response.data}`);
                    //console.log(
                    // `soy error.response.data.message ${error.response.data.message}`
                    // );
                    const array = error.response.data.errors;
                    this.messageErrors = error.response.data.errors;
                    this.overlay = false;
                    console.log(`soy un array ${array}`);
                    this.text = '';
                    for (var clave in array) {
                        this.text += clave + ': ' + array[clave] + '\n ';
                    }
                    //console.log(this.text);
                    this.text += error.response.data.message;

                    this.$swal('¡Algo salió mal! 😥', this.text, 'error');
                    // if (typeof array === "undefined") {
                    //     setTimeout(() => location.reload(), 500);
                    // }
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

<style scoped></style>
