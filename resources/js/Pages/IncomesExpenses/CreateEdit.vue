<template>
    <app-layout>
        <bread-crumbs
            :items="links"
            :name="`${isEdit !== false ? 'Editar ' : 'Crear'} Movimiento`"
        ></bread-crumbs>

        <v-container>
            <v-row>
                <v-col cols="12">
                    <h1></h1>
                </v-col>
            </v-row>
            <v-row>
                <v-col class="mx-auto col-md-10 cols-12">
                    <form
                        enctype="multipart/form-data"
                        @submit.prevent="submitForm"
                    >
                        <v-card class="pa-4">
                            <v-card-title class="text-h5">
                                <v-icon :left="true">
                                    {{
                                        isEdit !== false
                                            ? "mdi-pencil-box-multiple-outline"
                                            : "mdi-cash-plus"
                                    }}
                                </v-icon>
                                {{ isEdit !== false ? "Editar " : "Crear " }}
                                Ingresos o egresos
                            </v-card-title>
                            <v-divider></v-divider>
                            <v-card-text>
                                <v-row>
                                    <v-col class="col-12 col-sm-5">
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

                                    <v-col class="col-12 col-sm-7">
                                        <v-autocomplete
                                            v-model.trim="form.ticket_id"
                                            :error-messages="
                                                form.errors.ticket_id
                                            "
                                            :items="tickets"
                                            item-text="title"
                                            item-value="id"
                                            label="Ticket al cual pertenece la operación"
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
                                                    <v-list-item three-line>
                                                        <v-list-item-content>
                                                            <v-list-item-title>
                                                                {{
                                                                    data.item
                                                                        .title
                                                                }}
                                                            </v-list-item-title>
                                                            <v-list-item-subtitle>
                                                                {{
                                                                    data.item
                                                                        .date
                                                                }}
                                                            </v-list-item-subtitle>
                                                            <v-list-item-subtitle
                                                                v-html="
                                                                    data.item
                                                                        .message
                                                                "
                                                            >
                                                            </v-list-item-subtitle>
                                                        </v-list-item-content>
                                                    </v-list-item>
                                                    <v-divider></v-divider>
                                                </template>
                                            </template>
                                        </v-autocomplete>
                                    </v-col>

                                    <v-col class="col-12 col-sm-6">
                                        <v-autocomplete
                                            v-model="form.establishment_id"
                                            :disabled="
                                                establishments.length < -1
                                            "
                                            :error-messages="
                                                form.errors.establishment_id
                                            "
                                            :items="establishments"
                                            :readonly="
                                                establishments.length < -1
                                            "
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
                                                form.establishment_id ===
                                                    null ||
                                                form.establishment_id === ''
                                            "
                                            item-text="name"
                                            item-value="id"
                                            label="Sede"
                                            outlined
                                        >
                                        </v-autocomplete>
                                    </v-col>
                                    <v-col class="col-12">
                                        <v-textarea
                                            v-model.trim="form.description"
                                            :error-messages="
                                                form.errors.description
                                            "
                                            label="Descripción de la operación"
                                            outlined
                                            @blur="
                                                form.clearErrors('description')
                                            "
                                        ></v-textarea>
                                    </v-col>
                                    <v-col class="col-12 col-sm-6">
                                        <v-text-field
                                            v-model.number.trim="form.amount"
                                            :error-messages="form.errors.amount"
                                            label="Monto"
                                            outlined
                                            @blur="form.clearErrors('amount')"
                                            @input="formatAmount"
                                        ></v-text-field>
                                    </v-col>

                                    <v-col class="col-12 col-sm-6">
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
                                    </v-col>
                                    <v-col class="col-12 col-sm-6">
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
                                                    v-model="form.date"
                                                    :error-messages="
                                                        form.errors.date
                                                    "
                                                    label="Fecha del ingreso o egreso"
                                                    outlined
                                                    prepend-inner-icon="mdi-calendar"
                                                    readonly
                                                    v-bind="attrs"
                                                    @blur="
                                                        form.clearErrors('date')
                                                    "
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
                                    </v-col>

                                    <v-col class="col-12 col-sm-6">
                                        <v-file-input
                                            v-model="form.file_path"
                                            :prepend-icon="null"
                                            label="Archivo de soporte"
                                            outlined
                                            prepend-inner-icon="mdi-paperclip"
                                        ></v-file-input>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>

                                <v-btn
                                    :loading="form.processing"
                                    color="primary"
                                    type="submit"
                                >
                                    {{ isEdit ? "Actualizar" : "Guardar" }}
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
import numeral from "numeral";

export default {
    components: { BreadCrumbs, AppLayout },
    props: {
        incomeExpense: Object,
        editMode: { type: Boolean, default: false },
    },
    data() {
        return {
            form: this.$inertia.form({
                line: null,
                description: "",
                amount: 0,
                type: null,
                date: null,
                file_path: null,
                headquarter_id: "",
                establishment_id: "",
                ticket_id: null,
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
                    text: "Create",
                    disabled: true,
                    href: "",
                },
            ],
            menu2: false,
            establishments: [],
            headquarters: [],
            tickets: [],
        };
    },
    created() {
        axios.get(`/dashboard/establishment/all`).then((response) => {
            //console.log(response.data);
            this.establishments = response.data;
        });

        axios.get(`/dashboard/tickets/all`).then((response) => {
            console.log(response.data);
            this.tickets = response.data;
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
        isEdit() {
            return this.editMode;
        },
    },
    methods: {
        formatAmount() {
            this.form.amount = numeral(this.form.amount).format("$0,0");
        },
        submitForm() {
            if (this.isEdit) this.edit();
            else this.save();
        },
        save: function () {
            try {
                console.log(this.form.file_path);
                /*  let formData = new FormData();
                      formData.append("description", this.form.description);
                      formData.append("amount", this.form.amount);
                      formData.append("type", this.form.type);
                      formData.append("date", this.form.date);
                      formData.append("file_path", this.form.file_path);*/
                this.form.amount = this.form.amount
                    .replace(/[$,.]/g, "")
                    .replace(/peso/gi, "");

                this.form.post("/incomes-expenses", {
                    forceFormData: true,
                    onSuccess: (response) => {
                        console.log(response);
                        this.$swal(
                            "Buen trabajo",
                            response.props.flash.message,
                            "success"
                        );
                        this.$inertia.visit(route("incomes-expenses.index"));
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

                this.form.amount = this.form.amount
                    .replace(/[$,.]/g, "")
                    .replace(/peso/gi, "");

                this.form._method = "PUT";
                console.log("hasta aqui");
                this.$inertia.post(
                    `/incomes-expenses/${this.form.id}`,
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
