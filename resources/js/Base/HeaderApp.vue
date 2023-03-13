<template>
    <div>
        <v-system-bar app class="primary">
            <span class="white--text text-truncate" style="font-size: x-small !important;">
                Cel. 313 816 1129 – 311 544 5061
            </span>
            <v-spacer></v-spacer>
            <span class="white--text text-truncate" style="font-size: x-small !important;">
                ceindetecgerencia@gmail.com
                Riohacha – Colombia
            </span>
        </v-system-bar>
        <v-app-bar app
                   clipped-left
                   clipped-right
                   :class="$vuetify.breakpoint.mdAndUp?'px-20':''"
                   color="secondary">

            <v-btn v-if="!route().current('home')" @click="back" text light dark fab class="mr-1">
                <v-icon>mdi-arrow-left</v-icon>
            </v-btn>

            <logo></logo>

            <v-spacer></v-spacer>

            <settings-dropdown></settings-dropdown>

            <div class="text-center" v-if="$page.props.user==null">
                <v-menu
                    :close-on-content-click="false"
                    :nudge-width="200"
                    offset-y
                >
                    <template v-slot:activator="{ on, attrs }">
                        <v-btn icon
                               v-bind="attrs"
                               v-on="on"
                               class="ml-2 hidden-sm-and-down white--text"

                        >
                            <v-icon>
                                mdi-dots-vertical
                            </v-icon>
                        </v-btn>
                    </template>

                    <v-card>
                        <v-list>
                            <template v-if="$page.props.user==null">
                                <v-subheader>Authentication</v-subheader>
                                <v-divider></v-divider>
                                <v-list-item
                                    v-for="item in items"
                                    :key="item.title"
                                    :href="item.route"
                                >
                                    <v-list-item-icon>
                                        <v-icon>{{ item.icon }}</v-icon>
                                    </v-list-item-icon>

                                    <v-list-item-content>
                                        <v-list-item-title>{{ item.title }}</v-list-item-title>
                                    </v-list-item-content>
                                </v-list-item>

                            </template>
                        </v-list>
                    </v-card>
                </v-menu>
            </div>

            <v-app-bar-nav-icon
                class="hidden-md-and-up white--text"
                @click="drawer?setDrawer(false):setDrawer(true)"
            ></v-app-bar-nav-icon>
        </v-app-bar>

        <v-btn
            v-show="fab"
            v-scroll="onScroll"
            bottom
            color="primary"
            dark
            fab
            fixed
            right
            @click="toTop"
        >
            <v-icon>mdi-chevron-up</v-icon>
        </v-btn>
    </div>
</template>

<script>

import {mapMutations, mapState} from "vuex";

import JetApplicationMark from '@/Jetstream/ApplicationMark.vue'
import JetDropdown from '@/Jetstream/Dropdown.vue'
import JetDropdownLink from '@/Jetstream/DropdownLink.vue'
import JetNavLink from '@/Jetstream/NavLink.vue'
import JetResponsiveNavLink from '@/Jetstream/ResponsiveNavLink.vue'

import logo from '@/Components/Logo.vue'
import SettingsDropdown from "@/Components/SettingsDropdown.vue";

export default {

    name: "Header",
    components: {
        JetApplicationMark,
        JetDropdown,
        JetDropdownLink,
        JetNavLink,
        JetResponsiveNavLink,
        logo,
        SettingsDropdown
    },
    props: {
        seeker: {
            type: Boolean,
            default: true
        },
        app: {
            type: Boolean,
            default: false
        },
    },
    created() {

    },
    data: () => ({

        fav: true,
        menu: false,
        dialog: false,
        message: false,
        hints: true,
        fab: false,
        logo: logo,
        department: [],
        businesses: [],
        items: [
            {title: 'Login', icon: 'mdi-account-lock', route: "/login"},
            {title: 'Sign Up', icon: 'mdi-account-plus', route: "/register"},
        ],
        opciones: [
            {title: "Notificaciones", icon: 'mdi-bell', route: ""},
            {title: "Seguidos", icon: 'mdi-account-group', route: ""},
            {title: "Favoritos", icon: 'mdi-heart', route: ""},
            {title: "Ubicación", icon: 'mdi-map-marker', route: ""},
            {title: "Ajustes", icon: 'mdi-cog', route: ""},
        ],
    }),
    computed: {
        ...mapState(["drawer", "search", "page", "color", "flat", "links", "idBusiness"]),
        localSearch: {
            get() {
                return this.search;
            },
            set(val) {
                this.setSearch(val);
            }
        },
    },
    methods: {
        ...mapMutations([
            "setDrawer",
            "setSearch",
            "setPage",
            "setFlat",
            "setIdBusiness"
        ]),
        toTop() {
            this.$vuetify.goTo(0);
        }
        ,
        onScroll(e) {
            if (typeof window === "undefined") return;
            const top = window.pageYOffset || e.target.scrollTop || 0;
            if (top > 50) {
                this.fab = true;
                this.setFlat(false);
            } else {
                this.fab = false;
                this.setFlat(true);
            }
        }
        ,
        switchToTeam(team) {
            this.$inertia.put(route('current-team.update'), {
                'team_id': team.id
            }, {
                preserveState: false
            })
        },
        logout() {
            axios.post(route('logout').url())
                .then(response => {
                    window.location = '/';
                })
        },
        back() {
            window.history.back();
            //return document.referrer;
        },
        searching() {
            if (!this.route().current('marketplace')) {
                this.$inertia.get('/marketplace');
            }
        }
    }
}
</script>

<style scoped>
.active {
    border-bottom: solid;
}

.px-20 {
    padding-left: 20px !important;
    padding-right: 20px !important;
}
</style>

