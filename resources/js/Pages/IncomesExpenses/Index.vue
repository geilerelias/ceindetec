<template>
    <app-layout>
        <bread-crumbs :items="links" name="Ingresos y egresos"></bread-crumbs>

        <v-container grid-list-lg>
            <v-layout row wrap>
                <v-flex v-for="(line, i) in lines" :key="i" md6 sm12 xs12>
                    <v-hover v-slot:default="{ hover }" open-delay="200">
                        <inertia-link :href="line.route">
                            <v-card :elevation="hover ? 16 : 2" @click="">
                                <v-list-item three-line>
                                    <v-list-item-avatar
                                        color="grey lighten-2"
                                        size="80"
                                    >
                                        <v-icon color="grey darken-3" size="60">
                                            {{ line.icon }}
                                        </v-icon>
                                    </v-list-item-avatar>
                                    <v-list-item-content>
                                        <v-list-item-title
                                            class="headline mb-1 darken-4--text"
                                        >
                                            {{ line.name }}
                                        </v-list-item-title>
                                        <v-list-item-subtitle>
                                            {{ line.description }}
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                </v-list-item>

                                <v-card-actions>
                                    <div class="flex-grow-1"></div>
                                    <v-btn color="grey darken-3" dark text>
                                        Ingresar
                                    </v-btn>
                                </v-card-actions>
                            </v-card>
                        </inertia-link>
                    </v-hover>
                </v-flex>
            </v-layout>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    components: { BreadCrumbs, AppLayout },
    data() {
        return {
            links: [
                {
                    text: "Dashboard",
                    disabled: false,
                    href: "/dashboard",
                },
                {
                    text: "IncomeExpense",
                    disabled: true,
                    href: "",
                },
            ],
            lines: [
                {
                    route: "/incomes-expenses-from/Conectividad",
                    name: "Conectividad",
                    icon: "mdi-radio-tower",
                    description:
                        "Este apartado contiene toda la información relacionada con los ingresos y egresos de conectividad por mes. Aquí podrás encontrar detalles sobre los gastos e ingresos generados por la conectividad, incluyendo los montos y las fechas en que se realizaron.",
                },
                {
                    route: "/incomes-expenses-from/Paneles Solares",
                    name: "Paneles Solares",
                    icon: "mdi-solar-power-variant ",
                    description:
                        "Este apartado contiene toda la información relacionada con los ingresos y egresos de Paneles Solares por mes. Aquí podrás encontrar detalles sobre los gastos e ingresos generados por la conectividad, incluyendo los montos y las fechas en que se realizaron.",
                },
                {
                    route: "/incomes-expenses-from/Hidropaneles",
                    name: "Hidropaneles",
                    icon: "mdi-solar-panel",
                    description:
                        "Este apartado contiene toda la información relacionada con los ingresos y egresos de Hidropaneles por mes. Aquí podrás encontrar detalles sobre los gastos e ingresos generados por la conectividad, incluyendo los montos y las fechas en que se realizaron.",
                },
            ],
            establishments: [],
            headquarters: [],
        };
    },
};
</script>

<style lang="scss" scoped></style>
