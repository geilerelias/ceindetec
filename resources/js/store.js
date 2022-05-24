import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

const store = new Vuex.Store({
    state: {
        drawer: false,
        search: "",
        page: "",
        flat: "",
        links: [{
            title: "Inicio",
            icon: 'mdi-home',
            route: "home"
        },
            {
                title: "Nosotros",
                icon: 'mdi-account-question',
                route: "about-us"
            },
            {
                title: "Aliados",
                icon: 'mdi-handshake',
                route: "allies"
            },
            {
                title: "Convenios",
                icon: 'mdi-card-account-details',
                route: "agreements"
            },
            {
                title: "Clientes",
                icon: 'mdi-account-group',
                route: "customers"
            },
            {

                title: "Blog",
                icon: 'mdi-post',
                route: "blog"
            },
            {

                title: "Contácto",
                icon: 'mdi-card-account-phone',
                route: "contact-us"
            },
        ],

        linksWithAuth: [{
            route: "dashboard",
            icon: 'mdi-view-dashboard',
            title: "Dashboard"
        },
            {
                title: "Agenda",
                icon: 'mdi-calendar-month',
                route: "schedule"
            },
            {
                title: "Reportes",
                icon: 'mdi-chart-bar',
                route: "reports"
            },
            {
                title: "Establecimientos",
                icon: 'mdi-school',
                route: "establishment.index",
                //can: 'view permission',
                array: null
            },
            {
                title: "User",
                icon: 'mdi-account-tie',
                route: "user.index",
                //can: 'view user',
                array: null
            },
            {
                title: "Roles",
                icon: 'mdi-shield-account',
                route: "role.index",
                //can: 'view rol',
                array: null
            },
            {
                title: "Permisos",
                icon: 'mdi-badge-account-outline',
                route: "permission.index",
                //can: 'view permission',
                array: null
            },

        ]
    },
    getters: {
        getDrawer(state) {
            return state.drawer;
        },
        getIdBusiness(state) {
            return state.idBusiness;
        },
        getSearch(state) {
            return state.search;
        },
        getPage(state) {
            return state.page;
        },
        getFlat(state) {
            return state.flat;
        }
    },
    mutations: {
        setDrawer(state, v) {
            state.drawer = v;
        },
        setIdBusiness(state, v) {
            state.idBusiness = v;
        },
        setSearch(state, v) {
            state.search = v;
        },
        setPage(state, v) {
            state.page = v;
        },
        setFlat(state, v) {
            state.flat = v;
        },
        aumentarNum(state) {
            state.numero++;
        }

    },
});

export default store;
