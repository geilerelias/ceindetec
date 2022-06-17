<template>
    <v-navigation-drawer
        v-model="localDrawer"
        absolute
        temporary
        style="box-shadow: rgb(0 0 0 / 20%) -20px 1px 17px 8px, rgb(0 0 0 / 14%) 0px 2px 2px 0px, rgb(0 0 0 / 12%) 0px 1px 5px 0px"
    >
        <v-system-bar></v-system-bar>

        <v-list>
            <v-list-item>
                <v-list-item-avatar>
                    <v-img
                        :aspect-ratio="1"
                        class="primary "
                        contain
                        :src="logo"
                    >
                        <template v-slot:placeholder>
                            <v-row
                                class="fill-height ma-0"
                                align="center"
                                justify="center"
                            >
                                <v-progress-circular
                                    indeterminate
                                    color="grey lighten-5"
                                ></v-progress-circular>
                            </v-row>
                        </template>
                    </v-img>
                    <v-divider></v-divider>
                </v-list-item-avatar>
            </v-list-item>

            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="text-h6">
                        CEINDETEC
                    </v-list-item-title>
                    <v-list-item-subtitle>
                        Centro de Desarrollo Tecnologico de los llanos
                    </v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>
        </v-list>
        <v-divider></v-divider>
        <v-list nav dense>
            <v-list-item-group v-model="group" color="primary">
                <inertia-link
                    v-for="item in links"
                    :key="item.id"
                    :href="route(item.route)"
                >
                    <v-list-item
                        :dark="route().current(item.route)"
                        :class="
                            route().current(item.route)
                                ? 'active primary  white--text'
                                : ''
                        "
                    >
                        <v-list-item-icon>
                            <v-icon v-text="item.icon"></v-icon>
                        </v-list-item-icon>

                        <v-list-item-content>
                            <v-list-item-title
                                v-text="item.title"
                            ></v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </inertia-link>
                <v-divider></v-divider>
                <v-divider></v-divider>
                <inertia-link :href="route('dashboard')">
                    <v-list-item
                        :dark="route().current('dashboard')"
                        :class="
                            route().current('dashboard')
                                ? 'active primary  white--text'
                                : ''
                        "
                    >
                        <v-list-item-icon>
                            <v-icon v-text="'mdi-view-dashboard'"></v-icon>
                        </v-list-item-icon>

                        <v-list-item-content>
                            <v-list-item-title
                                v-text="'Dashboard'"
                            ></v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </inertia-link>
            </v-list-item-group>
        </v-list>
    </v-navigation-drawer>
</template>
<script>
import logo from '@/../images/logo-ceindetec.png';

import {mapMutations, mapState} from 'vuex';

export default {
    data: () => ({
        logo,
        group: null,
        selectedItem: 0,
        items: [
            {text: 'My Files', icon: 'mdi-folder'},
            {text: 'Shared with me', icon: 'mdi-account-multiple'},
            {text: 'Starred', icon: 'mdi-star'},
            {text: 'Recent', icon: 'mdi-history'},
            {text: 'Offline', icon: 'mdi-check-circle'},
            {text: 'Uploads', icon: 'mdi-upload'},
            {text: 'Backups', icon: 'mdi-cloud-upload'}
        ]
    }),

    watch: {
        group() {
            this.drawer ? this.setDrawer(false) : this.setDrawer(true);
        }
    },

    computed: {
        ...mapState(['drawer', 'links']),
        localDrawer: {
            get() {
                return this.drawer;
            },
            set(val) {
                this.setDrawer(val);
            }
        }
    },
    
    methods: {
        ...mapMutations([
            'setDrawer',
            'setPage',
            'setColor',
            'setFlat',
            'setPagePrincipal'
        ])
    }
};
</script>

<style lang="scss" scoped></style>
