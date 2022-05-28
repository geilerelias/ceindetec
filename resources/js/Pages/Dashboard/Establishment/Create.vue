<template>
    <app-layout>
        <bread-crumbs
            name="Registro de establecimiento"
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
                            Ingresa la informacion del establecimiento
                        </div>
                    </v-card-title>
                    <v-form novalidate="novalidate" class="">
                        <v-container class="py-0 px-4">
                            <v-row class="row">
                                <v-col class="col-12">
                                    <v-text-field
                                        label="Nombre del establecimiento"
                                    ></v-text-field>
                                </v-col>
                                <v-col class="col-md-4 col-12">
                                    <v-text-field label="Nit"></v-text-field>
                                </v-col>
                                <v-col class="col-md-4 col-12">
                                    <v-text-field
                                        label="Código DANE"
                                    ></v-text-field>
                                </v-col>
                                <v-col class="col-md-4 col-12">
                                    <v-text-field
                                        label="Código Icfes"
                                    ></v-text-field>
                                </v-col>
                                <v-col class="col-md-6 col-12">
                                    <v-text-field
                                        label="Dirección"
                                    ></v-text-field>
                                </v-col>
                                <v-col class="col-md-3 col-12">
                                    <v-select
                                        v-model="establishment.department"
                                        :items="departments"
                                        :rules="[v => !!v || 'department is required']"
                                        label="Departamento *"
                                        required
                                    ></v-select>
                                </v-col>
                                <v-col class="col-md-3 col-12">
                                    <v-select
                                        :disabled="establishment.department===null"
                                        v-model="establishment.city"
                                        :items="getCities(establishment.department)"
                                        :rules="[v => !!v || 'City is required']"
                                        label="Ciudad *"
                                        required
                                    ></v-select>
                                </v-col>


                                <v-col class="col-md-4 col-12">
                                    <v-text-field label="Email"></v-text-field>
                                </v-col>
                                <v-col class="col-md-4 col-12">
                                    <v-text-field
                                        label="Telefono"
                                    ></v-text-field>
                                </v-col>

                                <v-col class="text-right  col-12 pb-6">
                                    <v-btn color="secondary">
                                        limpiar formulario
                                    </v-btn>

                                    <v-btn color="primary">
                                        Registrar Información
                                    </v-btn>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-form>
                </v-card>
            </div>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';
import colombiaJson from '@/../assets/colombia.json'


export default {
    name: 'Create',
    components: {
        AppLayout,
        BreadCrumbs
    },
    props: ['data', 'errors'],

    data: () => ({
        departments: [],
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/'
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
        establishment: {
            city: '',
            department: ''
        }
    }),

    created() {
        for (const item in colombiaJson) {
            this.departments.push(colombiaJson[item].departamento);
        }
        this.departments = this.departments.sort();
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
    }

};
</script>

<style></style>
