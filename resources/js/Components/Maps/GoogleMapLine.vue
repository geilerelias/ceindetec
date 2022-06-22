<template>

</template>

<script>

import {LINE_PATH_CONFIG} from '@/Constants/mapSettings'

export default {
    name: "GoogleMapLine.vue",
    props: {
        google: {
            type: Object,
            required: true
        },
        map: {
            type: Object,
            required: true
        },
        path: {
            type: Array,
            required: true
        }
    },

    mounted() {
        new this.google.maps.Polyline({
            path: this.path,
            map: this.map,
            ...LINE_PATH_CONFIG
        })
    }

}
</script>

<style scoped>

</style>
