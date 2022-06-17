<template>
    <div class="text-center">
        <v-overlay :value="value" :opacity="opacity" :color="color">
            <div class="d-flex justify-center flex-column mb-6 text-center">
                <div class="spinner mx-auto mb-4">
                    <div class="rect1"></div>
                    <div class="rect2"></div>
                    <div class="rect3"></div>
                    <div class="rect4"></div>
                    <div class="rect5"></div>
                </div>
                <p class="white--text">
                    {{ text }}
                </p>
            </div>
        </v-overlay>
    </div>
</template>

<script>
export default {
    name: "SpinnerComponent",
    props: {
        value: {
            type: Boolean,
            default: false,
            required: true
        },
        opacity: {
            type: Number,
            default: 0.9
        },
        color: {
            type: String,
            default: 'primary'
        },
        text: {
            type: String,
            default: 'Un momento por favor, estamos procesando su solicitud'
        }

    }
}
</script>

<style>
.spinner {
    width: 150px;
    height: 150px;
    text-align: center;
    font-size: 10px;
}

/*#1acc6a*/
/*#fedc2c*/
/*#05bae5*/
.spinner > div {
    background-color: #ffffff;
    height: 100%;
    width: 6px;
    display: inline-block;
    border-radius: 50px;
    margin-left: 2px;
    margin-right: 2px;
    -webkit-animation: sk-stretchdelay 1.2s infinite ease-in-out;
    animation: sk-stretchdelay 1.2s infinite ease-in-out;
}

.spinner .rect2 {
    -webkit-animation-delay: -1.1s;
    animation-delay: -1.1s;
}

.spinner .rect3 {
    -webkit-animation-delay: -1.0s;
    animation-delay: -1.0s;
}

.spinner .rect4 {
    -webkit-animation-delay: -0.9s;
    animation-delay: -0.9s;
}

.spinner .rect5 {
    -webkit-animation-delay: -0.8s;
    animation-delay: -0.8s;
}

@-webkit-keyframes sk-stretchdelay {
    0%, 40%, 100% {
        -webkit-transform: scaleY(0.4)
    }
    20% {
        -webkit-transform: scaleY(1.0)
    }
}

@keyframes sk-stretchdelay {
    0%, 40%, 100% {
        transform: scaleY(0.4);
        -webkit-transform: scaleY(0.4);
    }
    20% {
        transform: scaleY(1.0);
        -webkit-transform: scaleY(1.0);
    }
}
</style>
