<template>
    <app-layout>
        <bread-crumbs :items="links" name="Abrir Ticket"></bread-crumbs>

        <v-container>
            <v-col class="mx-auto col-md-10 cols-12">
                <v-form ref="form" @submit.prevent="save()">
                    <v-card>
                        <v-card-text>
                            <v-row>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field
                                        :value="$page.props.user.name"
                                        disabled
                                        label="Nombre"
                                        outlined
                                        readonly
                                    />
                                </v-col>
                                <v-col class="col-sm-12 col-md-6">
                                    <v-text-field
                                        :value="$page.props.user.email"
                                        disabled
                                        label="Dirección de email"
                                        outlined
                                        readonly
                                    />
                                </v-col>

                                <v-col class="col-12 col-sm-6">
                                    <v-autocomplete
                                        v-model="form.establishment_id"
                                        :disabled="establishments.length < -1"
                                        :error-messages="
                                            form.errors.establishment_id
                                        "
                                        :items="establishments"
                                        :readonly="establishments.length < -1"
                                        item-text="name"
                                        item-value="id"
                                        label="Establecimiento"
                                        outlined
                                        @change="getAllHeadquarters"
                                    >
                                    </v-autocomplete>
                                </v-col>

                                <v-col class="col-12 col-sm-6">
                                    <v-autocomplete
                                        v-model="form.headquarter_id"
                                        :disabled="headquarters.length < -1"
                                        :error-messages="
                                            form.errors.headquarter_id
                                        "
                                        :items="headquarters"
                                        :readonly="
                                            form.establishment_id === null ||
                                            form.establishment_id === ''
                                        "
                                        item-text="name"
                                        item-value="id"
                                        label="Sede"
                                        outlined
                                    >
                                    </v-autocomplete>
                                </v-col>

                                <v-col class="col-sm-12 col-md-5">
                                    <v-autocomplete
                                        v-model.trim="form.line"
                                        :error-messages="form.errors.line"
                                        :items="lines"
                                        item-text="name"
                                        item-value="name"
                                        label="Linea a la cual pertenece la operación"
                                        outlined
                                        @blur="form.clearErrors('line')"
                                    >
                                        <template v-slot:item="data">
                                            <template
                                                v-if="
                                                    typeof data.item !==
                                                    'object'
                                                "
                                            >
                                                <v-list-item-content
                                                    v-text="data.item"
                                                ></v-list-item-content>
                                            </template>
                                            <template v-else>
                                                <v-list-item-avatar>
                                                    <v-icon>
                                                        {{ data.item.icon }}
                                                    </v-icon>
                                                </v-list-item-avatar>
                                                <v-list-item-title
                                                    v-html="data.item.name"
                                                ></v-list-item-title>
                                            </template>
                                        </template>
                                    </v-autocomplete>
                                </v-col>
                                <v-col class="col-sm-12 col-md-4">
                                    <v-autocomplete
                                        v-model="form.category_id"
                                        :disabled="
                                            form.line === '' ||
                                            form.line === null
                                        "
                                        :error-messages="
                                            form.errors.category_id
                                        "
                                        :items="filteredCategories"
                                        item-text="name"
                                        item-value="id"
                                        label="Categoría"
                                        outlined
                                        @blur="form.clearErrors('category_id')"
                                    >
                                    </v-autocomplete>
                                </v-col>

                                <v-col class="col-sm-12 col-md-3">
                                    <v-autocomplete
                                        v-model="form.priority"
                                        :error-messages="form.errors.priority"
                                        :items="priorities"
                                        item-text="name"
                                        item-value="name"
                                        label="Prioridad"
                                        outlined
                                        @blur="form.clearErrors('priority')"
                                    >
                                        <template v-slot:item="data">
                                            <template
                                                v-if="
                                                    typeof data.item !==
                                                    'object'
                                                "
                                            >
                                                <v-list-item-content
                                                    v-text="data.item"
                                                ></v-list-item-content>
                                            </template>
                                            <template v-else>
                                                <v-list-item-avatar>
                                                    <v-icon>
                                                        {{ data.item.icon }}
                                                    </v-icon>
                                                </v-list-item-avatar>
                                                <v-list-item-title
                                                    v-html="data.item.name"
                                                ></v-list-item-title>
                                            </template>
                                        </template>
                                    </v-autocomplete>
                                </v-col>

                                <v-col class="col-sm-12 col-md-12">
                                    <v-text-field
                                        v-model="form.title"
                                        :error-messages="form.errors.title"
                                        label="Titulo"
                                        outlined
                                        @blur="form.clearErrors('title')"
                                    >
                                    </v-text-field>
                                </v-col>

                                <v-col class="col-sm-12 col-md-12">
                                    <v-input label="Mensaje"></v-input>
                                    <vue-editor
                                        ref="myTextEditor"
                                        v-model="form.message"
                                        :style="
                                            form.errors.message
                                                ? 'border:solid 2px red; border-radius: 4px'
                                                : 'border-radius: 6px'
                                        "
                                        class="theme--light v-text-field v-text-field--is-booted v-text-field--enclosed v-text-field--outlined"
                                        outlined
                                        placeholder="Mensaje del ticket"
                                        @blur="form.clearErrors('message')"
                                    />
                                    <v-input
                                        :error-messages="form.errors.message"
                                    >
                                    </v-input>
                                </v-col>

                                <v-col class="col-12 col-sm-12">
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
                                        <template
                                            v-slot:selection="{ index, text }"
                                        >
                                            <v-chip
                                                v-if="index < 2"
                                                color="secondary"
                                                dark
                                                label
                                                small
                                            >
                                                {{ text }}
                                            </v-chip>
                                        </template>
                                    </v-file-input>
                                </v-col>
                            </v-row>
                        </v-card-text>
                        <v-card-actions
                            class="d-flex justify-center align-center"
                        >
                            <v-btn
                                :disabled="form.processing"
                                class="primary"
                                type="submit"
                                >Enviar
                            </v-btn>
                            <v-btn class="secondary" @click="regresar()"
                                >Cancelar
                            </v-btn>
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
import { VueEditor } from "vue2-editor";

