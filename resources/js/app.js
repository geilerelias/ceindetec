require('./bootstrap');

require('moment');

import Vue from 'vue';

//inertia
import {InertiaApp} from '@inertiajs/inertia-vue';
import {InertiaProgress} from '@inertiajs/progress'
import {InertiaForm} from 'laravel-jetstream';
import PortalVue from 'portal-vue';

Vue.mixin({methods: {route}});
Vue.use(InertiaApp);
Vue.use(InertiaForm);
Vue.use(PortalVue);

//vuetify
import vuetify from '../plugins/vuetify'

//material design icons
import '@mdi/font/css/materialdesignicons.css' // Ensure you are using css-loader

//store
import store from "./store";

//VueSweetalert2
import VueSweetalert2 from 'vue-sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';

Vue.use(VueSweetalert2);


//V Animate Css
import VAnimateCss from 'v-animate-css';
import 'animate.css';

Vue.use(VAnimateCss);

//vue gates
import VueGates from 'vue-gates'

Vue.use(VueGates)

//Plugins Permissions
import Permissions from '../plugins/Permissions';

Vue.use(Permissions);

//Vue GoogleMaps
import * as VueGoogleMaps from "vue2-google-maps";

Vue.use(VueGoogleMaps, {
    load: {
        key: "AIzaSyBPCugFwbeVgbxal0aJ1dHzzHAwfttNurI",
        libraries: "places" //necessary for places input
    }
});


const app = document.getElementById('app');

new Vue({
    vuetify,
    store,
    render: (h) =>
        h(InertiaApp, {
            props: {
                initialPage: JSON.parse(app.dataset.page),
                resolveComponent: (name) => require(`./Pages/${name}`).default,
            },
        }),
}).$mount(app);

InertiaProgress.init({
    // The delay after which the progress bar will
    // appear during navigation, in milliseconds.
    delay: 250,
    // The color of the progress bar.
    color: '#29d',
    // Whether to include the default NProgress styles.
    includeCSS: true,
    // Whether the NProgress spinner will be shown.
    showSpinner: true,
});
