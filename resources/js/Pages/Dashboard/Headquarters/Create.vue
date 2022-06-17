<template>
    <div>
        <app-layout>
            <bread-crumbs
                name="Registro de sedes"
                :items="items"
            ></bread-crumbs>
            <v-container class="d-flex justify-center">
                <div class="py-6" style="max-width: 800px">
                    <v-card class="mt-4 v-card">
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
                                <v-row>
                                    <v-col class="col-12">
                                        <v-select
                                            v-model="headquarters.establishment_id"
                                            :items="establishments"
                                            item-text="name"
                                            item-value="id"
                                            label="Establecimiento al que pertenece"
                                            :rules="[rules.required]">
                                        </v-select>
                                    </v-col>
                                    <v-col class="col-8">
                                        <v-text-field v-model="headquarters.name"
                                                      label="Nombre de la sede"
                                                      :rules="[rules.required,rules.min]">
                                        </v-text-field>
                                    </v-col>
                                    <v-col class="col-md-4 col-12">
                                        <v-text-field
                                            v-model="headquarters.dane_code"
                                            label="Código DANE"
                                        ></v-text-field>
                                    </v-col>
                                    <v-col class="col-md-6 col-12">
                                        <v-text-field
                                            v-model="headquarters.address"
                                            label="Dirección"
                                            :rules="[rules.required]">
                                        </v-text-field>
                                    </v-col>
                                    <v-col class="col-md-3 col-12">
                                        <v-select
                                            v-model="headquarters.department"
                                            :items="departments"
                                            :rules="[rules.required]"
                                            label="Departamento *"
                                            required
                                        ></v-select>
                                    </v-col>
                                    <v-col class="col-md-3 col-12">
                                        <v-select
                                            :disabled="headquarters.department==null"
                                            v-model="headquarters.municipality"
                                            :items="getCities(headquarters.department)"
                                            :rules="[rules.required]"
                                            label="Municipio *"
                                            required
                                        ></v-select>
                                    </v-col>
                                    <v-col class="col-md-4 col-12">
                                        <v-text-field v-model="headquarters.email"
                                                      label="Email"
                                                      :rules="[rules.email]">
                                        </v-text-field>
                                    </v-col>
                                    <v-col class="col-md-4 col-12">
                                        <v-text-field
                                            v-model="headquarters.phone"
                                            label="teléfono"
                                            :rules="[rules.phone]">
                                        </v-text-field>
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
                                        &nbsp;
                                    </v-col>
                                </v-row>

                            </v-container>
                        </v-form>
                    </v-card>
                </div>
            </v-container>
            <spinner-component :value="saving" color="primary" :opacity="0.9"></spinner-component>
        </app-layout>

    </div>
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
                text: 'Sedes',
                disabled: false,
                href: '/dashboard/headquarters'
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
        establishments: [],
        headquarters: {
            establishment_id: '',
            name: '',
            nit: '0000',
            dane_code: '',
            address: '',
            municipality: '',
            department: 'La Guajira',
            email: 'mail@mail.com',
            phone: '',
        }, defaultHeadquarters: {
            establishment_id: '',
            name: '',
            nit: '',
            dane_code: '',
            icfes_code: '',
            address: '',
            municipality: null,
            department: null,
            email: '',
            phone: '',
        },
        rules: {
            required: value => !!value || 'Campo requerido.',
            max: value => value.length <= 20 || 'Máximo 20 caracteres',
            min: value => value.length >= 10 || 'Mínimo 10 caracteres',
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

                for (var key in this.headquarters) {
                    formData.append(key, this.headquarters[key]);
                }
                //console.log(formData)

                this.$inertia.post(this.route('headquarters.store'), formData, {

                    onSuccess: (response) => {
                        let res = response.data;
                        //console.log(response)
                        ///console.log('este es page', this.$page);
                        this.$swal({
                            icon: `${this.$page.errors.name ? 'error' : 'success'}`,
                            title: `${this.$page.errors.name ? 'Ups...' : '¡Buen trabajo!'}`,
                            text: `${this.$page.errors.name ? this.$page.errors.name[0] : this.$page.flash.message}`
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.resetValidation();
                                /*  this.reset();*/
                                this.$inertia.get(this.route('headquarters.index'));
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
                        this.saving = false;
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
