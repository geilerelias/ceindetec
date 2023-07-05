<template>
    <app-layout>
        <bread-crumbs
            :items="links"
            class="no-print"
            name="Ingresos y egresos"
        ></bread-crumbs>
        <v-container>
            <v-card class="ma-1 no-print" style="width: 100%">
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

                            <v-btn
                                class="button-shadow primary--text ml-2"
                                outlined
                                @click="printContent"
                            >
                                <v-icon left>mdi-printer</v-icon>
                                Imprimir
                            </v-btn>

                            <!--                            <v-btn
                                                            class="button-shadow primary&#45;&#45;text ml-2"
                                                            outlined
                                                            @click="exportToExcel"
                                                        >
                                                            <v-icon
                                                                aria-hidden="true"
                                                                class="notranslate mr-2"
                                                            >
                                                                mdi-file-export
                                                            </v-icon>
                                                            Exportar a Excel
                                                        </v-btn>-->
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
            <v-card class="mx-1 my-3 pa-0 ma-0" style="width: 100%">
                <v-card class="rounded-b-0 no-print">
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

                <v-tabs-items v-model="tab" class="ma-0 pa-0">
                    <v-tab-item
                        v-for="(incomeExpense, index) in incomesExpenses"
                        :key="index"
                        class="ma-0 pa-0"
                    >
                        <v-card
                            id="print-content"
                            ref="card"
                            class="print-card ma-0 pa-0"
                        >
                            <v-card-title>
                                <h1 class="title">
                                    Informe de Ingresos y Egresos
                                </h1>
                            </v-card-title>
                            <v-card-text>
                                <v-card class="mx-1 my-6" style="width: 100%">
                                    <v-col cols="12">
                                        <v-data-table
                                            ref="dataTable"
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
                                                    v-else
                                                    :href="
                                                        route(
                                                            'ticket.show',
                                                            item.ticket_id
                                                        )
                                                    "
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
                                                <div
                                                    v-if="item.file_path"
                                                    class="avatar-container"
                                                >
                                                    <img
                                                        :src="`/storage/${item.file_path}`"
                                                        alt="Archivo"
                                                        height="300"
                                                    />
                                                    <div
                                                        class="button-container no-print"
                                                    >
                                                        <v-icon
                                                            @click="
                                                                openDialog(
                                                                    item.file_path
                                                                )
                                                            "
                                                            >mdi-file-eye-outline
                                                        </v-icon>
                                                        <v-icon
                                                            @click="
                                                                downloadFile(
                                                                    item.file_path
                                                                )
                                                            "
                                                            >mdi-file-download-outline
                                                        </v-icon>
                                                    </div>
                                                </div>
                                                <span v-else>- -</span>
                                            </template>

                                            <template
                                                #item.action="{ item }"
                                                class="no-print"
                                            >
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
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";
import VueApexCharts from "vue-apexcharts";

import * as XLSX from "xlsx";
import { utils } from "xlsx";

const { getSheetName, json_to_sheet } = utils;

export default {
    components: {
        BreadCrumbs,
        AppLayout,
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
        exportToExcel() {
            const workbook = XLSX.utils.book_new();
            const sheetData = [];

            // Obtén los datos de la tabla
            const tableData = Array.from(this.getTableData());

            // Crea un encabezado para el archivo Excel
            const headers = [
                "ID",
                "Línea",
                "Descripción",
                "Monto",
                "Tipo",
                "Fecha",
            ];

            // Agrega el encabezado a la hoja de cálculo
            sheetData.push(headers);

            // Agrega los datos de la tabla a la hoja de cálculo
            tableData.forEach((row) => {
                const rowData = [
                    row.id,
                    row.line,
                    row.description,
                    row.amount,
                    row.type,
                    row.date,
                ];
                sheetData.push(rowData);
            });

            // Crea la hoja de cálculo
            const worksheet = XLSX.utils.aoa_to_sheet(sheetData);

            // Agrega la hoja de cálculo al libro de trabajo
            XLSX.utils.book_append_sheet(workbook, worksheet, "Tabla");

            // Genera el archivo Excel
            const excelBuffer = XLSX.write(workbook, {
                bookType: "xlsx",
                type: "array",
            });

            // Descarga el archivo Excel
            this.downloadExcel(excelBuffer, "tabla.xlsx");
        },

        getTableData() {
            // Lógica para obtener los datos de la tabla de Vuetify en formato JSON
            return this.incomesExpenses;
        },

        downloadExcel(buffer, filename) {
            const data = new Blob([buffer], {
                type: "application/octet-stream",
            });
            const link = document.createElement("a");
            link.href = window.URL.createObjectURL(data);
            link.download = filename;
            link.click();
        },

        printContent() {
            window.print();
        },
    },
};
</script>

<style>
.avatar-container {
    display: flex;
    align-items: center;
}

.button-container {
    margin-left: 8px;
}

.title {
    font-family: "Roboto", sans-serif;
    font-weight: bold;
    font-size: 28px;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
    text-transform: uppercase;
    border-bottom: 2px solid #999;
    padding-bottom: 10px;
}
</style>

<style>
@media print {
    @page {
        size: oficio; /* Tamaño de papel "oficio" en pulgadas */
        orientation: landscape; /* Modo paisaje */
    }

    body .no-print,
    body .no-print-header,
    body .no-print-drawer,
    body .no-print-footer,
    body .no-print *,
    body .no-print-header *,
    body .no-print-drawer *,
    body .no-print-footer * {
        display: none;
        visibility: hidden;
    }

    .print-card {
        width: 100%;
    }

    #print-content.print-card {
        width: 100% !important;
    }

    .container {
        min-width: 100% !important;
        max-width: 100% !important;
        width: 100% !important;
    }
}
</style>
