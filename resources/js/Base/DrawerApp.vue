<template>
    <v-navigation-drawer
        v-model="localDrawer"
        app
        :permanent="!$vuetify.breakpoint.smAndDown"
        :temporary="$vuetify.breakpoint.smAndDown"
        clipped
        style="box-shadow: rgb(0 0 0 / 20%) -20px 1px 17px 8px, rgb(0 0 0 / 14%) 0px 2px 2px 0px, rgb(0 0 0 / 12%) 0px 1px 5px 0px"
    >


        <v-img
            :aspect-ratio="1"
            :width="300"
            color="primary"
            class="primary"
            contain
            :src="logo"
        >
            <template v-slot:placeholder>
                <v-row class="fill-height ma-0" align="center" justify="center">
                    <v-progress-circular
                        indeterminate
                        color="grey lighten-5"
                    ></v-progress-circular>
                </v-row>
            </template>
        </v-img>

        <v-divider></v-divider>

        <template v-if="$page.user !== null">
            <v-list-item two-line>
                <v-list-item-avatar>
                    <img
                        :src="$page.user.profile_photo_url"
                        :alt="$page.user.name"
                    />
                </v-list-item-avatar>

                <v-list-item-content>
                    <v-list-item-title>{{ $page.user.name }}</v-list-item-title>
                    <v-list-item-subtitle>
                        {{ $page.user.email }}
                    </v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>
            <v-divider></v-divider>
        </template>

        <v-list nav dense shaped>
            <v-list-item-group v-model="group" color="primary">

                <template v-if="$page.user == null">
                    <v-divider></v-divider>
                    <v-subheader>Authentication</v-subheader>
                    <inertia-link
                        v-for="item in items"
                        :key="item.title"
                        :href="item.route"
                    >
                        <v-list-item>
                            <v-list-item-icon>
                                <v-icon>{{ item.icon }}</v-icon>
                            </v-list-item-icon>

                            <v-list-item-content>
                                <v-list-item-title>
                                    {{ item.title }}
                                </v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>
                    </inertia-link>
                </template>

                <!-- Responsive Settings Options -->
                <template v-if="$page.user !== null" dense>

                    <template v-for="item in linksWithAuth">
                        <inertia-link
                            :key="item.id"
                            :href="route(item.route)"
                            v-if="!Array.isArray(item)"
                        >
                            <v-list-item
                                :dark="isActive(item.route)"
                                :class="isActive(item.route)
                                    ? 'active primary  white--text'
                                    : '' "
                                :value="isActive(item.route)?true:false"
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

                        <v-list-group :prepend-icon="item[0].icon" no-action v-else>

                            <template v-slot:activator>
                                <v-list-item-content>
                                    <v-list-item-title> {{ item[0].title }}</v-list-item-title>
                                </v-list-item-content>
                            </template>

                            <v-list-item
                                v-for="(i, n) in item.slice(1,item.length)"
                                :key="`id${n}${i}`"
                                :dark="isActive(i.route)"
                                :class=" isActive(i.route)? 'active primary  white--text': ''"
                                @click="redirect(i.route)"
                            >
                                <v-list-item-icon>
                                    <v-icon v-text="i.icon"></v-icon>
                                </v-list-item-icon>

                                <v-list-item-content>
                                    <v-list-item-title
                                        v-text="i.title"
                                    ></v-list-item-title>
                                </v-list-item-content>
                            </v-list-item>

                        </v-list-group>
                    </template>

                    <v-divider></v-divider>
                    <v-subheader>Settings Options</v-subheader>

                    <inertia-link :href="route('profile.show')">
                        <v-list-item
                            :dark="route().current('profile.show')"
                            :class="
                                route().current('profile.show')
                                    ? 'active primary  white--text'
                                    : ''
                            "
                        >
                            <v-list-item-icon>
                                <v-icon>mdi-card-account-details-outline</v-icon>
                            </v-list-item-icon>
                            <v-list-item-content>
                                <v-list-item-title>Perfil</v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>
                    </inertia-link>
                    <inertia-link
                        :href="route('api-tokens.index')"
                        v-if="$page.jetstream.hasApiFeatures"
                    >
                        <v-list-item
                            :dark="route().current('api-tokens.index')"
                            :class="
                                route().current('api-tokens.index')
                                    ? 'active primary  white--text'
                                    : ''
                            "
                        >
                            <v-list-item-icon>
                                <v-icon>mdi-lan</v-icon>
                            </v-list-item-icon>
                            <v-list-item-content>
                                <v-list-item-title>
                                    API Tokens
                                </v-list-item-title>
                            </v-list-item-content>
                        </v-list-item>
                    </inertia-link>

                    <v-subheader>Authentication</v-subheader>

                    <v-list-item @click="logout">
                        <v-list-item-icon>
                            <v-icon>mdi-logout</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Logout</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                    <template v-if="$page.jetstream.hasTeamFeatures">
                        <v-subheader>Manage Team</v-subheader>
                        <inertia-link
                            :href="route('teams.show', $page.user.current_team)"
                        >
                            <v-list-item
                                :dark="route().current('teams.show')"
                                :class="
                                route().current('teams.show')
                                    ? 'active primary  white--text'
                                    : ''
                            "
                            >
                                <v-list-item-icon>
                                    <v-icon>mdi-account-group</v-icon>
                                </v-list-item-icon>
                                <v-list-item-content>
                                    <v-list-item-title>
                                        Team Settings
                                    </v-list-item-title>
                                </v-list-item-content>
                            </v-list-item>
                        </inertia-link>
                        <inertia-link :href="route('teams.create')">
                            <v-list-item
                                :dark="route().current('teams.create')"
                                :class="
                                route().current('teams.create')
                                    ? 'active primary  white--text'
                                    : ''
                            "
                            >
                                <v-list-item-icon>
                                    <v-icon>mdi-account-multiple-plus</v-icon>
                                </v-list-item-icon>
                                <v-list-item-content>
                                    <v-list-item-title>
                                        Create New Team
                                    </v-list-item-title>
                                </v-list-item-content>
                            </v-list-item>
                        </inertia-link>
                    </template>
                </template>
            </v-list-item-group>
        </v-list>
        <div
            v-if="$page.user !== null"
            class="pt-4 pb-1 border-t border-gray-200"
        >
            <div class="mt-3 space-y-1">
                <!-- Team Management -->
                <template v-if="$page.jetstream.hasTeamFeatures">
                    <!-- Team Switcher -->
                    <div class="block px-4 py-2 text-xs text-gray-400">
                        Switch Teams
                    </div>

                    <template v-for="team in $page.user.all_teams">
                        <form
                            @submit.prevent="switchToTeam(team)"
                            :key="team.id"
                        >
                            <jet-responsive-nav-link as="button">
                                <div class="flex items-center">
                                    <svg
                                        v-if="
                                            team.id ==
                                                $page.user.current_team_id
                                        "
                                        class="mr-2 h-5 w-5 text-green-400"
                                        fill="none"
                                        stroke-linecap="round"
                                        stroke-linejoin="round"
                                        stroke-width="2"
                                        stroke="currentColor"
                                        viewBox="0 0 24 24"
                                    >
                                        <path
                                            d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"
                                        ></path>
                                    </svg>
                                    <div>{{ team.name }}</div>
                                </div>
                            </jet-responsive-nav-link>
                        </form>
                    </template>
                </template>
            </div>
        </div>
    </v-navigation-drawer>
