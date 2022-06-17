<template>
    <app-layout>
        <bread-crumbs
            name="Registro de establecimiento"
            :items="items"
        ></bread-crumbs>
        <v-container class="d-flex justify-center">
            <div class="py-6" style="max-width: 800px">
                <v-card class="mt-4">
                    <v-card-title class="align-start">
                        <v-card
                            class="overflow-hidden mt-n9 transition-swing elevation-6 rounded primary"
                            style="max-width: 100%;"
                        >
                            <div class="pa-8">
                                <v-icon dark size="36">mdi-school</v-icon>
                            </div>
                        </v-card>
                        <div class="text-h5 pl-4 ">
                            Ingresa la información del establecimiento
                        </div>
                    </v-card-title>

                    <v-form
                        ref="form"
                        v-model="valid" class="">
                        <v-container class="py-0 px-4">
                            <v-row class="row">
                                <v-col class="col-12">
                                    <v-text-field v-model="establishment.name"
                                                  label="Nombre del establecimiento"
                                                  :rules="[rules.required,rules.min]">
                                    </v-text-field>
                                </v-col>
                                <v-col class="col-md-4 col-12">
                                    <v-text-field v-model="establishment.nit" label="Nit"
                                                  type="number">
                                    </v-text-field>
                                </v-col>

                                <v-col class="col-md-3 col-12">
                                    <v-select
                                        v-model="establishment.department"
                                        :items="departments"
                                        :rules="[rules.required]"
                                        label="Departamento *"
                                        required
                                    ></v-select>
                                </v-col>
                                <v-col class="col-md-3 col-12">
                                    <v-select
                                        :disabled="establishment.department==null"
                                        v-model="establishment.municipality"
                                        :items="getCities(establishment.department)"
                                        :rules="[rules.required]"
                                        label="Municipio *"
                                        required
                                    ></v-select>
                                </v-col>

                                <v-col class="text-right  col-12 pb-6">
                                    <v-btn color="secondary" @click="reset()">
                                        limpiar formulario
                                    </v-btn>

                                    <v-btn color="primary"
                                           @click="saved"
                                           :disabled="!valid"
                                           :loading="saving">
                                        Registrar Información
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-form>
                </v-card>
            </div>
        </v-container>
        <spinner-component :value="saving" color="primary" :opacity="0.9"></spinner-component>

    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';
import colombiaJson from '@/../assets/colombia.json'
import PictureInput from 'vue-picture-input'
import SpinnerComponent from "@/Components/SpinnerComponent";

export default {
    name: 'Create',
    components: {
        AppLayout,
        BreadCrumbs,
        PictureInput,
        SpinnerComponent
    },
    props: ['data', 'errors'],

    data: () => ({
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/dashboard'
            },
            {
                text: 'Establecimientos',
                disabled: false,
                href: '/dashboard/establishment'
            },
            {
                text: 'Crear',
                disabled: true,
                href: '#'
            }
        ],
        saving: false,
        valid: false,
        name: '',
        imageUrl: '',
        imageFile: null,
        imageName: '',
        departments: [],
        establishment: {
            name: '',
            nit: '',
            municipality: null,
            department: null,
        },
        defaultEstablishment: {
            name: '',
            nit: '',
            municipality: null,
            department: null,
        },
        rules: {
            required: value => !!value || 'Campo requerido.',
            max: value => value.length <= 12 || 'Máximo 12 caracteres',
            min: value => value.length >= 12 || 'Mínimo 12 caracteres',
            email: value => {
                const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                return pattern.test(value) || 'Invalid e-mail.'
            },
            phone: value => {
                const pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                return pattern.test(value) || 'Numero telefónico invalido.'

            },
            text: value => {
                const pattern = /^\s+$/;
                return pattern.test(value) || 'Solo caracteres alfabéticos.'

            },
            number: value => {
                const pattern = /^\d+$/;
                return pattern.test(value) || 'solo caracteres numéricos.'

            }
        },
    }),

    created() {
        for (const item in colombiaJson) {
            this.departments.push(colombiaJson[item].departamento);
        }
        this.departments = this.departments.sort();
    },

    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },
        reset() {
            this.$refs.form.reset()
        },
        resetValidation() {
            this.$refs.form.resetValidation()
        },
        saved() {
            this.saving = true;
            if (!this.validate() && !this.valid) {
                this.$swal.fire(
                    "Campos Obligatorio!",
                    "Ingresa los campos obligatorios!",
                    "error"
                )
                this.saving = false;
            } else {
                let formData = new FormData();

                for (var key in this.establishment) {
                    formData.append(key, this.establishment[key]);
                }
                //console.log(formData)

                this.$inertia.post("/dashboard/establishment", formData, {

                    onSuccess: (response) => {
                        let res = response.data;
                        console.log(res)
                        this.$swal({
                            icon: `${this.$page.errors.name ? 'error' : 'success'}`,
                            title: `${this.$page.errors.name ? 'Ups...' : '¡Buen trabajo!'}`,
                            text: `${this.$page.errors.name ? this.$page.errors.name[0] : this.$page.flash.message}`
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.establishment = this.defaultEstablishment;
                                this.reset();
                                this.resetValidation();
                                this.$inertia.get(this.route('establishment.index'));
                            }
                        });
                    },
                    onError: error => {
                        console.log(error);
                        this.saving = false;

                        const array = error.response.data.errors;
                        let text = "";
                        for (var clave in array) {
                            text += clave + ": " + array[clave] + "\n ";
                        }
                        this.$swal.fire("Error!", text, "error");
                        console.log(text);
                    },
                    onFinish: visit => {
                    },
                });
            }
        },
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
    }

};
</script>

<style></style>
