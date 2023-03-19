<template>
    <app-layout>
        <bread-crumbs :items="links" name="Mis Tickets de Soporte"></bread-crumbs>

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

            </v-row>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";

import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    name: "Index",
    components: {
        BreadCrumbs,
        AppLayout,
    },
    data: () => ({
        selectedItem: 1,

        items: [
            {text: 'Error en red', icon: 'mdi-tag'},
            {text: 'Inconveniente con el cargue de archivo', icon: 'mdi-tag'},
            {text: 'No puedo registrar estudiantes', icon: 'mdi-tag'},
        ],
        links: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/dashboard',
            },
            {
                text: 'Tickets',
                disabled: true,
                href: '/dashboard/ticket',
            },
        ],
    }),
}
</script>

<style scoped>

</style>
