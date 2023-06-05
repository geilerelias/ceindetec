<template>
    <simple-layout :elements="false" :extension="false" title="example ">
        <template #header>
            this is a example inertia form
        </template>
        <v-container>
            <v-card>
                <v-card-text>
                    <form @submit.prevent="form.post('/login')">
                        <!-- email -->
                        <v-text-field v-model="form.email" outlined type="text"></v-text-field>
                        <div v-if="form.errors.email">{{ form.errors.email }}</div>
                        <!-- password -->
                        <v-text-field v-model="form.password" outlined type="password"></v-text-field>
                        <div v-if="form.errors.password">{{ form.errors.password }}</div>
                        <!-- remember me -->
                        <v-checkbox
                            v-model="form.remember"
                            label="Remember Me"
                        ></v-checkbox>
                        <!-- submit -->
                        <button :disabled="form.processing" type="submit">Login</button>
                    </form>
                </v-card-text>
            </v-card>
        </v-container>
    </simple-layout>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";

export default {
    name: "Example",
    components: {SimpleLayout},
    data: () => ({
        saving: false,
        form: this.$inertia.form({
            "email": null,
            "password": null,
            "remember": false,
        }),
    }),


}
</script>

<style scoped>

</style>
