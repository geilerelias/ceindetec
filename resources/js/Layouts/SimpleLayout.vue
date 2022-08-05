<template>
    <v-app id="inspire">
        <v-card outlined tile id="no-print-header">
            <v-toolbar
                color="primary"
                dark
                height="100"
            >
                <v-btn icon @click="back()">
                    <v-icon color="white">
                        mdi-arrow-left
                    </v-icon>
                </v-btn>
                <logo :tile="true" :light="true" color="primary" :width="150"></logo>
                <v-spacer></v-spacer>

                <div class="text-right">
                    <slot name="header"></slot>
                </div>
                <settings-dropdown></settings-dropdown>
            </v-toolbar>
            <v-toolbar dense class="secondary" max-height="10"></v-toolbar>
        </v-card>

        <!-- Page Content -->
        <main class="fill-height">
            <slot></slot>
        </main>
    </v-app>
</template>

<script>
import logo from "@/Components/Logo";
import SettingsDropdown from "@/Components/SettingsDropdown";

export default {
    name: "SimpleLayout",
    components: {
        logo,
        SettingsDropdown
    },
    methods: {
        back() {
            window.history.back()
        }
    }
}
</script>

<style scoped>

</style>
