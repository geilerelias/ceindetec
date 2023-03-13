import './bootstrap';
//material icons
import "@mdi/font/css/materialdesignicons.css";
import '../css/app.css';

import Vue from 'vue';

//inertia
import {createInertiaApp, Head, Link} from '@inertiajs/inertia-vue'
import {InertiaProgress} from '@inertiajs/progress'
// import {InertiaForm} from 'laravel-jetstream';
import {resolvePageComponent} from 'laravel-vite-plugin/inertia-helpers';
import PortalVue from 'portal-vue';


Vue.mixin({methods: {route}});
// Vue.use(InertiaForm);
Vue.use(PortalVue);

//vuetify
import vuetify from '../plugins/vuetify'

//material design icons
import '@mdi/font/css/materialdesignicons.css' // Ensure you are using css-loader

//store
import store from "../plugins/store";

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

// const app = document.getElementById('app');
const appName = window.document.getElementsByTagName('title')[0]?.innerText || 'Laravel';


createInertiaApp({
    title: (title) => `${title} - ${appName}`,
    resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),

    setup({el, App, props, plugin}) {
        Vue.use(plugin)
        Vue.component('InertiaHead', Head)
        Vue.component('InertiaLink', Link)
        new Vue({
            vuetify,
            store,
            render: h => h(App, props),
        }).$mount(el)
    },
})

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
