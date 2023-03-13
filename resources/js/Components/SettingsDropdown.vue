<template>
    <div>
        <!-- Settings Dropdown -->
        <div v-if="$page.props.user" class="text-center hidden-xs-only">
            <v-menu
                :close-on-content-click="false"
                offset-y
            >

                <template v-slot:activator="{ on, attrs }">
                    <v-btn v-if="$page.props.jetstream.managesProfilePhotos"
                           dark
                           fab
                           large
                           text
                           v-bind="attrs"
                           v-on="on"
                    >
                        <v-img :alt="$page.props.user.name" :src="$page.props.user.profile_photo_url"
                               class="rounded-circle"
                               cover
                               style="max-height: 48px;max-width: 48px"></v-img>
                    </v-btn>
                </template>


                <v-card class="pa-5">
                    <v-list>
                        <v-list-item>
                            <v-list-item-avatar v-if="$page.props.jetstream.managesProfilePhotos">
                                <img
                                    :alt="$page.props.user.name"
                                    :src="$page.props.user.profile_photo_url"
                                >
                            </v-list-item-avatar>

                            <v-list-item-content>
                                <v-list-item-title>{{ $page.props.user.name }}</v-list-item-title>
                                <v-list-item-subtitle>{{ $page.props.user.email }}</v-list-item-subtitle>
                            </v-list-item-content>
                        </v-list-item>
                    </v-list>

                    <v-divider></v-divider>

                    <!-- Responsive Settings Options -->
                    <v-list v-if="$page.props.user!==null" dense>

                        <v-list-item-group
                            color="primary"
                        >
                            <inertia-link :href="route('dashboard')">
                                <v-list-item
                                    :class="route().current('dashboard')?'active primary  white--text':''"
                                    :dark="route().current('dashboard')">
                                    <v-list-item-icon>
                                        <v-icon>mdi-view-dashboard</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title>Dashboard</v-list-item-title>
                                    </v-list-item-content>
                                </v-list-item>
                            </inertia-link>
                            <v-subheader>Settings Options</v-subheader>
                            <inertia-link :href="route('profile.show')">
                                <v-list-item
                                    :class="route().current('profile.show')?'active primary  white--text':''"
                                    :dark="route().current('profile.show')">
                                    <v-list-item-icon>
                                        <v-icon>mdi-account-circle</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title> Profile</v-list-item-title>
                                    </v-list-item-content>
                                </v-list-item>
                            </inertia-link>
                            <inertia-link v-if="$page.props.jetstream.hasApiFeatures"
                                          :href="route('api-tokens.index')">
                                <v-list-item
                                    :class="route().current('api-tokens.index')?'active primary  white--text':''"
                                    :dark="route().current('api-tokens.index')"
                                >
                                    <v-list-item-icon>
                                        <v-icon>mdi-lan</v-icon>
                                    </v-list-item-icon>
                                    <v-list-item-content>
                                        <v-list-item-title> API Tokens</v-list-item-title>
                                    </v-list-item-content>
                                </v-list-item>
                            </inertia-link>
                            <template v-if="$page.props.jetstream.hasTeamFeatures">


                                <v-subheader>Manage Team</v-subheader>
                                <inertia-link :href="route('teams.show', $page.props.user.current_team)">
                                    <v-list-item
                                        :class="route().current('teams.show')?'active primary  white--text':''"
                                        :dark="route().current('teams.show')"
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
                                        :class="route().current('teams.create')?'active primary  white--text':''"
                                        :dark="route().current('teams.create')"
                                    >
                                        <v-list-item-icon>
                                            <v-icon>mdi-account-multiple-plus</v-icon>
                                        </v-list-item-icon>
                                        <v-list-item-content>
                                            <v-list-item-title>Create New Team</v-list-item-title>
                                        </v-list-item-content>
                                    </v-list-item>
                                </inertia-link>
                            </template>
                        </v-list-item-group>
                    </v-list>

                    <div v-if="$page.props.user!==null" class="pt-4 pb-1 border-t border-gray-200">

                        <div class="mt-3 space-y-1">

                            <!-- Team Management -->
                            <template v-if="$page.props.jetstream.hasTeamFeatures">

                                <!-- Team Switcher -->
                                <div class="block px-4 py-2 text-xs text-gray-400">
                                    Switch Teams
                                </div>

                                <template v-for="team in $page.props.user.all_teams">
                                    <form :key="team.id" @submit.prevent="switchToTeam(team)">
                                        <jet-responsive-nav-link as="button">
                                            <div class="flex items-center">
                                                <svg v-if="team.id == $page.props.user.current_team_id"
                                                     class="mr-2 h-5 w-5 text-green-400" fill="none"
                                                     stroke="currentColor" stroke-linecap="round"
                                                     stroke-linejoin="round"
                                                     stroke-width="2" viewBox="0 0 24 24">
                                                    <path
                                                        d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                                </svg>
                                                <div>{{ team.name }}</div>
                                            </div>
                                        </jet-responsive-nav-link>
                                    </form>
                                </template>
                            </template>
                        </div>
                    </div>

                    <v-subheader>Authentication</v-subheader>

                    <v-list-item @click="logout">
                        <v-list-item-icon>
                            <v-icon>mdi-logout</v-icon>
                        </v-list-item-icon>
                        <v-list-item-content>
                            <v-list-item-title>Logout</v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </v-card>
            </v-menu>


        </div>
    </div>
</template>

<script>
export default {
    name: "SettingsDropdown",
    data: () => ({
        items: [
            {title: 'Login', icon: 'mdi-account-lock', route: '/login'},
            {title: 'Sign Up', icon: 'mdi-account-plus', route: '/register'}
        ],
    }),
    methods: {
        logout() {
            axios.post(route('logout').url()).then(response => {
                window.location = '/';
            });
        }
    }
}
</script>

<style scoped>

</style>
