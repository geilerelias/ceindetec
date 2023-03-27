<template>
    <v-sheet :aspect-ratio="16/9"
             :elevation="5" class="fill-height rounded">
        <img v-show="ready"

             :src="`${path}${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`"
             alt=""
             class="rounded"
             height="100%"
             style="object-fit: cover; aspect-ratio: 16 / 9;"
             width="100%"
             @load="ready = true"/>
        <v-img
            class="mx-auto"
            height="100%"
            :lazy-src="infantesGuajirosLazy"
            max-width="500"
            src="https://bad.src/not/valid"
            v-if="!ready"

        >
            <v-row
                align="center"
                class="fill-height mx-auto "
                justify="center"
            >
                <loading-component/>
            </v-row>
        </v-img>
    </v-sheet>
</template>
<script>
import LoadingComponent from "@/Components/LoadingComponent.vue"
import infantesGuajirosLazy from '../../../images/infantes_guajiros_lazy.jpg'

export default {
    name: 'imgPlaceholder',
    components: {LoadingComponent},
    props: {
        establishments: {},
        headquarters: {},
        item: {},
        municipality: {},
        src: {},
        path: {type: String, default: null, required: true}
    },
    data: () => ({
        ready: false,
        infantesGuajirosLazy
    }),
    watch: {
        src() {
            this.ready = false
        }
    }
}
</script>
