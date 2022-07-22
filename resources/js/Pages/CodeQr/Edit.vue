<template>
    <v-app id="inspire">
        <v-card outlined tile id="no-print-header">
            <v-toolbar
                color="primary"
                dark
                height="100"
            >
                <v-btn icon @click="back()">
                    <v-icon color="white">
                        mdi-arrow-left
                    </v-icon>
                </v-btn>
                <logo :tile="true" :light="true" color="primary" :width="150"></logo>
                <v-spacer></v-spacer>

                <div class="text-right">
                    <div class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                        CONVENIO DE COOPERACIÓN
                    </div>
                    <div class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                        No 005 2021
                    </div>
                    <div class="text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                        Listados de consecutivos
                    </div>
                </div>
            </v-toolbar>
            <v-toolbar dense class="secondary" max-height="10"></v-toolbar>
        </v-card>
        <v-main class="">
            <v-container>
                <v-row class="d-flex justify-center">
                    <v-col class="col-md-8 col-12 ">
                        <v-card class="mt-4 text-center ">
                            <!--                            <v-avatar tile size="150" color="" class="elevation-6 mt-n12 d-inline-block">
                                                            <qrcode-vue class=""
                                                                        :value="`http://sigac.almaguajira.com/qrcode/${data.consecutive}`"
                                                                        :size="150"
                                                                        level="H"/>
                                                        </v-avatar>-->
                            <v-card-title class="d-flex justify-space-around pt-1 pb-0 mt-2">
                                <logo :tile="true" :light="false" color="primary"
                                      :width="100"></logo>
                                <logo :tile="true" :light="false" color="primary" :width="100"
                                      src="logoAlcaldia"></logo>

                            </v-card-title>

                            <v-card-text class="text-center">
                                <h4 class="text-h6 mt-3 text--primary font-weight-black"> {{ data.consecutive }} </h4>

                                <div class="pa-1 flex-grow-1">
                                    <div class="d-flex align-center flex-column">
                                        <div class="d-flex  justify-space-around">
                                            <div>
                                                <v-input label="Estado:"></v-input>
                                            </div>
                                            &nbsp;
                                            <v-chip v-if="data.status=='inactive'" small
                                                    class="font-weight-bold  accent">
                                                {{ data.status }}
                                            </v-chip>
                                            <v-chip v-else small
                                                    class="font-weight-bold secondary">
                                                {{ data.status }}
                                            </v-chip>
                                        </div>
                                    </div>
                                </div>
                                <v-divider></v-divider>
                                <v-form ref="form"
                                        v-model="valid">
                                    <div class="wrapper">
                                        <div class="pa-8">
                                            <v-row class="mb-5">
                                                <v-col class="col-12">
                                                    <v-text-field
                                                        label="Descripción"
                                                        v-model="qrcode.description"
                                                        :rules="[rules.required,rules.text(qrcode.description,'Descripción')]"
                                                        outlined
                                                    ></v-text-field>
                                                </v-col>


                                                <v-col class="col-12">
                                                    <v-select
                                                        @change="getHeadquarters(qrcode.establishment_id)"
                                                        v-model="qrcode.establishment_id"
                                                        :items="establishments"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Establecimiento al que pertenece"
                                                        outlined
                                                        :rules="[rules.required]">
                                                    </v-select>
                                                </v-col>

                                                <v-col class="col-12">
                                                    <v-select
                                                        :disabled="qrcode.establishment_id==''"
                                                        v-model="qrcode.headquarters_id"
                                                        :items="headquarters"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Sede a la que pertenece"
                                                        outlined
                                                        :rules="[rules.required]">
                                                    </v-select>
                                                </v-col>
                                            </v-row>
                                        </div>
                                    </div>
                                </v-form>
                                <div class="d-flex justify-end">

                                    <v-btn @click="update(qrcode)"
                                           class="primary x-1" dark>
                                        Actualizar
                                    </v-btn>

                                    <v-btn @click="reset"
                                           class="secondary mx-1" dark>
                                        Cancelar
                                    </v-btn>
                                </div>
                            </v-card-text>
                        </v-card>
                    </v-col>
                </v-row>


            </v-container>
        </v-main>
    </v-app>
</template>

<script>
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'
import logo from "@/Components/Logo";
import colombiaJson from "@/../assets/colombia.json";

export default {
    name: "Edit",
    props: ['data'],
    components: {
        SpinnerComponent,
        QrcodeVue,
        logo
    },
    data: () => ({
        qrcode: {
            status: '',
            description: '',
            photo_path: '',
            establishment_id: '',
            headquarters_id: ''
        },

        defaultQrcode: {
            status: '',
            description: '',
            photo_path: '',
            establishment_id: '',
            headquarters_id: ''
        },
        establishments: [],
        headquarters: [],
        rules: {
            required: value => !!value || 'Campo requerido.',
            max: value => value.length <= 20 || 'Máximo 20 caracteres',
            min: value => value.length >= 10 || 'Mínimo 10 caracteres',

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
            }
        },
        valid: false,
    }),
    created() {
        this.qrcode = this.data;

        axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                this.establishments = response.data
            })
            .catch((error) => {
                console.log(error)
            })
    },
    methods: {
        getCities(department) {
            try {
                return colombiaJson.filter(
                    function (colombiaJson) {
                        return colombiaJson.departamento == department;
                    }
                )[0].ciudades;

            } catch (e) {
                return [];
            }
        },
        getHeadquarters(id) {
            if (id !== '') {
                axios.get(`/dashboard/establishment/${id}/headquarters`)
                    .then((response) => {
                        //console.log(response.data)
                        this.headquarters = response.data
                    })
                    .catch((error) => {
                        console.log(error)
                    })
            }
        },

        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },

        reset: function () {
            this.qrcode = this.defaulQrcode
            this.resetValidation();
        },

        resetValidation() {
            this.$refs.form.resetValidation()
        },


        update: function (data) {
            this.validate()
            console.log(data)
            data._method = 'PUT';
            let form = new FormData()
            for (const key in data) {
                form.set(key, data[key])
            }
            form.set('status', 'active');

            console.log(form)

            this.$inertia.post(this.route('qrcode.update', data.id), form, {
                onSuccess: response => {

                    let res = response.data;
                    console.log(response)
                    let text = "";
                    if (Object.keys(this.$page.errors).length > 0) {
                        console.log('errors => ', this.$page.errors)
                        for (var clave in this.$page.errors) {
                            text += clave + ": " + this.$page.errors[clave] + "\n ";
                        }
                        this.$swal({
                            icon: 'error',
                            title: 'Ups...',
                            text: text
                        })

                    } else {
                        this.$swal({
                            icon: 'success',
                            title: '¡Buen trabajo!',
                            text: this.$page.flash.message
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.reset();
                                this.resetValidation();
                            }
                        });
                    }
                },
            })

        },

    }
}
</script>

<style scoped>

</style>
