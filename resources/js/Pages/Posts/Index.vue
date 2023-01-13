<template>
    <app-layout>
        <bread-crumbs name="Posts" :items="links"></bread-crumbs>
        <v-container>
            <v-toolbar
                color="white"
                light
                rounded
                class="mb-2"
            >
                <v-icon>mdi-note-text</v-icon>
                <v-toolbar-title> Listado de post</v-toolbar-title>
                <v-spacer></v-spacer>

                <inertia-link :href="route('posts.create')">
                    <v-btn color="success">
                        crear post
                    </v-btn>
                </inertia-link>
            </v-toolbar>
            <v-card>


                <v-row>
                    <v-col>
                        <v-card-text>
                            <v-list link>
                                <v-list-item v-for="item in data" :key="item.id">
                                    {{ item }}
                                </v-list-item>
                            </v-list>
                        </v-card-text>
                    </v-col>

                    <v-divider vertical></v-divider>

                    <v-col
                        cols="12"
                        md="6"
                    >
                        <v-card-text>
                            <div
                                v-if="data.length === 0"
                                key="title"
                                class="text-h6 font-weight-light grey--text pa-4 text-center"
                            >
                                Select your favorite breweries
                            </div>

                            <v-scroll-x-transition
                                group
                                hide-on-leave
                            >

                            </v-scroll-x-transition>
                        </v-card-text>
                    </v-col>
                </v-row>

                <v-divider></v-divider>

                <v-card-actions>
                    <v-btn
                        text
                        @click="tree = []"
                    >
                        Reset
                    </v-btn>

                    <v-spacer></v-spacer>

                    <v-btn
                        class="white--text"
                        color="green darken-1"
                        depressed
                    >
                        Save
                        <v-icon right>
                            mdi-content-save
                        </v-icon>
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-container>
    </app-layout>
</template>


<script>
import appLayout from "@/Layouts/AppLayout.vue";
import breadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    components: {
        appLayout,
        breadCrumbs
    },
    props: ['data'],
    data: () => ({
        links: [
            {
                text: 'Dashboard',
                disabled: false,
                href: 'breadcrumbs_dashboard',
            },
            {
                text: 'Link 1',
                disabled: false,
                href: 'breadcrumbs_link_1',
            },
            {
                text: 'Link 2',
                disabled: true,
                href: 'breadcrumbs_link_2',
            },
        ],
    }),


    watch: {},

    methods: {},
}
</script>
