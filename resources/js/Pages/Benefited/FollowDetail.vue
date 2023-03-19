<template>
    <simple-layout>
        <template v-slot:header>
            <div class="text-right">
                <div class="text-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                    {{
                        headquarters
                    }}
                </div>
                <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                    {{ establishments }}
                </div>
                <div class="text-subtitle-2 white--text font-weight-bold py-0 my-0">
                    {{ municipality }}
                </div>
            </div>
        </template>

        <template v-slot:extension class="d-print-none">
            <v-tabs v-model="tab"
                    align-with-title
                    class="d-print-none"
            >
                <v-tabs-slider color="white"></v-tabs-slider>
                <v-tab
                    v-for="item in records"
                    :key="item.folder"
                >
                    {{ item.folder }}
                </v-tab>
            </v-tabs>
        </template>

        <v-main class="transparent pt-6 bg" style="min-height: 90vh">
            <v-container>
                <v-tabs-items v-model="tab" class="transparent fill-height pa-2" style="min-height: 70vh">
                    <v-tab-item
                        v-for="(item,k) in records"
                        :key="item.folder"
                        class="transparent fill-height"
                    >
                        <v-row>

                            <v-col
                                v-for="(src, h) in item.sub" :key="`${item.folder}${k}${h}`"
                                class="d-flex child-flex"
                                cols="4"
                            >

                                <v-hover
                                    v-slot="{ hover }"
                                    open-delay="200"
                                >
                                    <v-card :elevation="hover ? 16 : 0"
                                            class="ma-0 pa-0 transparent"
                                            color="transparent"
                                            flat
                                            @click="showImage(`/get/img/${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`)">

                                        <img-placeholder :establishments="establishments"
                                                         :headquarters="headquarters"
                                                         :item="item" :municipality="municipality" :src="src"/>

                                    </v-card>
                                </v-hover>
                            </v-col>
                        </v-row>
                    </v-tab-item>
                </v-tabs-items>
            </v-container>
        </v-main>

        <preview-image :close="closePreviewImage" :dialog="dialog" :selectedImage="selectedImage"></preview-image>
    </simple-layout>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import previewImage from "@/Components/PreviewImage.vue";
import ImgPlaceholder from "@/Pages/Benefited/ImgPlaceholder.vue";


export default {
    name: "FollowDetail",
    components: {ImgPlaceholder, SimpleLayout, previewImage},
    props: ["municipality", "establishments", "headquarters"],
    data: () => ({
        tab: null,
        records: [],
        selectedImage: null,
        dialog: false
    }),
    created() {
        let ruta = this.municipality + '/' + this.establishments + '/' + this.headquarters;
        ruta = encodeURIComponent(ruta)
        let url = '/get/src/' + ruta
        axios
            .get(url)
            .then(response => {
                this.records = response.data
                // console.log('this is response in records data ==>', response.data)
            });
    },

    methods: {
        showImage(image) {
            this.selectedImage = image
            this.dialog = true
        },
        closePreviewImage() {
            this.dialog = false;
        },
    }
}
</script>

