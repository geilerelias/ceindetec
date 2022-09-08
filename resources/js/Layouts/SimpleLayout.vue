<template>
    <v-app>
        <v-card outlined tile class="no-print">
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
                <template v-slot:extension>
                    <slot name="extension"></slot>
                </template>
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

<style type="text/css" media="print">
@media print {
    #no-print {
        display: none;
    }
}

</style>
