require('./bootstrap');

require('moment');

import Vue from 'vue';

//inertia
import {InertiaApp} from '@inertiajs/inertia-vue';
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

//Plugins Permissions
import Permissions from '../Plugins/Permissions';

Vue.use(Permissions);

//vue gates
import VueGates from 'vue-gates'

Vue.use(VueGates)


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


