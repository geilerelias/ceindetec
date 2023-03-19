<template>
    <app-layout>
        <bread-crumbs :items="links" name="Abrir Ticket"></bread-crumbs>

        <v-container>
            <v-col class="mx-auto col-md-10 cols-12">
                <v-form @submit.prevent="save()">
                    <v-card>
                        <v-card-text>

                            <v-row>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field :value="$page.props.user.name"
                                                  disabled
                                                  label="Nombre"
                                                  outlined
                                                  readonly/>
                                </v-col>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field :value="$page.props.user.email"
                                                  disabled
                                                  label="Dirección de email"
                                                  outlined
                                                  readonly/>
                                </v-col>
                                <v-col class="col-sm-12 col-md-12">
                                    <v-text-field v-model="form.title"
                                                  :error-messages="form.errors.title"
                                                  label="Titulo"
                                                  outlined
                                                  @blur="form.clearErrors('title')">

                                    </v-text-field>
                                </v-col>

                                <v-col class="col-sm-12 col-md-6">
                                    <v-autocomplete v-model="form.category_id"
                                                    :error-messages="form.errors.category_id"
                                                    :items="categories"
                                                    item-text="name"
                                                    item-value="id"
                                                    label="Categoría"
                                                    outlined
                                                    @blur="form.clearErrors('category_id')">
                                    </v-autocomplete>
                                </v-col>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-autocomplete v-model="form.priority"
                                                    :error-messages="form.errors.priority"
                                                    :items="['Alta', 'Media', 'Baja']"
                                                    label="Prioridad"
                                                    outlined
                                                    @blur="form.clearErrors('priority')">
                                    </v-autocomplete>

                                </v-col>
                                <v-col class="col-sm-12 col-md-12">
                                    <v-input label="Mensaje">
                                    </v-input>
                                    <vue-editor
                                        ref="myTextEditor"
                                        v-model="form.message"
                                        :style="form.errors.message?'border:solid 2px red; border-radius: 4px': 'border-radius: 6px'"
                                        class="theme--light v-text-field v-text-field--is-booted v-text-field--enclosed v-text-field--outlined"
                                        outlined
                                        @blur="form.clearErrors('message')"
                                        placeholder="Mensaje del ticket"/>
                                    <v-input :error-messages="form.errors.message">
                                    </v-input>

                                </v-col>

                                <v-col>
                                    <v-file-input
                                        :prepend-icon="null"
                                        :show-size="1000"
                                        color="primary"
                                        counter
                                        label="Adjuntar archivo"
                                        multiple
                                        outlined
                                        placeholder="Select your files"
                                        prepend-inner-icon="mdi-paperclip"
                                    >
                                        <template v-slot:selection="{ index, text }">
                                            <v-chip
                                                v-if="index < 2"
                                                color="secondary"
                                                dark
                                                label
                                                small
                                            >
                                                {{ text }}
                                            </v-chip>

                                            <span
                                                v-else-if="index === 2"
                                                class="text-overline grey--text text--darken-3 mx-2"
                                            >
                                                +{{ files.length - 2 }} File(s)
                                            </span>
                                        </template>
                                    </v-file-input>
                                </v-col>
                            </v-row>

                        </v-card-text>
                        <v-card-actions class="d-flex justify-center align-center ">
                            <v-btn :disabled="form.processing" class="primary" type="submit">Enviar</v-btn>
                            <v-btn class="secondary" @click="regresar()">Cancelar</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-form>
            </v-col>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";
import {VueEditor} from "vue2-editor";


export default {
    name: "CreateTicket",
    components: {BreadCrumbs, AppLayout, VueEditor},
    props: ['categories'],
    data() {
        return {
            form: this.$inertia.form(
                {
                    user_id: '',
                    category_id: '',
                    ticket_id: '',
                    title: '',
                    priority: '',
                    message: '',
                    status: ''
                }
            ),
            links: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: '/dashboard',
                },
                {
                    text: 'Tickets',
                    disabled: false,
                    href: '/dashboard/ticket',
                }, {
                    text: 'Crear Ticket',
                    disabled: true,
                    href: '',
                },
            ],
        }
    },
    methods: {
        regresar() {
            this.$inertia.get('/dashboard/ticket');
        },
        save() {
            this.form.post('/dashboard/ticket', this.form, {
                preserveScroll: true,
                onSuccess: (response) => {
                    console.log(response)
                },
            })
        },
    }
}
</script>

<style scoped>

</style>
