<template>
    <app-layout>
        <bread-crumbs :items="links" name="Ingresos y egresos"></bread-crumbs>
        <v-container>
            <v-card class="ma-1" style="width: 100%">
                <v-card-text class="">
                    <v-row class="no-gutters">
                        <div
                            class="d-flex justify-space-between justify-md-start col-md-6 col-12"
                        >
                            <v-btn
                                color="primary"
                                @click="
                                    $inertia.visit(
                                        route('incomes-expenses.create')
                                    )
                                "
                            >
                                <v-icon class="notranslate mr-2">
                                    mdi-plus
                                </v-icon>
                                Agregar
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
                                placeholder="Buscar"
                            ></v-text-field>
                        </div>
                    </v-row>
                </v-card-text>
            </v-card>
            <v-card class="mx-1 my-3" style="width: 100%">
                <v-card class="rounded-b-0">
                    <v-tabs
                        v-model="tab"
                        background-color="primary"
                        dark
                        show-arrows
                        slider-color="secondary"
                    >
                        <v-tab
                            v-for="(incomeExpense, index) in incomesExpenses"
                            :key="index"
                        >
                            {{ index }}
                        </v-tab>
                    </v-tabs>
                </v-card>

                <v-tabs-items v-model="tab">
                    <v-tab-item
                        v-for="(incomeExpense, index) in incomesExpenses"
                        :key="index"
                    >
                        <v-card>
                            <v-card-text>
                                <v-card class="mx-1 my-6" style="width: 100%">
                                    <v-col cols="12">
                                        <v-data-table
                                            :headers="headers"
                                            :items="incomeExpense.data"
                                            item-key="id"
                                        >
                                            <template
                                                v-slot:item.ticket_id="{ item }"
                                            >
                                                <span
                                                    v-if="
                                                        item.ticket_id === null
                                                    "
                                                >
                                                    --
                                                </span>
                                                <inertia-link
                                                    :href="
                                                        route(
                                                            'ticket.show',
                                                            item.ticket_id
                                                        )
                                                    "
                                                    v-else
                                                    v-html="item.ticket_id"
                                                >
                                                </inertia-link>
                                            </template>
                                            <template
                                                v-slot:item.headquarter_id="{
                                                    item,
                                                }"
                                            >
                                                <span class="text-uppercase">
                                                    {{
                                                        getHeadquarters(
                                                            item.headquarter_id
                                                        )
                                                    }}
                                                </span>
                                            </template>

                                            <template
                                                v-slot:item.establishment_id="{
                                                    item,
                                                }"
                                            >
                                                <span class="text-uppercase">
                                                    {{
                                                        getEstablishment(
                                                            item.establishment_id
                                                        )
                                                    }}
                                                </span>
                                            </template>
                                            <template
                                                v-slot:item.type="{ item }"
                                            >
                                                <v-chip
                                                    :color="
                                                        item.type === 'income'
                                                            ? 'success'
                                                            : 'error'
                                                    "
                                                    dark
                                                >
                                                    {{ typeNames[item.type] }}
                                                    <v-icon
                                                        v-html="
                                                            item.type ===
                                                            'income'
                                                                ? 'mdi-arrow-top-right-thin'
                                                                : 'mdi-arrow-bottom-right-thin'
                                                        "
                                                    ></v-icon>
                                                </v-chip>
                                            </template>

                                            <template
                                                v-slot:item.amount="{ item }"
                                            >
                                                {{ formatAmount(item.amount) }}
                                            </template>
                                            <template
                                                v-slot:item.file_path="{ item }"
                                            >
                                                <v-icon
                                                    v-if="item.file_path"
                                                    @click="
                                                        openDialog(
                                                            item.file_path
                                                        )
                                                    "
                                                >
                                                    mdi-file-eye-outline
                                                </v-icon>
                                                <v-icon
                                                    v-if="item.file_path"
                                                    @click="
                                                        downloadFile(
                                                            item.file_path
                                                        )
                                                    "
                                                >
                                                    mdi-file-download-outline
                                                </v-icon>
                                                <span v-else>- -</span>
                                            </template>

                                            <template #item.action="{ item }">
                                                <v-btn
                                                    color="primary"
                                                    icon
                                                    text
                                                    @click="
                                                        $inertia.visit(
                                                            route(
                                                                'incomes-expenses.edit',
                                                                item.id
                                                            )
                                                        )
                                                    "
                                                >
                                                    <v-icon>
                                                        mdi-pencil-outline
                                                    </v-icon>
                                                </v-btn>
                                                <v-btn
                                                    color="error"
                                                    icon
                                                    text
                                                    @click.prevent="
                                                        deleteIncomeExpense(
                                                            item
                                                        )
                                                    "
                                                >
                                                    <v-icon>
                                                        mdi-delete-outline
                                                    </v-icon>
                                                </v-btn>
                                            </template>
                                        </v-data-table>
                                    </v-col>
                                </v-card>

                                <v-row>
                                    <v-col>
                                        <p>
                                            <span
                                                class="success--text font-weight-bold"
                                            >
                                                Ingresos:
                                            </span>
                                            {{
                                                formatAmount(
                                                    incomeExpense.incomes
                                                )
                                            }}
                                        </p>
                                        <p>
                                            <span
                                                class="error--text font-weight-bold"
                                            >
                                                Egresos:
                                            </span>
                                            {{
                                                formatAmount(
                                                    incomeExpense.expenses
                                                )
                                            }}
                                        </p>
                                        <p>
                                            <span
                                                class="primary--text font-weight-bold"
                                            >
                                                Balance:
                                            </span>
                                            {{
                                                formatAmount(
                                                    incomeExpense.balance
                                                )
                                            }}
                                        </p>
                                    </v-col>

                                    <v-col>
                                        <v-card>
                                            <apexchart
                                                :options="chartOptions"
                                                :series="[
                                                    {
                                                        data: [
                                                            {
                                                                title: 'Ingresos',
                                                                name: 'Ingresos',
                                                                x: 'Ingresos',
                                                                y: incomeExpense.incomes,
                                                                fillColor:
                                                                    '#4CAF50',
                                                            },
                                                            {
                                                                title: 'Egresos',
                                                                name: 'Egresos',
                                                                x: 'Egresos',
                                                                y: incomeExpense.expenses,
                                                                fillColor:
                                                                    '#FF5252',
                                                            },
                                                        ],
                                                    },
                                                ]"
                                                type="bar"
                                            ></apexchart>
                                        </v-card>
                                    </v-col>
                                </v-row>
                            </v-card-text>
                        </v-card>
                    </v-tab-item>
                </v-tabs-items>
            </v-card>
        </v-container>

        <v-dialog v-model="dialog" max-width="80vw">
            <div class="text-center">
                <v-card>
                    <iframe
                        ref="fileViewer"
                        height="500"
                        scrolling="no"
                        width="100%"
                    ></iframe>
                </v-card>
            </div>
        </v-dialog>
    </app-layout>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";
