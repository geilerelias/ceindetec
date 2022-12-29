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
                                    Activar usuario
                                </h2>
                                <h6 class="subtitle-2 text-justify mb-2">
                                    En este apartado ingresaras los datos con los cuales la persona fue registrada en el
                                    sistema.
                                    En caso de no conocer los datos informar al docente administrador o colocarse en
                                    contacto
                                    con soporte
                                    <inertia-link href="/contact-us">aquí.</inertia-link>
                                </h6>
                                <h6 class="subtitle-2 grey--text lighten-5 mb-2">
                                    ¿Ya tienes cuenta?
                                    <inertia-link href="/login">
                                        Inicia sesión
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
                                        v-model="form.identification"
                                        label="Numero de identificación"
                                        :rules="[rules.required,rules.number]"
                                        clearable
                                        outlined
                                    ></v-text-field>
                                    <v-text-field
                                        v-model="form.email"
                                        label="E-mail"
                                        clearable
                                        outlined
                                        :rules="[rules.email,rules.required]"
                                        @change="isValid=true"
                                    ></v-text-field>


                                    <v-autocomplete
                                        v-model="establishment_id"
                                        :rules="[rules.required,rules.text(form.establishment_id,'Establesimineto')]"
                                        :items="establishments"
                                        item-text="name"
                                        item-value="id"
                                        label="Establecimiento al que pertenece"
                                        @change="getAllHeadquarters"
                                        outlined>
                                    </v-autocomplete>


                                    <v-autocomplete
                                        :disabled="establishment_id===null || establishment_id===''"
                                        v-model="headquarter_id"
                                        :rules="[rules.required,rules.text(form.headquarter_id,'Sede')]"
                                        :items="headquarters"
                                        item-text="name"
                                        item-value="id"
                                        label="Sede a la que pertenece"
                                        outlined>
                                    </v-autocomplete>


                                    <v-btn
                                        block
                                        contained
                                        :disabled="!valid"
                                        @click="submit"
                                        class="mr-4 mb-4 primary"
                                    >
                                        Activar usuario
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
            identification: null,
            email: '',
            password: '',
            remember: null,
        },
        rules: {
            required: value => !!value || 'Campo requerido.',
            max: value => value.length <= 20 || 'Máximo 20 caracteres',
            min: (value, num) => value.length >= num || `Mínimo ${num} caracteres`,

            email: value => {
                const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                return pattern.test(value) || 'Dirección de correo invalida.'
            },

            phone: value => {
                const pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                return pattern.test(value) || 'Numero telefónico invalido.'
            },

            text: (value, text) => {
                const pattern = /[a-zA-Z ]{2,254}/;
                return pattern.test(value) || `Entrada incorrecta para el campo ${text}.`
            },

            number: value => {
                const pattern = /^\d+$/;
                return pattern.test(value) || 'Solo caracteres numéricos.'
            },

        },

        messageErrors: [],
        establishments: [],
        establishment_id: -1,
        headquarters: [],
        headquarter_id: -1,

    }),
    created() {
        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            });

        if (this.establishment_id > -1) {
            this.person.establishment_id = this.establishment_id
            this.$nextTick(() => {
                this.getAllHeadquarters()
                this.person.headquarter_id = this.headquarter_id
            })
        }
    },
    methods: {
        getAllHeadquarters() {
            let id = this.establishment_id;

            if (id !== null) {
                axios.get(`/dashboard/establishment/${id}/headquarters`)
                    .then((response) => {
                        this.headquarters = response.data
                    })
                    .catch((error) => {
                        console.log(error)
                    })
            }

        },

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
