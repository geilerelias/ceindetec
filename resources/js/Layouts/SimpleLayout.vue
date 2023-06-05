<template>
    <v-app>
        <inertia-head>
            <title>{{title}}</title>
        </inertia-head>
        <v-expand-transition>
            <v-card :class="{'sticky-top':fixed}" class="no-print" outlined tile>
                <v-app-bar v-scroll="onScroll"
                           color="primary"
                           dark
                           height="90"
                >
                    <v-btn v-if="elements" class="d-print-none" icon @click="back()">
                        <v-icon color="white">
                            mdi-arrow-left
                        </v-icon>
                    </v-btn>
                    <logo :light="true" :tile="true" :width="150" color="primary"></logo>
                    <v-spacer></v-spacer>
                    <div class="d-flex justify-space-around align-center">
                        <div class="text-right mr-sm-2 fill-height d-flex justify-space-around align-center">
                            <slot name="header"></slot>
                        </div>
                        <settings-dropdown v-if="elements===true" class="d-print-none"></settings-dropdown>
                    </div>
                    <template v-if="extension===true" v-slot:extension class="d-print-none">
                        <slot class="d-print-none" name="extension"></slot>
                    </template>
                </v-app-bar>
                <v-toolbar class="secondary" dense
                           max-height="10"></v-toolbar>
            </v-card>
        </v-expand-transition>

        <!-- Page Content -->
        <main class="fill-height">
            <slot></slot>
        </main>
    </v-app>
</template>

<script>
import logo from "@/Components/Logo.vue";
import SettingsDropdown from "@/Components/SettingsDropdown.vue";

export default {
    name: "SimpleLayout",
    props: {
        title: {
            type: String,
        },
        extension: {
            type: Boolean,
            default: true
        },
        elements: {
            type: Boolean,
            default: true
        },
        app: {default: null, required: false}
    },
    components: {
        logo,
        SettingsDropdown,
    },
    data() {
        return {
            scrollInvoked: null,
            fixed: false
        }
    },
    methods: {
        back() {
            window.history.back()
        },
        onScroll(e) {
            if (typeof window === "undefined") return;
            const top = window.pageYOffset || e.target.scrollTop || 0;
            this.fixed = top > 120;
        },
    },

}
</script>
<style>
.sticky-top {
    position: sticky;
    top: 0;
    z-index: 1;
    background-color: white;
}
</style>

<style media="print" type="text/css">
@media print {
    #no-print {
        display: none;
    }
}

</style>
