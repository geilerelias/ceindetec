<template>
    <app-layout>
        <bread-crumbs
            name="Actualización de establecimiento"
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
                            Modifica la información del establecimiento
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
                                           @click="update"
                                           :disabled="!valid"
                                           :loading="saving">
                                        Actualizar Información
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
    name: 'Edit',
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
                text: 'Edición',
                disabled: true,
                href: '#'
            },
        ],
        saving: false,
        valid: false,
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
                const pattern = /[7-9]{1}[0-9]{9}/;
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
        }
    }),

    created() {
        for (const item in colombiaJson) {
            this.departments.push(colombiaJson[item].departamento);
        }
        this.departments = this.departments.sort();
        this.establishment = this.data;
    },

    methods: {
        validate() {
            this.$refs.form.validate()
        },
        
        reset() {
            this.$refs.form.reset()
        },

        resetValidation() {
            this.$refs.form.resetValidation()
        },

        update() {
            this.saving = true;
            this.establishment._method = 'PUT';
            this.$inertia.post(this.route('establishment.update', this.establishment.id), this.establishment, {
                onStart: (visit) => {
                    this.loadingEditItem = true;
                },
                onSuccess: (page) => {
                    this.$swal({
                        icon: `${page.props.errors.name ? 'error' : 'success'}`,
                        title: `${page.props.errors.name ? 'Ups...' : '¡Buen trabajo!'}`,
                        text: `${page.props.errors.name ? page.props.errors.name[0] : page.props.flash.message}`
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
                onError: (errors) => {
                    this.$swal(
                        'Opps...!',
                        'Excuse me, an error occurred.',
                        'warning'
                    )
                },
                onFinish: visit => {
                    this.loadingEditItem = false;
                    this.saving = false;
                },
            })
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
