<template>
    <div>
        <div :class="{'d-none':!isStreaming}"
             class="d-flex justify-center align-center mb-2 rounded-lg"
             style="position: relative;min-width: 640px">
            <img v-if="capturada" :src="imagenCapturada" alt="" class="rounded mx-auto elevation-6"/>
            <video ref="video" autoplay class="rounded mx-auto elevation-6" @loadedmetadata="onPlay()"></video>
            <canvas ref="canvas"
                    style="position: absolute; left: 0; right: 0; margin: auto;z-index: 20"></canvas>
        </div>
        <div class="d-flex justify-center align-center justify-space-between mx-auto" style="max-width: 640px">
            <v-btn class="primary " @click="captureImage">Registrar Asistencia</v-btn>
            <v-btn class="secondary " @click="newCaptureImage">Nueva Captura</v-btn>
        </div>

    </div>
</template>

<script>
import * as faceApi from 'face-api.js';

export default {
    data() {
        return {
            videoStream: null,
            imagenCapturada: null,
            capturada: null,
            isStreaming: null,
            intervalo: null
        };
    },
    async mounted() {
        let MODEL_URL = "/models/";
        await faceApi.loadSsdMobilenetv1Model(MODEL_URL);
        await faceApi.loadFaceLandmarkModel(MODEL_URL);
        await faceApi.loadFaceRecognitionModel(MODEL_URL);
        await faceApi.loadFaceExpressionModel(MODEL_URL);
        navigator.mediaDevices.getUserMedia({video: true})
            .then((stream) => {
                const video = this.$refs.video;
                video.srcObject = stream;
                video.play();
                this.videoStream = stream;
            })
            .catch((err) => {
                console.error(err);
            });

        this.intervalo = setInterval(async () => {
            await this.onPlay();
        }, 100);
    },
    methods: {
        async captureImage() {
            const video = this.$refs.video;
            const canvas = this.$refs.canvas;
            const ctx = canvas.getContext('2d');
            const width = video.offsetWidth;
            const height = video.offsetHeight;
            canvas.width = width;
            canvas.height = height;

            ctx.drawImage(video, 0, 0, width, height);


            const imageData = canvas.toDataURL('image/png');

            const savedImage = await faceApi.fetchImage('/images/saved/image1.jpg');
            //const currentImage = await faceApi.fetchImage('/images/saved/image1.jpg');

            const currentImage = await faceApi.fetchImage(imageData);


            const savedDescriptor = await faceApi.computeFaceDescriptor(savedImage);
            console.log('savedDescriptor')

            const currentDescriptor = await faceApi.computeFaceDescriptor(currentImage);

            const distance = faceApi.euclideanDistance(savedDescriptor, currentDescriptor);
            if (distance < 0.0006) {
                console.log('El rostro capturado coincide con la imagen guardada');
            } else {
                console.log('El rostro capturado no coincide con la imagen guardada');
            }
            this.stopVideo()
        },
        async onPlay() {
            const video = this.$refs.video;
            const canvas = this.$refs.canvas;
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

        },

        newCaptureImage() {
            this.capturada = false;
            this.imagenCapturada = '';
            this.startVideo()
            this.clearCanvas()
        },
        async startVideo() {

            let video = this.$refs.video
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
            const video = this.$refs.video;
            clearInterval(this.intervalo);

            const stream = video.srcObject;
            const tracks = stream.getTracks();
            tracks.forEach(function (track) {
                track.stop();
            });
            video.srcObject = null;
            this.isStreaming = false;

            this.clearCanvas()

        },
        clearCanvas() {
            const canvas = this.$refs.canvas;
            canvas.width = 0;
            canvas.height = 0;
            let ctx = canvas.getContext("2d");
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // Código para limpiar el canvas
            ctx.clearRect(0, 0, canvas.width, canvas.height);
        },
    },
    beforeDestroy() {
        if (this.videoStream) {
            this.videoStream.getTracks().forEach((track) => {
                track.stop();
            });
        }
    },
};
</script>