</template>

<script>
import {mapMutations, mapState} from 'vuex';
import logo from '../../images/logo-ceindetec.png';

import JetApplicationMark from '@/Jetstream/ApplicationMark.vue';
import JetDropdown from '@/Jetstream/Dropdown.vue';
import JetDropdownLink from '@/Jetstream/DropdownLink.vue';
import JetNavLink from '@/Jetstream/NavLink.vue';
import JetResponsiveNavLink from '@/Jetstream/ResponsiveNavLink.vue';

export default {
    name: 'Drawer',
    components: {
        JetApplicationMark,
        JetDropdown,
        JetDropdownLink,
        JetNavLink,
        JetResponsiveNavLink
    },
    data: () => ({
        dialog: false,
        group: null,
        logo: logo,
        items: [
            {title: 'Login', icon: 'mdi-account-lock', route: '/login'},
            {title: 'Sign Up', icon: 'mdi-account-plus', route: '/register'}
        ],
        businesses: [],
        right: null,
        notifications: false,
        sound: true,
        widgets: false,
        select: [
            {text: 'State 1'},
            {text: 'State 2'},
            {text: 'State 3'},
            {text: 'State 4'},
            {text: 'State 5'},
            {text: 'State 6'},
            {text: 'State 7'}
        ]
    }),
    created() {
    },
    watch: {
        group() {
            this.drawer ? this.setDrawer(false) : this.setDrawer(true);
        }
    },
    computed: {
        ...mapState(['drawer', 'linksWithAuth']),
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
        ]),
        redirect(route) {
            this.$inertia.get(this.route(route))
        },
        switchToTeam(team) {
            this.$inertia.put(
                route('current-team.update'),
                {
                    team_id: team.id
                },
                {
                    preserveState: false
                }
            );
        },
        isActive(route) {
            if (this.route().current(route)) {
                return true;
            }
            return false;
        },

        logout() {
            axios.post(route('logout').url()).then(response => {
                window.location = '/';
            });
        }
    }
};
</script>

<style></style>
