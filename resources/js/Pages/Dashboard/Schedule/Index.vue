<template>
    <app-layout>
        <bread-crumbs name="Agenda" :items="items"></bread-crumbs>
        <v-container fluid></v-container>
    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import BreadCrumbs from '@/Components/BreadCrumbs.vue';

export default {
    name: 'Index',
    components: {
        AppLayout,
        BreadCrumbs
    },
    data: () => ({
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/'
            },
            {
                text: 'Agenda',
                disabled: true,
                href: ''
            }
        ]
    })
};
</script>

<style scoped></style>
