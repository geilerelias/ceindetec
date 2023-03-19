<template>
    <v-sheet :aspect-ratio="16/9"
             :elevation="5" class="fill-height rounded">
        <img v-show="ready"
             :src="`/get/img/${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`"
             alt=""
             height="100%"
             style="object-fit: cover;"
             width="100%"
             @load="ready = true"/>
        <v-row v-if="!ready"
               align="center"
               class="fill-height ma-0"
               justify="center"
        >
            <loading-component/>
        </v-row>
    </v-sheet>
</template>
<script>
import LoadingComponent from "@/Components/LoadingComponent.vue"

export default {
    name: 'imgPlaceholder',
    components: {LoadingComponent},
    props: {
        establishments: {},
        headquarters: {},
        item: {},
        municipality: {},
        src: {}
    },
    data: () => ({
        ready: false
    }),
    watch: {
        src() {
            this.ready = false
        }
    }
}
</script>
