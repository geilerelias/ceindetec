<template>
    <div>
        <h1>Image Comparator from File</h1>
        <v-divider class="mb-3"></v-divider>
        <div
            v-if="imagePreview"
            class="text-center d-flex justify-center align-center mb-2"
            style="position: relative"
        >

            <img ref="image" :src="imagePreview" alt="" class="mx-auto"/>
            <canvas
                id="mi-canvas"
                ref="canvas"
                style="position: absolute; left: 0; right: 0; margin: auto"
            ></canvas>
        </div>


        <form @submit.prevent="submit">
            <v-file-input :prepend-icon="null" accept="image/*" full-width label="select image"
                          outlined
                          prepend-inner-icon="mdi-paperclip"
                          type="file"
                          @change="upload">
                <template v-slot:selection="{ text }">
                    <v-chip
                        color="primary"
                        label
                        small
                    >
                        {{ text }}
                    </v-chip>
                </template>
            </v-file-input>
            <v-text-field v-model="email" label="Email" outlined placeholder="Email" type="text"/>
            <v-text-field v-model="password" label="Password" outlined placeholder="Password" type="password"/>
            <v-btn class="mr-1 primary" type="submit">Login</v-btn>
            <v-btn class="secondary" type="button" @click="detectFaces()">Detectar</v-btn>
        </form>
    </div>
</template>

<script>
import * as faceApi from "face-api.js";

export default {
    data() {
        return {
            labels: [],
            email: "",
            password: "",
            faceToken: "",
            imagePreview: "",
        };
    },
    async mounted() {
        let MODEL_URL = "/models/";
        await faceApi.loadSsdMobilenetv1Model(MODEL_URL);
        await faceApi.loadFaceLandmarkModel(MODEL_URL);
        await faceApi.loadFaceRecognitionModel(MODEL_URL);
        await faceApi.loadFaceExpressionModel(MODEL_URL);

        await faceApi.nets.tinyFaceDetector.loadFromUri(MODEL_URL)
        await faceApi.nets.faceLandmark68Net.loadFromUri(MODEL_URL)
        await faceApi.nets.faceRecognitionNet.loadFromUri(MODEL_URL)


        /* this.image = document.getElementById('image');
             this.canvas = document.getElementById('canvas');*/
        //this.video.srcObject = navigator.mediaDevices.getUserMedia({video: {}})
    },
    methods: {
        async upload(event) {

            const file = event;
            this.previewImage(file);

            const img = await faceApi.bufferToImage(file);
            const detections = await faceApi
                .detectSingleFace(img)
                .withFaceLandmarks()
                .withFaceDescriptor();

            if (detections) {
                this.faceToken = detections.descriptor.join(",");
                console.log("Face detected");
            } else {
                this.faceToken = "";
                console.log("Face not detected");
            }
        },

        clearCanvas() {
            try {
                const canvas = document.getElementById("mi-canvas");
                const ctx = canvas.getContext("2d");
                ctx.fillRect(0, 0, canvas.width, canvas.height);

                // Código para limpiar el canvas
                ctx.clearRect(0, 0, canvas.width, canvas.height);
            } catch (e) {

            }

        },
        previewImage(file) {
            const reader = new FileReader();

            reader.onload = () => {
                this.imagePreview = reader.result;
                this.clearCanvas();
            };

            reader.readAsDataURL(file);
        },

        async detectFaces() {
            const image = this.$refs.image;
            const canvas = this.$refs.canvas;

            /*const image = this.$refs.inputVideo;
            const canvas = this.$refs.canvasVideo;*/

            console.log(image);

            const labeledFaceDescriptors = await Promise.all(
                this.labels.map(async label => {
                    const imgUrl = `/img/${label}.jpg`
                    const img = await faceApi.fetchImage(imgUrl)
                    const detections = await faceApi.detectSingleFace(img).withFaceLandmarks().withFaceDescriptor()
                    return new faceApi.LabeledFaceDescriptors(label, [detections.descriptor])
                })
            )
            const faceMatcher = new faceApi.FaceMatcher(labeledFaceDescriptors, 0.6)


            let fullFaceDescriptions = await faceApi
                .detectAllFaces(image, new faceApi.TinyFaceDetectorOptions())
                .withFaceLandmarks()
                .withFaceDescriptors()
                .withFaceExpressions();

            const dims = faceApi.matchDimensions(canvas, image, true);
            const resizeResult = faceApi.resizeResults(fullFaceDescriptions, dims);

            faceApi.draw.drawDetections(canvas, resizeResult);
            faceApi.draw.drawFaceLandmarks(canvas, resizeResult);
            faceApi.draw.drawFaceExpressions(canvas, resizeResult, 0.05);
        },

        async submit() {
            const response = {
                email: this.email,
                face_token: this.faceToken,
            };
            console.log(response)
            if (response.status === 200) {

                console.log("Login successfull");
            } else {
                console.log("Login failed");
            }
        },

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
