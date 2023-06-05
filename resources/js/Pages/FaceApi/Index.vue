<template>
    <simple-layout title="faceApi" :extension="false" exte id="inspire">
        <template v-slot:header>
            <div class="text-right">
                <div class="text-h6 white--text font-weight-bold text-uppercase py-0 my-0">
                    Registro de asistencia
                </div>
                <div class="text-subtitle-1 secondary--text font-weight-bold py-0 my-0">
                    Toma de asistencia al sistema mediante el reconocimiento facial
                </div>
            </div>
        </template>

        <v-main class="grey lighten-3 fill-height">
            <v-container class="">
                <face-detection-component></face-detection-component>
            </v-container>
        </v-main>
    </simple-layout>
</template>


<script>
// import FaceRecognitionFromWebcam from './FaceRecognitionFromWebcam.vue'
// import FaceRecognitionFromFile from './FaceRecognitionFromFile.vue'
//import FaceDetectionComponent from './FaceRecognitionComparingFromFile.vue'
import FaceDetectionComponent from './FaceRecognitionComparingFromVideo.vue'

import Logo from "@/Components/Logo.vue";
import {mapState} from "vuex";
import SimpleLayout from "@/Layouts/SimpleLayout.vue";

export default {
    components: {
        SimpleLayout,
        Logo,
        FaceDetectionComponent
    },
    computed: {
        ...mapState(["links"]),

    },
    data() {
        return {
            tab: null,
            items: [
                {
                    title: 'Imagen from File',
                    component: FaceDetectionComponent
                },
                {
                    title: 'Video from Webcam',
                    component: FaceDetectionComponent
                },
                {
                    title: 'Comparing from File',
                    component: FaceDetectionComponent
                },
                {
                    title: 'Comparing from video',
                    component: FaceDetectionComponent
                },
            ],
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            model: null
        }
    }
}
</script>
