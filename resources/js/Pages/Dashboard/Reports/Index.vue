<template>
    <app-layout>
        <bread-crumbs name="Reporte" :items="items"></bread-crumbs>
        <v-container fluid></v-container>
    </app-layout>
</template>

<script>
import AppLayout from '@/Layouts/AppLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';

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
                text: 'Reportes',
                disabled: true,
                href: ''
            }
        ]
    })
};
</script>

<style scoped></style>
