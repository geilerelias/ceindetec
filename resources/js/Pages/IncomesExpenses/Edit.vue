<template>
    <app-layout>
        <bread-crumbs :items="links" name="Crear Movimiento"></bread-crumbs>

        <v-container>
            <v-row>
                <v-col class="mx-auto col-md-10 cols-12">
                    <form
                        enctype="multipart/form-data"
                        @submit.prevent="submitForm"
                    >
                        <v-card class="pa-4">
                            <v-card-title class="text-h5">
                                <v-icon :left="true">
                                    mdi-pencil-box-multiple-outline
                                </v-icon>
                                Ingresos o egresos
                            </v-card-title>
                            <v-divider></v-divider>
                            <v-card-text>
                                <v-autocomplete
                                    v-model.trim="form.line"
                                    :error-messages="form.errors.line"
                                    :items="lines"
                                    label="Linea a la cual pertenece la operación"
                                    outlined
                                    @blur="form.clearErrors('line')"
                                    item-text="name"
                                    item-value="name"
                                >
                                    <template v-slot:item="data">
                                        <template
                                            v-if="typeof data.item !== 'object'"
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
                                <v-textarea
                                    v-model.trim="form.description"
                                    :error-messages="form.errors.description"
                                    label="Descripción de la operación"
                                    outlined
                                    @blur="form.clearErrors('description')"
                                ></v-textarea>
                                <v-text-field
                                    v-model.number.trim="form.amount"
                                    :error-messages="form.errors.amount"
                                    label="Monto"
                                    outlined
                                    @blur="form.clearErrors('amount')"
                                    @input="formatAmount"
                                ></v-text-field>
                                <v-select
                                    v-model="form.type"
                                    :error-messages="form.errors.type"
                                    :items="typeOptions"
                                    item-text="title"
                                    item-value="value"
                                    label="Tipo de operación"
                                    outlined
                                    @blur="form.clearErrors('type')"
                                ></v-select>
                                <v-menu
                                    v-model="menu2"
                                    :close-on-content-click="false"
                                    :nudge-right="40"
                                    min-width="auto"
                                    offset-y
                                    transition="scale-transition"
                                >
                                    <template v-slot:activator="{ on, attrs }">
                                        <v-text-field
                                            v-model="form.date"
                                            :error-messages="form.errors.date"
                                            label="Fecha del ingreso o egreso"
                                            outlined
                                            prepend-icon="mdi-calendar"
                                            readonly
                                            v-bind="attrs"
                                            @blur="form.clearErrors('date')"
                                            v-on="on"
                                        ></v-text-field>
                                    </template>

                                    <v-date-picker
                                        v-model="form.date"
                                        label="Fecha"
                                        locale="es-Co"
                                        outlined
                                        required
                                        @input="menu2 = false"
                                    ></v-date-picker>
                                </v-menu>

                                <v-file-input
                                    v-model="form.file_path"
                                    label="Archivo de soporte"
                                    outlined
                                ></v-file-input>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn
                                    :loading="form.processing"
                                    color="primary"
                                    type="submit"
                                >
                                    Actualizar
                                </v-btn>

                                <v-btn
                                    :loading="form.processing"
                                    color="secondary"
                                    @click="
                                        $inertia.visit(
                                            route('incomes-expenses.index')
                                        )
                                    "
                                >
                                    Cancelar
                                </v-btn>
                            </v-card-actions>
                        </v-card>
                    </form>
                </v-col>
            </v-row>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    components: { BreadCrumbs, AppLayout },
    props: ["incomeExpense"],
    data() {
        return {
            form: this.$inertia.form({
                line: null,
                description: "",
                amount: 0,
                type: null,
                date: null,
                file_path: null,
            }),
            typeOptions: [
                { title: "Ingreso", value: "income" },
                { title: "Egreso", value: "expense" },
            ],
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
                    text: "IncomeExpense",
                    disabled: false,
                    href: "/incomes-expenses",
                },
                {
                    text: "Edit",
                    disabled: true,
                    href: "",
                },
            ],
            menu2: false,
        };
    },
    mounted() {
        this.form = this.$inertia.form(this.incomeExpense);
    },
    methods: {
        formatAmount() {
            this.form.amount = numeral(this.form.amount).format("$0,0");
        },
        submitForm() {
            try {
                console.log(this.form.file_path);
                console.log(this.form);
                /*  let formData = new FormData();
                  formData.append("description", this.form.description);
                  formData.append("amount", this.form.amount);
                  formData.append("type", this.form.type);
                  formData.append("date", this.form.date);
                  formData.append("file_path", this.form.file_path);*/
                this.form.amount = this.form.amount
                    .replace(/[$,.]/g, "")
                    .replace(/peso/gi, "");

                this.form.put(
                    route("incomes-expenses.update", this.form.id),
                    this.form,
                    {
                        forceFormData: true,
                        onSuccess: (response) => {
                            console.log(response);
                            this.$swal(
                                "Buen trabajo",
                                response.props.flash.message,
                                "success"
                            );
                            this.$inertia.visit(
                                route("incomes-expenses.index")
                            );
                        },
                        onError: (error) => {
                            console.log("errors", error);
                            let errorsMessage =
                                Object.values(error).join("<br>");

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
    },
};
</script>