import VueApexCharts from "vue-apexcharts";

export default {
    components: {
        BreadCrumbs,
        AppLayout,
        SimpleLayout,
        apexchart: VueApexCharts,
    },
    props: {
        incomesExpenses: {
            default: [],
            required: true,
        },
    },
    data() {
        return {
            dialog: false,
            fileUrl: "",
            dimensions: null,

            headers: [
                { text: "Establecimiento", value: "establishment_id" },
                { text: "Sede", value: "headquarter_id" },
                { text: "Ticket", value: "ticket_id" },
                { text: "Descripción", value: "description" },
                { text: "Monto", value: "amount" },
                { text: "Tipo", value: "type" },
                { text: "Fecha", value: "date" },
                { text: "Archivo", value: "file_path" },
                { text: "Acciones", value: "action", sortable: false },
            ],
            search: "",
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
                    text: "Informe",
                    disabled: true,
                    href: "/view",
                },
            ],
            typeNames: {
                income: "Ingreso",
                expense: "Egreso",
            },
            //incomes
            headers2: [
                { text: "Mes", value: "month" },
                { text: "Ingresos", value: "income" },
                { text: "Gastos", value: "expenses" },
                { text: "Total", value: "total" },
            ],
            incomeByMonth: [],
            expenseByMonth: [],
            items: [],
            incomeTotal: 0,
            expensesTotal: 0,
            tab: null,
            establishments: [],
            headquarters: [],
        };
    },
    created() {
        axios
            .get("/dashboard/establishment/all")
            .then((response) => {
                //console.log(response.data)
                this.establishments = response.data;
            })
            .catch((error) => {
                console.log(error);
            });

        axios
            .get("/dashboard/headquarters/all")
            .then((response) => {
                //console.log(response.data)
                this.headquarters = response.data;
            })
            .catch((error) => {
                console.log(error);
            });
    },
    computed: {
        chartOptions() {
            return {
                chart: {
                    type: "bar",
                    stacked: false,
                    toolbar: {
                        show: true,
                    },
                },
                zoom: {
                    enabled: true,
                    type: "x",
                },
                plotOptions: {
                    bar: {
                        horizontal: false,
                        columnWidth: "40%",
                        endingShape: "rounded",

                        dataLabels: {
                            position: "top", // top, center, bottom
                        },
                    },
                },

                title: {
                    text: "Ingresos y egresos",
                    align: "center",
                },

                dataLabels: {
                    enabled: true,
                    formatter: function (val) {
                        const formatter = new Intl.NumberFormat("es-CO", {
                            style: "currency",
                            currency: "COP",
                            minimumFractionDigits: 2,
                        });
                        return formatter.format(val);
                    },
                    offsetY: -20,
                    style: {
                        fontSize: "12px",
                        colors: ["#304758"],
                    },
                },
                stroke: {
                    show: true,
                    width: 2,
                    colors: ["transparent"],
                },
                xaxis: {
                    categories: ["Ingresos", "Egresos"],
                },
                yaxis: {
                    labels: {
                        formatter: function (val) {
                            const formatter = new Intl.NumberFormat("es-CO", {
                                style: "currency",
                                currency: "COP",
                                minimumFractionDigits: 2,
                            });
                            return formatter.format(val);
                        },
                    },
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            const formatter = new Intl.NumberFormat("es-CO", {
                                style: "currency",
                                currency: "COP",
                                minimumFractionDigits: 2,
                            });
                            return formatter.format(val);
                        },
                    },
                },
                fill: {
                    opacity: 1,
                },
                colors: ["#4caf50", "#f44336"],
            };
        },
    },
    methods: {
        getEstablishment(id) {
            try {
                // console.log(id)
                let found = null;
                if (typeof id !== "number") {
                    let nuevo = this.getNumber(id);
                    //console.log(nuevo)
                    found = this.establishments.find(
                        (element) => element.id === nuevo
                    );
                } else {
                    found = this.establishments.find(
                        (element) => element.id === id
                    );
                }
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getHeadquarters(id) {
            try {
                // console.log(id)
                let found = null;
                if (typeof id !== "number") {
                    let nuevo = this.getNumber(id);
                    //console.log(nuevo)
                    found = this.headquarters.find(
                        (element) => element.id === nuevo
                    );
                } else {
                    found = this.headquarters.find(
                        (element) => element.id === id
                    );
                }
                return found.name;
            } catch (e) {
                return null;
            }
        },
        formatAmount(value) {
            const formatter = new Intl.NumberFormat("es-CO", {
                style: "currency",
                currency: "COP",
                minimumFractionDigits: 2,
            });
            return formatter.format(value);
        },
        deleteIncomeExpense(item) {
            item._method = "DELETE";
            this.$swal({
                title: "¿Está seguro de que desea eliminar este elemento?",
                text: "¡No podrás revertir esto!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Sí, Eliminarlo!",
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post(
                        route("incomes-expenses.destroy", item.id),
                        item,
                        {
                            onSuccess: (page) => {
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
                                    "¡Ay...!",
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
        openDialog(path) {
            axios
                .get(`/storage/${path}`, { responseType: "blob" })
                .then((response) => {
                    const contentType = response.headers["content-type"];
                    const isImage = contentType.startsWith("image/");
                    const isPdf = contentType === "application/pdf";
                    if (isImage) {
                        this.setImageContent(response.data);
                    } else if (isPdf) {
                        this.setPdfContent(response.data);
                    } else {
                        const content = response.data;
                        const iframe = this.$refs.fileViewer;
                        iframe.setAttribute("srcdoc", content);
                    }
                })
                .catch((error) => {
                    console.log(error);
                });
            this.fileUrl = `/storage/${path}`;
            this.dialog = true;
        },
        setImageContent(data) {
            const img = new Image();
            img.onload = () => {
                const iframe = this.$refs.fileViewer;

                iframe.setAttribute(
                    "srcdoc",
                    `
                          <style>
                          .image-container {
                              display: flex;
                              justify-content: center;
                              align-items: center;
                              width: 100%;
                              height: 100%;
                            }

                            img {
                              width: 80vw;
                              height: 500px;
                              object-fit: contain;
                            }
                          </style>
                          <div class="image-container ">
                               <img src="${URL.createObjectURL(data)}">
                          </div>
                        `
                );
            };
            img.src = URL.createObjectURL(data);
        },
        setPdfContent(data) {
            const iframe = this.$refs.fileViewer;
            iframe.setAttribute(
                "srcdoc",
                ` <embed src="${URL.createObjectURL(
                    data
                )}" width="100%" height="500" type="application/pdf">
              `
            );
        },
        downloadFile(path) {
            axios
                .get(`/download/${path}`, {
                    responseType: "blob",
                })
                .then((response) => {
                    const url = window.URL.createObjectURL(
                        new Blob([response.data])
                    );
                    const link = document.createElement("a");
                    link.href = url;
                    link.setAttribute("download", path);
                    document.body.appendChild(link);
                    link.click();
                })
                .catch((error) => {
                    console.error(error);
                });
        },
    },
};
</script>
