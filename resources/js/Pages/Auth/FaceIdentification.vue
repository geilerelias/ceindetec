<template>

    <simple-layout class="Authentication" :extension="false">
        <template #header>
            <div class="text-h5 white--text font-weight-bold text-uppercase text-center justify-center">
                Reconocimiento facial
            </div>
        </template>
        <h1>Face recognition with FaceIO</h1>
        <div class='container'>
            <div @click='login' class='btn' v-if="user === ''">Sign in</div>
            <div @click='authenticateUser' class='btn' v-if="user === ''">authenticateUser</div>
            <div class='btn' @click='register' v-if="user === ''">Register</div>
            <div class='btn' @click='logout' v-if="user !== ''">Log out</div>
        </div>
        <div id="faceio-modal"></div>
    </simple-layout>
</template>


<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";

const faceio = new faceIO("fioa2d9a");
window.faceio = faceio

export default {
    name: "FaceIdentification",
    components: {SimpleLayout},
    data() {
        return {
            user: ''
        }
    },
    methods: {
        login() {
            window.faceio.authenticate({
                "locale": "auto" // Default user locale
            }).then(userData => {
                console.log("Success, user identified")
                console.log("Linked facial Id: " + userData.facialId)
                console.log("Payload: " + JSON.stringify(userData.payload)) // {"whoami": 123456, "email": "john.doe@example.com"} from the enroll() example above
                this.user = userData.payload.whoami
            }).catch(errCode => {
                console.log(errCode)
            })
        },
        authenticateUser() {
            faceio.authenticate({
                "locale": "auto" // Default user locale
            }).then(userData => {
                console.log("Success, user identified")
                // Grab the facial ID linked to this particular user which will be same
                // for each of his successful future authentication. FACEIO recommend
                // that your rely on this Facial ID if you plan to uniquely identify
                // all enrolled users on your backend for example.
                console.log("Linked facial Id: " + userData.facialId)
                // Grab the arbitrary data you have already linked (if any) to this particular user
                // during his enrollment via the payload parameter of the enroll() method.
                console.log("Payload: " + JSON.stringify(userData.payload)) // {"whoami": 123456, "email": "john.doe@example.com"} from the enroll() example above
            }).catch(errCode => {
                handleError(errCode)
            })
        },
        register() {
            window.faceio.enroll({
                "locale": "auto",
                "payload": {
                    "whoami": 123456,
                    "email": "john.doe@example.com"
                }
            }).then(userInfo => {
                // User Successfully Enrolled!
                alert(
                    `User Successfully Enrolled! Details:
           Unique Facial ID: ${userInfo.facialId}
           Enrollment Date: ${userInfo.timestamp}
           Gender: ${userInfo.details.gender}
           Age Approximation: ${userInfo.details.age}`
                );
                console.log(userInfo);
                // handle success, save the facial ID (userInfo.facialId), redirect to the dashboard...
            }).catch(errCode => {
                // Something went wrong during enrollment, log the failure
                console.log(errCode);
            })
        },
        logout() {
            this.user = ''
        }
    }
}
</script>

<style scoped>
.container {
    width: 90%;
    margin: 20px auto;
    display: flex;
    justify-content: space-around;
    align-items: center;
    padding: 1em;
}

.btn {
    border: 1px solid black;
    border-radius: 5px;
    padding: 1em 2em;
}

.btn:hover {
    background: #000;
    color: #fff
}
</style>
