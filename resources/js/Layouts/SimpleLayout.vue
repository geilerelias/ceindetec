<template>
    <v-app>
        <v-card outlined tile class="no-print">
            <v-toolbar
                color="primary"
                dark
                height="100"
            >
                <v-btn icon @click="back()" v-if="elements">
                    <v-icon color="white">
                        mdi-arrow-left
                    </v-icon>
                </v-btn>
                <logo :tile="true" :light="true" color="primary" :width="150"></logo>
                <v-spacer></v-spacer>
                <div class="d-flex justify-space-around align-center">
                    <div class="text-right mr-sm-2 fill-height d-flex justify-space-around align-center">
                        <slot name="header"></slot>
                    </div>
                    <settings-dropdown v-if="elements==true"></settings-dropdown>
                </div>
                <template v-slot:extension v-if="extension==true">
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
    props: {
        extension: {
            type: Boolean,
            default: true
        },
        elements: {
            type: Boolean,
            default: true
        }
    },
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
