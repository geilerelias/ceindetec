<template>
    <app-layout>
        <v-container>
            <v-row>
                <v-col>
                    <v-card>
                        <v-list dense>
                            <v-subheader> Tickets Recientes</v-subheader>
                            <v-list-item-group
                                v-model="selectedItem"
                                color="primary"
                            >
                                <v-list-item
                                    v-for="(item, i) in items"
                                    :key="i"
                                >
                                    <v-list-item-icon>
                                        <v-icon v-text="item.icon"></v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title v-text="item.text"></v-list-item-title>
                                    </v-list-item-content>
                                </v-list-item>
                            </v-list-item-group>
                        </v-list>
                    </v-card>
                </v-col>
                <v-col class="col-md-8">
                    <v-card>
                        <v-card-title>
                            Abrir Ticket
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                            <v-row>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field label="Nombre"
                                                  :value="$page.user.name"
                                                  readonly
                                                  outlined/>
                                </v-col>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field label="Dirección de email"
                                                  :value="$page.user.email"
                                                  readonly
                                                  outlined/>
                                </v-col>
                                <v-col class="col-sm-12 col-md-12">
                                    <v-text-field label="Asunto" outlined>

                                    </v-text-field>
                                </v-col>
                                <v-col class="col-sm-12 col-md-12">
                                    <v-autocomplete label="Categoría" outlined>
                                        <template v-slot:append-outer
                                                  class="fill-height d-flex justify-center align-center">
                                            <v-slide-x-reverse-transition
                                                mode="out-in"
                                            >
                                                <div>
                                                    <inertia-link :href="route('ticket-category.index')">
                                                        <v-btn fab small color="primary">
                                                            <v-icon color="white">
                                                                mdi-plus
                                                            </v-icon>
                                                        </v-btn>
                                                    </inertia-link>
                                                </div>
                                            </v-slide-x-reverse-transition>
                                        </template>
                                    </v-autocomplete>

                                </v-col>
                                <v-col class="col-sm-12 col-md-12">
                                    <vue-editor ref="myTextEditor"/>
                                </v-col>

                                <v-col>
                                    <v-file-input
                                        v-model="files"
                                        color="primary"
                                        counter
                                        label="Adjuntar archivo"
                                        multiple
                                        placeholder="Select your files"
                                        prepend-icon="mdi-paperclip"
                                        outlined
                                        :show-size="1000"
                                    >
                                        <template v-slot:selection="{ index, text }">
                                            <v-chip
                                                v-if="index < 2"
                                                color="secondary"
                                                dark
                                                label
                                                small
                                            >
                                                {{ text }}
                                            </v-chip>

                                            <span
                                                v-else-if="index === 2"
                                                class="text-overline grey--text text--darken-3 mx-2"
                                            >
                                                +{{ files.length - 2 }} File(s)
                                            </span>
                                        </template>
                                    </v-file-input>
                                </v-col>
                            </v-row>
                        </v-card-text>
                        <v-card-actions class="d-flex justify-center align-center ">
                            <v-btn class="primary">Enviar</v-btn>
                            <v-btn class="secondary">Cancelar</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";

import {VueEditor} from "vue2-editor";

export default {
    name: "Index",
    components: {
        AppLayout,
        VueEditor
    },
    data: () => ({
        selectedItem: 1,
        items: [
            {text: 'Error en red', icon: 'mdi-tag'},
            {text: 'Inconveniente con el cargue de archivo', icon: 'mdi-tag'},
            {text: 'No puedo registrar estudiantes', icon: 'mdi-tag'},
        ],
    }),
}
</script>

<style scoped>

</style>
