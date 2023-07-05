<template>
    <v-app id="inspire">
        <header-component class="no-print"></header-component>
        <drawer-component class="no-print"></drawer-component>

        <v-main class="d-flex flex-column align-content-space-between">
            <div class="min-h-screen fill-height">
                <slot></slot>
            </div>

            <footer-component class="no-print"></footer-component>
        </v-main>
    </v-app>
</template>

<script>
import Footer from "@/Base/Footer.vue";
import Header from "@/Base/HeaderApp.vue";
import Drawer from "@/Base/DrawerApp.vue";

export default {
    props: {
        title: "",
        description: "",
    },
    components: {
        "footer-component": Footer,
        "header-component": Header,
        "drawer-component": Drawer,
    },

    data() {
        return {
            showingNavigationDropdown: false,
            items: [
                { title: "Dashboard", icon: "mdi-view-dashboard" },
                { title: "Photos", icon: "mdi-image" },
                { title: "About", icon: "mdi-help-box" },
            ],
            right: null,
        };
    },

    methods: {
        switchToTeam(team) {
            this.$inertia.put(
                route("current-team.update"),
                {
                    team_id: team.id,
                },
                {
                    preserveState: false,
                }
            );
        },

        logout() {
            axios.post(route("logout").url()).then((response) => {
                window.location = "/";
            });
        },
    },
};
</script>

<style scoped>
.v-btn {
    outline: none !important;
}

.v-application {
    font-family: "Roboto", sans-serif !important;
}

.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Roboto", sans-serif !important;
}
</style>
