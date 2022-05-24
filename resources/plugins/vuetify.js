import Vue from 'vue'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

Vue.use(Vuetify)

const opts = {
    icons: {
        iconfont: 'mdi', // default - only for display purposes
    },
    theme: {
        themes: {
            /*light: {
                primary: '#6cc638',
                secondary: '#424242',
                accent: '#82B1FF',
                error: '#FF5252',
                info: '#2196F3',
                success: '#4CAF50',
                warning: '#FFC107',
            },
            dark: {
                primary: '#2b65ae',
                secondary: '#c45911',
                accent: '#82B1FF',
                error: '#f44336',
                warning: '#ff9800',
                info: '#00bcd4',
                success: '#4caf50',
            },*/
            light: {
                primary: '#001C47',
                secondary: '#E28925',
                accent: '#707070',
                error: '#FF5252',
                info: '#2196F3',
                success: '#4CAF50',
                warning: '#FFC107',
            },
            dark: {
                primary: '#2b65ae',
                secondary: '#c45911',
                accent: '#82B1FF',
                error: '#f44336',
                warning: '#ff9800',
                info: '#00bcd4',
                success: '#4caf50',
            },
        },
    },
}

export default new Vuetify(opts)
