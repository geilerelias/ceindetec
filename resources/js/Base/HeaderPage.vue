<template>
    <v-app-bar app
               class="ma-0 pa-0 "
               :height="
            $vuetify.breakpoint.mdAndUp
                ? 136
                : $vuetify.breakpoint.xsOnly
                ? 88
                : 176
        "
    >
        <v-row
            class="ma-0 "
            :style="
                $vuetify.breakpoint.mdAndUp
                    ? 'height: 136px !important;'
                    : 'height:176px !important'
            "
        >
            <v-col
                v-if="$vuetify.breakpoint.mdAndUp"
                class="primary d-flex justify-center align-center"
                style="height: 136px;max-height: 136px;"
                :style="
                    $vuetify.breakpoint.mdAndDown
                        ? 'width: 170px;max-width: 170px'
                        : 'width: 260px; max-width: 260px'
                "
            >
                <img :src="logo" alt="" width="200px" class="float-right"/>
            </v-col>
            <div
                class="triangle-shapes"
                v-if="$vuetify.breakpoint.lgAndUp"
            ></div>
            <v-col
                class="px-0 my-0 "
                :class="$vuetify.breakpoint.xsOnly ? 'mt-8' : 'mt-n3'"
            >
                <v-toolbar
                    flat
                    :height="$vuetify.breakpoint.mdAndUp ? 48 : 88"
                    :class="$vuetify.breakpoint.mdAndUp ? 'orange' : 'primary'"
                    class="px-md-10"
                >
                    <div v-if="$vuetify.breakpoint.smAndDown">
                        <v-img
                            contain
                            src="https://ceindetec.org.co/img/web/logofinal.png"
                            alt=""
                            width="150"
                            class="float-right"
                            id="logoimg"
                        />
                    </div>
                    <v-spacer></v-spacer>
                    <v-spacer v-if="$vuetify.breakpoint.xsOnly"></v-spacer>

                    <v-btn
                        v-if="$vuetify.breakpoint.xsOnly"
                        height="40"
                        width="40"
                        min-width="40"
                        color="white"
                        @click="drawer ? setDrawer(false) : setDrawer(true)"
                    >
                        <v-icon dark>mdi-menu</v-icon>
                    </v-btn>

                    <v-container
                        class="d-flex d-none d-sm-flex justify-end"
                        v-if="$vuetify.breakpoint.smAndUp"
                    >
                        <div class="align-self-center d-md-flex">
                            <p
                                class="text--white white--text text-right align-self-center mb-1 mt-1"
                                style="font-size: 16px;"
                            >
                                <span class="d-none d-lg-inline ">
                                    <v-icon size="17" dark class="mt-n1">
                                        mdi-clock-outline
                                    </v-icon>
                                    8:00am - 6:00pm |
                                </span>
                                <span class="ma-0 pa-0">
                                    <v-icon size="17" dark class="mt-n1">
                                        mdi-phone-outline
                                    </v-icon>
                                    3138161 129- 3504944938 |
                                </span>
                                <span class="ma-0 pa-0">
                                    <v-icon size="18" dark class="mt-n1">
                                        mdi-email-outline
                                    </v-icon>
                                    informacion@ceindetec.org.co
                                </span>
                            </p>
                        </div>
                    </v-container>
                    <!--</editor-fold>-->
                </v-toolbar>
                <v-toolbar
                    v-if="$vuetify.breakpoint.smAndUp"
                    flat
                    height="88"
                    class="d-flex justify-center justify-md-end py-0 px-md-10"
                >
                    <inertia-link
                        v-for="item in links"
                        :key="item.id"
                        :href="route(item.route)"
                    >
                        <v-btn
                            rounded
                            :class="
                                route().current(item.route)
                                    ? 'active secondary--text  font-weight-black white--text'
                                    : 'accent--text link'
                            "
                            class="overline font-weight-bold v"
                            text
                        >
                            {{ item.title }}
                        </v-btn>
                    </inertia-link>

                    <settings-dropdown v-if="$page.user!==null"></settings-dropdown>

                </v-toolbar>
            </v-col>
        </v-row>
    </v-app-bar>
</template>

<script>
import {mapMutations, mapState} from 'vuex';
import logo from '../../images/logo-ceindetec.png';
import SettingsDropdown from '@/Components/SettingsDropdown'

export default {
    components: {
        SettingsDropdown
    },
    data: () => ({
        logo
    }),
    computed: {
        ...mapState(['drawer', 'links'])
    },
    methods: {
        ...mapMutations([
            'setDrawer',
            'setSearch',
            'setPage',
            'setFlat',
            'setIdBusiness'
        ])
    }
};
</script>

<style>
.v-app-bar > .v-toolbar__content {
    padding-right: 0px;
    padding-left: 0px;
}

.triangle-shapes {
    position: absolute;
    height: 0px;
    width: 0px;
    border-top: 0px solid #001c47;
    border-left: 200px solid #001c47;
    border-right: 0px solid transparent;
    border-bottom: 136px solid transparent;
    z-index: 1;
    left: 259px;
}

.active {
    border-bottom: none !important;;
}

/*.active {*/
/*    border-bottom: solid;*/
/*}*/

/*.link {*/
/*    transition: 0.7s ease-out !important;*/
/*    border-radius: 5px 5px 0 0 !important;*/

/*    !* text-decoration: none; *!*/
/*    border-bottom: 3px solid #ffffff !important;*/
/*    padding: 25px 5px !important;*/
/*    margin: 0 !important;*/
/*}*/

/*.link:hover {*/
/*    !* border-top: 2px solid #bdbdbd !important; *!*/
/*    border-bottom: 3px solid !important;*/
/*    padding: 6px 5px !important;*/
/*}*/

.px-20 {
    padding-left: 20px !important;
    padding-right: 20px !important;
}
</style>
