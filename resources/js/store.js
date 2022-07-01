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
                title: "Construcción",
                icon: 'mdi-account-hard-hat',
                route: "before_during_after.building"
            },
            {
                title: "Adecuación",
                icon: 'mdi-account-wrench',
                route: "before_during_after.adequacy"
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

        linksWithAuth: [
            {
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

            [
                {title: "Matricula", icon: 'mdi-file-table-box-multiple',},
                {
                    title: "Ingresar Matricula",
                    icon: 'mdi-text-box-plus',
                    route: "establishment.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Ingresar Matricula",
                    icon: 'mdi-text-box-search',
                    route: "establishment.index",
                    //can: 'view permission',
                    array: null
                },
            ],
            [
                {title: "Académicos", icon: 'mdi-school'},
                {
                    title: "Establecimiento",
                    icon: 'mdi-town-hall',
                    route: "establishment.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Sedes",
                    icon: 'mdi-home-clock',
                    route: "headquarters.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Año académico",
                    icon: 'mdi-clipboard-text-clock',
                    route: "year.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Planes de estudios",
                    icon: 'mdi-file-tree',
                    route: "study-plans.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Grados",
                    icon: 'mdi-book-education',
                    route: "degree.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Areas",
                    icon: 'mdi-book-multiple',
                    route: "area.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Asignaturas",
                    icon: 'mdi-book-open-variant',
                    route: "subject.index",
                    //can: 'view permission',
                    array: null
                },

            ],


            [
                {title: "Usuarios", icon: 'mdi-account-supervisor'},

                {
                    title: "Docentes",
                    icon: 'mdi-human-male-board',
                    route: "person.create.teacher",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Estudiantes",
                    icon: 'mdi-account-school',
                    route: "person.create.student",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Acudiente",
                    icon: 'mdi-account-circle',
                    route: "person.create.attendant",
                    //can: 'view permission',
                    array: null
                },
            ],

            [
                {title: "Calificaciones", icon: 'mdi-file-certificate'},
                {
                    title: "Ingresar calificaciones",
                    icon: 'mdi-file-plus',
                    route: "headquarters.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Ver notas actuales",
                    icon: 'mdi-file-eye',
                    route: "headquarters.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Registro extendido",
                    icon: 'mdi-file-find',
                    route: "headquarters.index",
                    //can: 'view permission',
                    array: null
                },

            ],
            [
                {title: "Permisos", icon: 'mdi-shield-account'},
                {
                    title: "Asignar rol",
                    icon: 'mdi-badge-account',
                    route: "user.index",
                    //can: 'view user',
                    array: null
                },
                {
                    title: "Roles",
                    icon: 'mdi-account-supervisor-circle',
                    route: "role.index",
                    //can: 'view rol',
                    array: null
                },
                {
                    title: "Permisos",
                    icon: 'mdi-account-details',
                    route: "permission.index",
                    //can: 'view permission',
                    array: null
                },
            ],
            {
                title: "Post",
                icon: 'mdi-note-text',
                route: "posts.index",
                //can: 'view permission',
                array: null
            },
            [
                {
                    title: "Seguimientos",
                    icon: 'mdi-radar',
                },
                {
                    title: "Gestión de Obras",
                    icon: 'mdi-file-document-edit',
                    route: "work.index",
                    //can: 'view permission',
                    array: null
                },
                {
                    title: "Todas las Obras",
                    icon: 'mdi-file-document-multiple',
                    route: "follow",
                    //can: 'view permission',
                    array: null
                }
            ]
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
