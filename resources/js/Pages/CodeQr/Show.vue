<template>
    <simple-layout>
        <template v-slot:header>
            <div class=" text-subtitle-2 text-sm-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                Detalle de código
            </div>
            <div class="text-caption text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                CONVENIO DE COOPERACIÓN No 005 2021
            </div>
        </template>

        <v-container>

            <v-row class="d-flex justify-center">
                <v-col class="col-md-4 col-12">
                    <v-card class="h-full d-flex flex-column">

                        <v-card-title class="d-flex justify-space-around pt-1 pb-0 mb-0">
                            <logo :tile="true" :light="false" color="primary"
                                  :width="80"></logo>
                            <logo :tile="true" :light="false" color="primary" :width="80"
                                  src="logoAlcaldia"></logo>
                        </v-card-title>

                        <v-card-text class="pa-3 flex-grow-1">
                            <div class="d-flex align-center flex-column">
                                <v-avatar tile size="150" color="">
                                    <qrcode-vue class=""
                                                :value="`http://sigac.almaguajira.com/qrcode/${data.consecutive}`"
                                                :size="150"
                                                level="H"/>
                                </v-avatar>
                                <div class="text-center mt-2">
                                    <div class="font-weight-bold text-body-2">
                                        {{ data.consecutive }}
                                    </div>
                                </div>
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
                            <div v-if="data.status!=='inactive'">
                                <div>
                                    Descripción:
                                    <span class="font-weight-black text--primary">
                                            {{ data.description }}
                                        </span>
                                </div>
                                <div>
                                    Establecimiento:
                                    <span class="font-weight-black text--primary">
                                            {{ getEstablishment(data.establishment_id) }}
                                        </span>
                                </div>
                                <div>
                                    Sede:
                                    <span class="font-weight-black text--primary">
                                            {{ getHeadquarters(data.headquarters_id) }}
                                        </span>
                                </div>
                            </div>
                        </v-card-text>

                        <v-divider></v-divider>
                        <v-card-actions style="height: 40px">
                            <v-spacer></v-spacer>
                            <inertia-link :href="route('qrcode.edit',{id:data.id})">
                                <v-btn text fab small
                                       class="flex-grow-1">
                                    <v-icon>mdi-text-box-edit-outline</v-icon>
                                </v-btn>
                            </inertia-link>
                        </v-card-actions>
                    </v-card>
                </v-col>
            </v-row>

        </v-container>

    </simple-layout>
</template>

<script>
import SpinnerComponent from "@/Components/SpinnerComponent";
import QrcodeVue from 'qrcode.vue'
import logo from "@/Components/Logo";
import SimpleLayout from "@/Layouts/SimpleLayout";

export default {
    name: "Show",
    props: ['data'],
    components: {
        SpinnerComponent,
        QrcodeVue,
        SimpleLayout,
        logo
    },
    data: () => ({
        establishments: [],
        headquarters: [],
    }),
    created() {
        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            });

        axios.get(`/dashboard/headquarters/all`)
            .then((response) => {
                console.log(response.data)
                this.headquarters = response.data
            })
    },
    methods: {
        getEstablishment(id) {
            try {
                let found = this.establishments.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getHeadquarters(id) {
            try {
                let found = this.headquarters.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
    }
}
</script>

<style scoped>

</style>
