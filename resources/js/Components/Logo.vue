<template>
    <inertia-link

        :href="route('home')"
        class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
        aria-current="page">
        <v-avatar :color="color" :size="size" :tile="tile" v-if="width ==0">
            <v-img light contain :src="light?logos['logoLight']:logos['logo']" alt="logo"></v-img>
        </v-avatar>

        <img v-else-if="src!==''" :src="logos[src]" alt="" :width="width" class="float-right"/>
        <img v-else :src="light?logos['logoLight']:logos['logo']" alt="" :width="width" class="float-right"/>

    </inertia-link>
</template>

<script>
import logo from '@/../images/logodark.png';
import logoLight from '@/../images/logo-ceindetec.png';
import alcaldia from '@/../images/alcaldia.jpg'

export default {
    name: "Logo",
    props: {
        tile: {
            type: Boolean,
            default: false
        },
        color: {
            type: String,
            default: 'white'
        },
        src: {
            type: String,
            default: ''
        },
        light: {
            type: Boolean,
            default: false
        },
        size: {
            type: Number,
            default: 50
        },
        width: {
            type: Number,
            default: 0
        }
    },
    data: () => ({
        logos: {
            "logo": logo,
            "logoLight": logoLight,
            "logoAlcaldia": alcaldia,
        },


    })
}
</script>

<style scoped>

</style>
