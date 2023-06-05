<template>
    <app-layout>
        <bread-crumbs :items="items" name="Categoría de tickets"></bread-crumbs>
        <v-container class="py-12">
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%">
                        <v-card-text class="">
                            <v-row class="no-gutters">
                                <div
                                    class="d-flex justify-space-between justify-md-start col-md-6 col-12"
                                >
                                    <v-btn
                                        class="mr-3 success"
                                        @click="isOpen = !isOpen"
                                    >
                                        <v-icon class="notranslate mr-2">
                                            mdi-plus
                                        </v-icon>
                                        Crear
                                    </v-btn>
                                </div>

                                <v-spacer></v-spacer>

                                <div
                                    class="mx-auto mt-4 mt-md-0"
                                    style="max-width: 250px"
                                >
                                    <v-text-field
                                        v-model="search"
                                        append-icon="mdi-magnify"
                                        dense
                                        enclosed
                                        hide-details
                                        outlined
                                        placeholder="Consultar"
                                    ></v-text-field>
                                </div>
                            </v-row>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%">
                        <v-data-table
                            :headers="headers"
                            :items="data"
                            :search="search"
                            class="elevation-1"
                            sort-by="calories"
                        >
                            <template v-slot:item.line="{ item }">
                                <v-icon class="mr-1">
                                    {{ findLineByName(item.line)?.icon }}
                                </v-icon>
                                <span
                                    v-html="findLineByName(item.line)?.name"
                                ></span>
                            </template>
                            <template v-slot:item.actions="{ item }">
                                <v-icon class="mr-2" small @click="edit(item)">
                                    mdi-pencil-outline
                                </v-icon>
                                <v-icon small @click="deleteRow(item)">
                                    mdi-delete-outline
                                </v-icon>
                            </template>
                            <template v-slot:no-data>
                                <v-btn color="primary" @click="initialize">
                                    Recargar
                                </v-btn>
                            </template>
                        </v-data-table>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>

        <v-dialog v-model="isOpen" max-width="800" persistent>
            <v-card class="pa-6">
                <v-card-title class="text-h5">
                    <v-icon :left="true">{{ icon }}</v-icon>
                    {{ title }}
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text class="mt-3">
                    <v-form
                        ref="form"
                        @submit.prevent="route('ticket-category.store')"
                    >
                        <v-text-field
                            v-model="form.name"
                            :counter="50"
                            :error-messages="form.errors.name"
                            :rules="nameRules"
                            label="Nombre"
                            outlined
                            required
                            @blur="form.clearErrors('name')"
                        ></v-text-field>

                        <v-autocomplete
                            v-model.trim="form.line"
                            :error-messages="form.errors.line"
                            :items="lines"
                            :rules="lineRules"
                            item-text="name"
                            item-value="name"
                            label="Linea a la cual pertenece la categoría "
                            outlined
                            @blur="form.clearErrors('line')"
                        >
                            <template v-slot:item="data">
                                <template v-if="typeof data.item !== 'object'">
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

                        <v-textarea
                            v-model="form.description"
                            :error-messages="form.errors.description"
                            :rules="descriptionRules"
                            label="Descripción"
                            outlined
                            required
                            @blur="form.clearErrors('description')"
                        ></v-textarea>
                        <div class="d-flex justify-end">
                            <v-btn
                                v-show="!isEditMode"
                                :disabled="form.processing"
                                class="primary mx-1"
                                dark
                                type="button"
                                wire:click.prevent="store()"
                                @click="save(form)"
                            >
                                Guardar
                            </v-btn>

                            <v-btn
                                v-show="isEditMode"
                                class="primary x-1"
                                dark
                                type="button"
                                wire:click.prevent="store()"
                                @click="update(form)"
                            >
                                Actualizar
                            </v-btn>

                            <v-btn
                                class="secondary mx-1"
                                dark
                                type="button"
                                @click="closeModal()"
                            >
                                Cancelar
                            </v-btn>
                        </div>
                        <progress
                            v-if="form.progress"
                            :value="form.progress.percentage"
                            max="100"
                        >
                            {{ form.progress.percentage }}%
                        </progress>
                    </v-form>
                </v-card-text>
            </v-card>
        </v-dialog>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
    },
    props: ["data", "errors"],
    data() {
        return {
            isEditMode: false,
            isOpen: false,
            search: "",
            form: this.$inertia.form({
                name: null,
                line: null,
                description: null,
            }),
            headers: [
                {
                    text: "Id",
                    align: "start",
                    sortable: false,
                    value: "id",
                },
                { text: "Nombre", value: "name" },
                { text: "Linea", value: "line" },
                { text: "Descripción", value: "description" },
                { text: "Acciones", value: "actions", sortable: false },
            ],
            editedIndex: -1,
            editedItem: {
                name: "",
            },
            defaultItem: {
                name: "",
            },
            lines: [
                { name: "Conectividad", icon: "mdi-radio-tower" },
                { name: "Paneles Solares", icon: "mdi-solar-power-variant " },
                { name: "Hidropaneles", icon: "mdi-solar-panel" },
            ],
            items: [
                {
                    text: "Dashboard",
                    disabled: false,
                    href: "/dashboard",
                },
                {
                    text: "Categoría de tickets",
                    disabled: true,
                    href: "breadcrumbs_link_1",
                },
            ],
        };
    },
    computed: {
        nameRules() {
            return [
                (v) => !!v || "El nombre es requerido",
                (v) =>
                    (v && v.length <= 50) ||
                    "El nombre no puede tener más de 50 caracteres",
            ];
        },
        lineRules() {
            return [(v) => !!v || "La linea es requerida"];
        },
        descriptionRules() {
            return [(v) => !!v || "La descripción es requerida"];
        },

        title() {
            return this.isEditMode
                ? "Editar categoría de ticket"
                : "Crear nueva categoría de ticket";
        },
        icon() {
            return this.isEditMode ? "mdi-table-edit" : "mdi-table-plus";
        },
        buttonLabel() {
            return this.isEditMode ? "Guardar cambios" : "Crear registro";
        },
    },
    methods: {
        valid: async function () {
            return await this.$refs.form.validate((valid) => {
                return !!valid;
            });
        },
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.reset();
            this.isEditMode = false;
        },
        reset: function () {
            this.$refs.form.resetValidation();
            this.$refs.form.reset();
            this.form = this.$inertia.form({
                name: null,
                description: null,
            });
        },
        save: async function (data) {
            console.log(await this.valid());
            if (await this.valid()) {
                this.form.post(route("ticket-category.store", data), {
                    onSuccess: (page) => {
                        console.log(page);
                        this.$swal(
                            "Buen trabajo!",
                            page.props.flash.message,
                            "success"
                        );
                        this.reset();
                        this.closeModal();
                        this.isEditMode = false;
                        // Hacer algo después de que se envíe el formulario correctamente
                    },
                    onError: (errors) => {
                        console.log("Error al enviar el formulario.");
                        console.log(errors);
                        let errorsMessage = Object.values(errors).join("<br>");

                        this.$swal({
                            icon: "error",
                            title: "Ups...",
                            html: errorsMessage,
                        });
                        // Hacer algo después de que se produzca un error al enviar el formulario
                    },
                });
            }
        },
        edit: function (item) {
            this.form = this.$inertia.form(item);
            this.isEditMode = true;
            this.openModal();
        },
        update: function (data) {
            console.log(data.id);
            data._method = "PUT";
            this.$inertia.post(route("ticket-category.update", data.id), data, {
                onSuccess: (page) => {
                    this.$swal(
                        "Buen trabajo!",
                        page.props.flash.message,
                        "success"
                    );
                    this.reset();
                    this.closeModal();
                },
                onError: (errors) => {
                    this.form = this.form.setError(errors);
                    let errorsMessage = Object.values(errors).join("<br>");

                    this.$swal({
                        icon: "error",
                        title: "Ups...",
                        html: errorsMessage,
                    });
                },
            });
        },
        deleteRow: function (item) {
            item._method = "DELETE";
            this.$swal({
                title: "¿Está seguro? ",
                text: "al eliminar este elemento No podrás revertir esta acción.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, Eliminarlo!",
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post(
                        this.route("ticket-category.destroy", item.id),
                        item,
                        {
                            onStart: (visit) => {
                                this.loadingDeleteItem = true;
                            },
                            onSuccess: (page) => {
                                console.log("estamos eliminando la info", page);
                                this.$swal({
                                    icon: `${
                                        page.props.errors.message
                                            ? "error"
                                            : "success"
                                    }`,
                                    title: `${
                                        page.props.errors.message
                                            ? "Ups..."
                                            : "¡Buen trabajo!"
                                    }`,
                                    text: `${
                                        page.props.errors.message
                                            ? page.props.errors.message
                                            : page.props.flash.message
                                    }`,
                                });
                            },
                            onError: (errors) => {
                                this.$swal(
                                    "¡Ops...!",
                                    "Disculpe, ocurrió un error.",
                                    "warning"
                                );
                            },
                            onFinish: (visit) => {
                                this.loadingDeleteItem = false;
                            },
                        }
                    );
                }
            });
        },
        initialize: function () {
            this.$inertia.get(this.route("ticket-category.index"));
        },
        findLineByName: function (lineName) {
            return this.lines.find((line) => line.name === lineName);
        },
    },
};
</script>
