<template>
    <inertia-link
        :href="route('home')"
        class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
        aria-current="page">
        <v-avatar color="white" :size="size" :tile="tile">
            <v-img contain :src="logo" alt="logo"></v-img>
        </v-avatar>
    </inertia-link>
</template>

<script>
import logo from '@/../images/logodark.png';

export default {
    name: "Logo",
    props: {
        tile: {
            type: Boolean,
            default: false
        },
        size: {
            type: Number,
            default: 50
        },
    },
    data: () => ({
        logo: logo,
    })
}
</script>

<style scoped>

</style>