export default {
    name: "CreateTicket",
    components: { BreadCrumbs, AppLayout, VueEditor },
    data() {
        return {
            form: this.$inertia.form({
                user_id: "",
                category_id: "",
                title: "",
                priority: "",
                message: "",
                status: "Active",
                resource: "",
                line: "",
                establishment_id: "",
                headquarter_id: "",
            }),
            lines: [
                { name: "Conectividad", icon: "mdi-radio-tower" },
                { name: "Paneles Solares", icon: "mdi-solar-power-variant " },
                { name: "Hidropaneles", icon: "mdi-solar-panel" },
            ],
            links: [
                {
                    text: "Dashboard",
                    disabled: false,
                    href: "/dashboard",
                },
                {
                    text: "Tickets",
                    disabled: false,
                    href: "/dashboard/ticket",
                },
                {
                    text: "Crear Ticket",
                    disabled: true,
                    href: "",
                },
            ],
            establishments: [],
            headquarters: [],
            priorities: [
                { name: "Alta", icon: "mdi-arrow-up-bold" },
                { name: "Media", icon: "mdi-format-vertical-align-center" },
                { name: "Baja", icon: "mdi-arrow-down-bold" },
            ],
            categories: [],
            menu2: null,
        };
    },

    created() {
        axios.get(`/dashboard/establishment/all`).then((response) => {
            //console.log(response.data);
            this.establishments = response.data;
        });

        axios.get(`/dashboard/ticket-category/all`).then((response) => {
            //console.log(response.data);
            this.categories = response.data;
        });

        if (this.editMode === true) {
            this.$nextTick(() => {
                this.form.reset();
                this.form = this.$inertia.form(this.incomeExpense);
                this.getAllHeadquarters();
            });
        }
    },
    computed: {
        filteredCategories() {
            return this.categories.filter(
                (category) => category.line === this.form.line
            );
        },
    },
    methods: {
        regresar() {
            this.$inertia.get("/dashboard/ticket");
        },
        save() {
            this.form.post(route("ticket.store", this.form), {
                onSuccess: (response) => {
                    console.log(response);
                    this.$swal(
                        "Buen trabajo!",
                        response.props.flash.message,
                        "success"
                    );
                    this.reset();
                },
                onError: (errors) => {
                    console.log("errors", errors);
                    let errorsMessage = Object.values(errors).join("<br>");

                    this.$swal({
                        icon: "error",
                        title: "Ups...",
                        html: errorsMessage,
                    });
                },
            });
        },
        reset() {
            this.$refs.form.resetValidation();
            this.$refs.form.reset();
            this.form.reset();
        },
        getAllHeadquarters() {
            let id = this.form.establishment_id;
            console.log(this.form.establishment_id);
            console.log(id);
            if (id !== null) {
                axios
                    .get(`/dashboard/establishment/${id}/headquarters`)
                    .then((response) => {
                        this.headquarters = response.data;
                    })
                    .catch((error) => {
                        console.log(error);
                    });
            }
        },
    },
};
</script>

<style scoped></style>
