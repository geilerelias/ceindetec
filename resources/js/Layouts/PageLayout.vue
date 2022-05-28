<template>
    <v-app>
        <drawer-component></drawer-component>
        <header-component></header-component>
        <v-main class="min-h-screen">
            <slot></slot>
        </v-main>
        <footer-component></footer-component>
    </v-app>
</template>

<script>
import HeaderComponent from '@/Base/HeaderPage.vue';
import DrawerComponent from '@/Base/DrawerPage.vue';
import FooterComponent from '@/Base/Footer.vue';

export default {
    components: {
        HeaderComponent,
        DrawerComponent,
        FooterComponent
    }
};
</script>

<style>
.v-btn {
    outline: none !important;
}

.v-application {
    font-family: "Roboto", sans-serif !important;
}

.v-application [class*="text-"] {
    color: #36405a;
    font-family: "Roboto", sans-serif !important;
}
</style>
