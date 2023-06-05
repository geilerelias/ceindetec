<template>
    <div>
        <h1 class="text-uppercase">Face Recognition from webcam</h1>
        <v-divider class="my-2"></v-divider>
        <div v-if="!isStreaming">
        </div>
        <div :class="{'d-none':!isStreaming}"
             class="d-flex justify-center align-center mb-2 rounded-lg"
             style="position: relative;min-width: 640px">

            <video id="inputVideo" ref="inputVideo" autoplay class="rounded mx-auto elevation-6" muted playsinline
                   style="z-index: 1;"
                   @loadedmetadata="onPlay()"></video>

            <canvas id="canvasVideo" ref="canvasVideo"
                    style="position: absolute; left: 0; right: 0; margin: auto;z-index: 20"></canvas>

        </div>
        <v-row>
            <v-col class="d-flex justify-center align-center justify-around">
                <v-btn :disabled="isStreaming" class="primary mr-2" @click="startVideo">Start Video</v-btn>
                <v-btn :disabled="!isStreaming" class="secondary " @click="stopVideo">Stop Video</v-btn>
            </v-col>
        </v-row>
    </div>
</template>

<script>
import * as faceApi from "face-api.js";
import SvgIcon from '@jamescoyle/vue-icon';
import {mdiCamera} from '@mdi/js';

export default {
    components: {
        SvgIcon
    },
    data() {
        return {
            isStreaming: false,
            path: mdiCamera,
        };
    },
    async mounted() {
        let MODEL_URL = "/models/";
        await faceApi.loadSsdMobilenetv1Model(MODEL_URL);
        await faceApi.loadFaceLandmarkModel(MODEL_URL);
        await faceApi.loadFaceRecognitionModel(MODEL_URL);
        await faceApi.loadFaceExpressionModel(MODEL_URL);

        /* this.image = document.getElementById('image');
             this.canvas = document.getElementById('canvas');*/
        //this.video.srcObject = navigator.mediaDevices.getUserMedia({video: {}})
    },
    methods: {
        async onPlay() {
            const video = this.$refs.inputVideo;
            const canvas = this.$refs.canvasVideo;
            let fullFaceDescriptions = await faceApi
                .detectAllFaces(video)
                .withFaceLandmarks()
                .withFaceDescriptors()
                .withFaceExpressions();

            const dims = faceApi.matchDimensions(canvas, video, true);
            const resizeResult = faceApi.resizeResults(fullFaceDescriptions, dims);

            faceApi.draw.drawDetections(canvas, resizeResult);
            faceApi.draw.drawFaceLandmarks(canvas, resizeResult);
            faceApi.draw.drawFaceExpressions(canvas, resizeResult, 0.05);

            setTimeout(() => this.onPlay(), 100)
        },
        async startVideo() {
            let video = this.$refs.inputVideo
            if (navigator.mediaDevices.getUserMedia) {
                try {
                    this.isStreaming = true;
                    video.srcObject = await navigator.mediaDevices.getUserMedia({video: true});
                } catch (e) {
                    console.log(e);
                    this.isStreaming = false;
                }
            }
        },
        stopVideo() {
            const video = this.$refs.inputVideo;
            const stream = video.srcObject;
            const tracks = stream.getTracks();
            tracks.forEach(function (track) {
                track.stop();
            });
            video.srcObject = null;
            this.isStreaming = false;
        }

    },
};
</script>

<style scoped>
#canvas {
    position: relative;
}

#mi-canvas {
    clip-path: circle(50%);
}
</style>
