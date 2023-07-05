<template>
    <app-layout>
        <bread-crumbs :items="links" :name="modeName"></bread-crumbs>

        <v-container>
            <v-col class="mx-auto col-md-10 cols-12">
                <v-form
                    ref="form"
                    enctype="multipart/form-data"
                    @submit.prevent="submitForm()"
                >
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
                                        @blur="
                                            form.clearErrors('establishment_id')
                                        "
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
                                        @blur="
                                            form.clearErrors('headquarter_id')
                                        "
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

                                <v-col class="col-12 col-sm-4">
                                    <v-menu
                                        v-model="menu2"
                                        :close-on-content-click="false"
                                        :nudge-right="40"
                                        min-width="auto"
                                        offset-y
                                        transition="scale-transition"
                                    >
                                        <template
                                            v-slot:activator="{ on, attrs }"
                                        >
                                            <v-text-field
                                                v-model="form.published_at"
                                                :error-messages="
                                                    form.errors.published_at
                                                "
                                                label="Fecha de apertura"
                                                outlined
                                                prepend-inner-icon="mdi-calendar"
                                                readonly
                                                v-bind="attrs"
                                                @blur="
                                                    form.clearErrors(
                                                        'published_at'
                                                    )
                                                "
                                                v-on="on"
                                            ></v-text-field>
                                        </template>

                                        <v-date-picker
                                            v-model="form.published_at"
                                            label="Fecha"
                                            locale="es-Co"
                                            outlined
                                            required
                                            @input="menu2 = false"
                                        ></v-date-picker>
                                    </v-menu>
                                </v-col>
                                <v-col class="col-12 col-sm-8">
                                    <v-file-input
                                        v-model="form.resources"
                                        :prepend-icon="null"
                                        :show-size="1000"
                                        color="primary"
                                        counter
                                        label="Adjuntar archivos"
                                        multiple
                                        outlined
                                        prepend-inner-icon="mdi-paperclip"
                                    >
                                        <template
                                            v-slot:selection="{ index, text }"
                                        >
                                            <v-chip
                                                color="secondary"
                                                dark
                                                label
                                                small
                                            >
                                                {{ text }}
                                            </v-chip>
                                        </template>
                                    </v-file-input>
                                    {{ form.resources }}
                                </v-col>
                            </v-row>
                        </v-card-text>
                        <v-card-actions
                            class="d-flex justify-center align-center"
                        >
                            <v-btn
                                :loading="form.processing"
                                color="primary"
                                type="submit"
                            >
                                {{ isEdit ? "Actualizar" : "Crear" }}
                            </v-btn>

                            <v-btn class="secondary" @click="regresar()">
                                Cancelar
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
    props: {
        ticket: Object,
        editMode: { type: Boolean, default: false },
    },
    data() {
        return {
            form: this.$inertia.form({
                user_id: "",
                category_id: "",
                title: "",
                priority: "",
                message: "",
                status: "Open",
                resource: "",
                line: "",
                resources: [],
                establishment_id: "",
                headquarter_id: "",
                published_at: "",
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
                    text: this.modeName,
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
            modeName: "",
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
                this.form = this.$inertia.form(this.ticket);
                this.getAllHeadquarters();
            });
        }

        this.modeName = `${
            this.isEdit !== false ? "Modificar " : "Abrir"
        } Ticket`;
    },
    watch: {
        modeName(newValue) {
            this.links[2].text = newValue;
        },
    },
    computed: {
        filteredCategories() {
            return this.categories.filter(
                (category) => category.line === this.form.line
            );
        },

        isEdit() {
            return this.editMode;
        },
        /* modeName() {
             return `${this.isEdit !== false ? "Modificar " : "Abrir"} Ticket`;
         },*/
    },
    methods: {
        regresar() {
            this.$inertia.get("/dashboard/ticket");
        },
        submitForm() {
            if (this.isEdit) this.edit();
            else this.save();
        },
        save: function () {
            try {
                this.form.post("/dashboard/ticket", {
                    forceFormData: true,
                    onSuccess: (response) => {
                        console.log(response);
                        this.$swal(
                            "Buen trabajo",
                            response.props.flash.message,
                            "success"
                        );
                        this.$inertia.visit(route("ticket.index"));
                    },
                    onError: (error) => {
                        console.log("errors", error);
                        let errorsMessage = Object.values(error).join("<br>");

                        this.$swal({
                            icon: "error",
                            title: "Ups...",
                            html: errorsMessage,
                        });
                    },
                });
            } catch (e) {
                console.log(e);
            }
        },
        edit: function () {
            try {
                // console.log(this.form.file_path);
                //console.log(this.form);
                /*  let formData = new FormData();
                      formData.append("description", this.form.description);
                      formData.append("amount", this.form.amount);
                      formData.append("type", this.form.type);
                      formData.append("date", this.form.date);
                      formData.append("file_path", this.form.file_path);*/

                this.form._method = "PUT";
                console.log("hasta aqui");
                this.$inertia.post(
                    `/dashboard/ticket/${this.form.id}`,
                    this.form,
                    {
                        forceFormData: true,
                        onSuccess: (page) => {
                            this.$swal(
                                "Buen trabajo!",
                                page.props.flash.message,
                                "success"
                            );
                        },
                        onError: (errors) => {
                            this.form = this.form.setError(errors);
                            let errorsMessage =
                                Object.values(errors).join("<br>");

                            this.$swal({
                                icon: "error",
                                title: "Ups...",
                                html: errorsMessage,
                            });
                        },
                    }
                );
            } catch (e) {
                console.log(e);
            }
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
