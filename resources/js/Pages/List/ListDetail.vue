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

        <template v-slot:extension>
            <v-tabs
                v-model="tab"
                align-with-title
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

        <v-main class="transparent pt-6 bg">
            <v-container>
                <v-tabs-items class="transparent fill-height pa-2" style="min-height: 70vh" v-model="tab">
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
                                    <v-card color="transparent"
                                            :elevation="hover ? 16 : 0"
                                            flat
                                            class="ma-0 pa-0 transparent"
                                            @click="showImage(`/get/img/${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`)">
                                        <v-img
                                            :src="`/get/img/${encodeURIComponent(municipality+'/'+establishments+'/'+headquarters)}/${item.folder}/${src}`"
                                            :aspect-ratio="16/9"
                                            :elevation="5"
                                            class="grey lighten-2 rounded "
                                        >
                                            <template v-slot:placeholder>
                                                <v-row
                                                    class="fill-height ma-0"
                                                    align="center"
                                                    justify="center"
                                                >
                                                    <loading-component/>
                                                </v-row>
                                            </template>
                                        </v-img>
                                    </v-card>
                                </v-hover>
                            </v-col>
                        </v-row>
                    </v-tab-item>
                </v-tabs-items>
            </v-container>
        </v-main>

        <preview-image :dialog="dialog" :selectedImage="selectedImage" :close="closePreviewImage"></preview-image>
    </simple-layout>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import loadingComponent from "@/Components/LoadingComponent.vue";
import previewImage from "@/Components/PreviewImage";


export default {
    name: "ListDetail",
    components: {SimpleLayout, loadingComponent, previewImage},
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
                console.log('this is response in records data ==>', response.data)
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

<style scoped>

</style>
