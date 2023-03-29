<template>
    <v-sheet :aspect-ratio="aspectRatio"
             :elevation="5" class="rounded justify-center align-center" jus>
        <v-responsive :aspect-ratio="aspectRatio">
            <img v-show="ready"
                 ref="imagen"
                 :src="`${path}${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`"
                 alt=""
                 class="rounded"
                 height="100%"
                 style="object-fit: cover;"
                 :style="{ aspectRatio: aspectRatio }"
                 width="100%"
                 @load="ready = true"/>
        </v-responsive>
        <v-img
            v-if="!ready"
            :lazy-src="infantesGuajirosLazy"
            class="mx-auto"
            height="100%"
            max-width="500"
            src="https://bad.src/not/valid"

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
    mounted() {
        this.actualizarAspectRatio();
    },
    watch: {
        imagenSrc() {
            this.actualizarAspectRatio();
        },
        src() {
            this.ready = false
        }
    },
    data: () => ({
        ready: false,
        infantesGuajirosLazy,
        isLandscape: null,
        aspectRatio: null
    }),
    methods: {
        actualizarAspectRatio() {
            const imagen = this.$refs.imagen;
            const ancho = imagen.naturalWidth;
            const alto = imagen.naturalHeight;
            this.aspectRatio = ancho / alto;
        },
    },

}
</script>
