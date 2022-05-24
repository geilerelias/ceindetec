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
                   :class="$vuetify.breakpoint.mdAndUp?'px-20':''"
                   color="secondary">

            <v-btn v-if="!route().current('home')" @click="back" text light dark fab class="mr-1">
                <v-icon>mdi-arrow-left</v-icon>
            </v-btn>

            <logo></logo>

            <v-spacer></v-spacer>

            <!-- Settings Dropdown -->
            <div v-if="$page.user!==null" class="text-center hidden-xs-only">
                <v-menu
                    offset-y
                    :close-on-content-click="false"
                >
                    <!--                                <template v-slot:activator="{ on, attrs }">
                                                        <v-btn text
                                                               v-bind="attrs"
                                                               v-on="on"
                                                               class="px-1 ml-2 mr-n2 rounded-pill">
                                                            <v-avatar class="transparent" size="35" v-if="$page.jetstream.managesProfilePhotos">
                                                                <v-img cover :src="$page.user.profile_photo_url" :alt="$page.user.name"></v-img>
                                                            </v-avatar>

                                                            <span
                                                                class="text-none font-weight-regular ml-3 hidden-sm-and-down text-truncate"
                                                                style="max-width: 100px;">{{ $page.user.name }}</span>
                                                            <v-icon>mdi-chevron-down</v-icon>
                                                        </v-btn>
                                                    </template> -->
                    <template v-slot:activator="{ on, attrs }">
                        <v-btn v-if="$page.jetstream.managesProfilePhotos"
                               fab
                               dark
                               text
                               v-bind="attrs"
                               v-on="on"
                               large
                        >
                            <v-img style="max-height: 48px;max-width: 48px" class="rounded-circle" cover
                                   :src="$page.user.profile_photo_url"
                                   :alt="$page.user.name"></v-img>
                        </v-btn>
                    </template>

                    <v-card class="pa-5">
                        <v-list>
                            <v-list-item>
                                <v-list-item-avatar v-if="$page.jetstream.managesProfilePhotos">
                                    <img
                                        :src="$page.user.profile_photo_url"
                                        :alt="$page.user.name"
                                    >
                                </v-list-item-avatar>

                                <v-list-item-content>
                                    <v-list-item-title>{{ $page.user.name }}</v-list-item-title>
                                    <v-list-item-subtitle>{{ $page.user.email }}</v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                        </v-list>

                        <v-divider></v-divider>

                        <!-- Responsive Settings Options -->
                        <v-list v-if="$page.user!==null" dense>
                            <v-subheader>Settings Options</v-subheader>
                            <v-list-item-group
                                color="primary"
                            >
                                <inertia-link :href="route('profile.show')">
                                    <v-list-item
                                        :dark="route().current('profile.show')"
                                        :class="route().current('profile.show')?'active primary  white--text':''">
                                        <v-list-item-icon>
                                            <v-icon>mdi-account-circle</v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title> Profile</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </inertia-link>
                                <inertia-link :href="route('api-tokens.index')"
                                              v-if="$page.jetstream.hasApiFeatures">
                                    <v-list-item
                                        :dark="route().current('api-tokens.index')"
                                        :class="route().current('api-tokens.index')?'active primary  white--text':''"
                                    >
                                        <v-list-item-icon>
                                            <v-icon>mdi-lan</v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title> API Tokens</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </inertia-link>
                                <v-subheader>Manage Team</v-subheader>
                                <inertia-link :href="route('teams.show', $page.user.current_team)">
                                    <v-list-item
                                        :dark="route().current('teams.show')"
                                        :class="route().current('teams.show')?'active primary  white--text':''"
                                    >
                                        <v-list-item-icon>
                                            <v-icon>mdi-account-group</v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title> Team Settings</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </inertia-link>

                                <inertia-link :href="route('teams.create')">
                                    <v-list-item
                                        :dark="route().current('teams.create')"
                                        :class="route().current('teams.create')?'active primary  white--text':''"
                                    >
                                        <v-list-item-icon>
                                            <v-icon>mdi-account-multiple-plus</v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title>Create New Team</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </inertia-link>
                            </v-list-item-group>
                        </v-list>

                        <div v-if="$page.user!==null" class="pt-4 pb-1 border-t border-gray-200">

                            <div class="mt-3 space-y-1">

                                <!-- Team Management -->
                                <template v-if="$page.jetstream.hasTeamFeatures">

                                    <!-- Team Switcher -->
                                    <div class="block px-4 py-2 text-xs text-gray-400">
                                        Switch Teams
                                    </div>

                                    <template v-for="team in $page.user.all_teams">
                                        <form @submit.prevent="switchToTeam(team)" :key="team.id">
                                            <jet-responsive-nav-link as="button">
                                                <div class="flex items-center">
                                                    <svg v-if="team.id == $page.user.current_team_id"
                                                         class="mr-2 h-5 w-5 text-green-400" fill="none"
                                                         stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                         stroke="currentColor" viewBox="0 0 24 24">
                                                        <path d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                    </svg>
                                                    <div>{{ team.name }}</div>
                                                </div>
                                            </jet-responsive-nav-link>
                                        </form>
                                    </template>
                                </template>
                            </div>
                        </div>
                    </v-card>
                </v-menu>
            </div>

            <div class="text-center" v-if="$page.user==null">
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
                            <template v-if="$page.user==null">
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

import JetApplicationMark from '@/Jetstream/ApplicationMark'
import JetDropdown from '@/Jetstream/Dropdown'
import JetDropdownLink from '@/Jetstream/DropdownLink'
import JetNavLink from '@/Jetstream/NavLink'
import JetResponsiveNavLink from '@/Jetstream/ResponsiveNavLink'

import logo from '@/Components/Logo'

export default {

    name: "Header",
    components: {
        JetApplicationMark,
        JetDropdown,
        JetDropdownLink,
        JetNavLink,
        JetResponsiveNavLink,
        logo
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

<style>
.active {
    border-bottom: solid;
}

.px-20 {
    padding-left: 20px !important;
    padding-right: 20px !important;
}
</style>

