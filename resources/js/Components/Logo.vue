<template>
    <inertia-link
        :href="route('home')"
        class="d-flex align-center text-decoration-none mr-2 router-link-exact-active router-link-active"
        aria-current="page">
        <v-avatar color="white" size="50">
            <v-avatar size="46">
                <v-img cover :src="logo" alt="logo"></v-img>
            </v-avatar>
        </v-avatar>
    </inertia-link>
</template>

<script>
import logo from '../../images/logo-ceindetec-circle.png';

export default {
    name: "Logo",
    data: () => ({
        logo: logo,
    })
}
</script>

<style scoped>

</style>
