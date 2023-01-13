<template>
    <v-app>
        <v-row class="my-0 py-0">
            <v-col
                class="d-none d-md-flex primary align-center justify-center col-12 col-md-6 col-lg-7 col-xl-6  my-0 py-0">
                <v-row class="fill-height">
                    <v-col
                        class="transparent d-md-flex align-center justify-center">
                        <v-container>
                            <div class="pa-10">
                                <v-row class="justify-center">
                                    <v-col class="col-xl-5 col-8">
                                        <div>
                                            <h2 class="display-1 white--text font-weight-medium">
                                                <!--                                                iRepairSoft-->
                                                <v-img src="https://ceindetec.org.co/img/web/logofinal.png">
                                                </v-img>
                                            </h2>
                                            <h6
                                                class="subtitle-1 mt-4 white--text op-5 font-weight-regular text-justify">
                                                El Sistema para la Gestión Académica (SIGAC) surge como una solución de
                                                software desarrollado por Ceindetec, para agilizar los procesos
                                                inherentes a las instituciones educativas. Con esta aplicación se pueden
                                                llevar a cabo procesos administrativos, que redundan en la
                                                centralización de la información de cada uno de los estudiantes de la
                                                institución.
                                            </h6>
                                            <inertia-link href="/about-us">
                                                <v-btn depressed outlined x-large
                                                       class="mt-4 text-capitalize white--text">
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
            <v-col class="d-flex align-center col-12 col-md-6 col-lg-5 col-xl-6">
                <v-container>
                    <div class="pa-7 pa-sm-12">
                        <v-row>
                            <v-col class="col-lg-9 col-xl-6 col-12">

                                <inertia-link
                                    :href="route('home')"
                                    class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
                                    aria-current="page">
                                    <v-avatar color="white" size="70">
                                        <v-img cover :src="logo" alt="logo"></v-img>
                                    </v-avatar>
                                </inertia-link>

                                <h2 class="font-weight-bold mt-4 blue-grey--text text--darken-2">Registrarse</h2>
                                <h6 class="subtitle-1 mb-4"> ¿Ya tienes cuenta?
                                    <inertia-link href="/login">Inicia sesión</inertia-link>
                                </h6>

                                <v-form @submit.prevent="submit"
                                        ref="form"
                                        v-model="valid"
                                >

                                    <v-alert
                                        v-if="$page.errors.email"
                                        text
                                        prominent
                                        type="error"
                                        icon="mdi-alert"
                                        dismissible
                                    >
                                        {{ $page.errors.email[0] }}
                                    </v-alert>


                                    <v-text-field
                                        dense
                                        v-model="form.name"
                                        :rules="nameRules"
                                        label="Name"
                                        outlined
                                        required
                                        autofocus
                                        autocomplete="name"
                                    ></v-text-field>

                                    <v-text-field
                                        dense
                                        v-model="form.email"
                                        :rules="emailRules"
                                        label="E-mail"
                                        outlined
                                        name="email"
                                        required
                                    ></v-text-field>

                                    <v-text-field
                                        dense
                                        v-model="form.password"
                                        :append-icon="show ? 'mdi-eye' : 'mdi-eye-off'"
                                        :rules="passwordRules"
                                        :type="show ? 'text' : 'password'"
                                        label="password"
                                        outlined
                                        hint="At least 8 characters"
                                        @click:append="show = !show"
                                        name="password"
                                        required
                                        autocomplete="new-password"
                                    ></v-text-field>

                                    <v-text-field
                                        dense
                                        v-model="form.password_confirmation"
                                        :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                                        :rules="confirmPasswordRules"
                                        :type="show2 ? 'text' : 'password'"
                                        label="Confirm Password"
                                        outlined
                                        hint="At least 8 characters"
                                        @click:append="show2 = !show2"
                                        name="password_confirmation"
                                        required
                                        autocomplete="new-password"
                                    ></v-text-field>


                                    <v-checkbox
                                        v-model="checkbox"
                                        :rules="[v => !!v || 'You must agree to continue!']"
                                        label="¿Estás de acuerdo?"
                                        required
                                    ></v-checkbox>

                                    <v-btn @click="submit" block contained depressed :disabled="!valid"
                                           class="mr-4 text-none primary">
                                        Registrarse
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
//import logo from '@/../images/logo.png'
import logoFinal from '@/../images/logofinal.png'
import logo from '@/../images/logo-ceindetec-circle.png'
import bg from '../../../images/computer3.jpg';

import SpinnerComponent from "@/Components/SpinnerComponent.vue";

export default {
    name: "Register",
    props: ['errors'],
    components: {
        SpinnerComponent,
    },
    data: () => ({
        overlay: false,
        bg: bg,
        logo: logo,
        show: null,
        show2: null,
        valid: true,
        form: {
            name: '',
            email: '',
            password: '',
            password_confirmation: ''
        },
        nameRules: [
            v => !!v || 'Name is required',
        ],
        emailRules: [
            v => !!v || 'E-mail is required',
            v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
        ],
        passwordRules: [
            value => !!value || 'Required.',
            v => v.length >= 8 || 'Min 8 characters',
        ],
        checkbox: false,
    }),
    computed: {
        confirmPasswordRules() {
            return [
                v => !!v || 'Required.',
                v => v.length >= 8 || 'Min 8 characters',
                v => v === this.form.password || 'The confirm password incorrect',
            ]
        }
    },
    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
            this.register();
        },
        reset() {
            this.$refs.form.reset()
        },
        resetValidation() {
            this.$refs.form.resetValidation()
        },
        submit() {

            this.$inertia.post(route('register'), this.form, {
                onStart: (visit) => {
                    this.overlay = true;
                },
                onFinish: visit => {
                    this.overlay = false;
                },
            })
        },
        register() {
            console.log(this.user);
            const newUser = this.user;
            this.overlay = true;

            axios
                .post("/register", newUser)
                .then(response => {
                    console.log('this is response: ', response)
                    this.$swal(
                        response.status === 201
                            ? "!Buen trabajo! 😀" : "Oops... 😮",
                        response.data.message,
                        response.status === 201 ? "success" : "error"
                    ).then(result => {
                        if (response.status === 201) {
                            this.$inertia.get('/dashboard');
                        }
                    });
                    this.reset();
                })
                .catch(error => {
                    this.overlay = false;
                    this.color = "red darken-3";
                    this.mode = "vertical";
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
                    this.text += error.response.data.message;
                    this.$swal("Oops... 😮", this.text, "error");
                });

            // this.$inertia.post(route('register'), newUser, {
            //     onSuccess: (response) => {
            //         console.log('this is :',response);
            //         this.$swal(
            //             response.data.status === 201
            //                 ? "!Buen trabajo! 😀"
            //                 : "Oops... 😮",
            //             response.data.message,
            //             response.data.status === 201 ? "success" : "error"
            //         ).then(result => {
            //             if (response.data.status === 201) {
            //                 this.$router.push("/login");
            //             }
            //         });
            //         this.reset();
            //     },
            //     onError: (error) => {
            //         console.log(error);
            //         this.overlay = false;
            //         this.color = "red darken-3";
            //         this.mode = "vertical";
            //         console.log(error);
            //         console.log(error.response.data);
            //         console.log(error.response.data.message);
            //         const array = error.response.data.errors;
            //         console.log(array);
            //         this.text = "";
            //         for (var clave in array) {
            //             this.text += clave + ": " + array[clave] + "\n ";
            //         }
            //
            //         console.log(this.text);
            //         this.text += error.response.data.message;
            //         this.$swal("Oops... 😮", this.text, "error");
            //     }
            // })
        }
    },
}
</script>

<style scoped>
</style>
