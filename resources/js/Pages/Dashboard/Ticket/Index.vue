<template>
    <app-layout>
        <bread-crumbs
            :items="links"
            name="Mis Tickets de Soporte"
        ></bread-crumbs>

        <v-container>
            <v-card class="" style="width: 100%">
                <v-card-text class="">
                    <v-row class="no-gutters">
                        <div
                            class="d-flex justify-space-between justify-md-start col-md-6 col-12"
                        >
                            <v-btn
                                color="primary"
                                @click="$inertia.visit(route('ticket.create'))"
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
            <v-card class="mt-4">
                <v-card-text>
                    <v-data-table
                        :headers="headers"
                        :items="tickets"
                        :loading="loading"
                        :search="search"
                    >
                        <template v-slot:item.priority="{ item }">
                            <!-- Renderiza el valor de prioridad como un ícono -->
                            <div class="d-flex">
                                <v-chip
                                    :color="getPriorityColor(item.priority)"
                                    dark
                                    >{{ item.priority }}
                                </v-chip>
                            </div>
                        </template>

                        <template v-slot:item.user_id="{ item }">
                            {{ users[item.user_id] }}
                        </template>

                        <template v-slot:item.category_id="{ item }">
                            <!-- Renderiza el valor de estado como un chip -->
                            {{ getCategoryById(item.category_id) }}
                        </template>

                        <template v-slot:item.status="{ item }">
                            <!-- Renderiza el valor de estado como un chip -->

                            <v-chip :color="getStatusColor(item.status)" dark>
                                {{ getStatusName(item.status) }}
                            </v-chip>
                        </template>

                        <template v-slot:item.message="{ item }">
                            <!-- Renderiza el valor de estado como un chip -->
                            <div v-html="item.message"></div>
                        </template>

                        <template v-slot:item.actions="{ item }">
                            <!-- Renderiza acciones para el ticket, por ejemplo, botones para editar o eliminar -->
                            <div class="d-flex">
                                <v-btn
                                    icon
                                    @click="
                                        $inertia.visit(
                                            route('ticket.edit', item.id)
                                        )
                                    "
                                >
                                    <v-icon> mdi-pencil</v-icon>
                                </v-btn>

                                <v-btn icon @click="deleteTicket(item)">
                                    <v-icon>mdi-delete</v-icon>
                                </v-btn>
                                <v-btn icon @click="viewTicket(item)">
                                    <v-icon>mdi-eye</v-icon>
                                </v-btn>
                            </div>
                        </template>
                    </v-data-table>
                </v-card-text>
            </v-card>
        </v-container>
    </app-layout>
</template>

<script>
import AppLayout from "@/Layouts/AppLayout.vue";

import BreadCrumbs from "@/Components/BreadCrumbs.vue";

export default {
    name: "Index",
    components: {
        BreadCrumbs,
        AppLayout,
    },
    props: ["tickets"],
    data: () => ({
        headers: [
            { text: "Título", value: "title" },
            {
                text: "Usuario",
                value: "user_id",
            },
            { text: "Categoría", value: "category_id" },
            { text: "Prioridad", value: "priority" },
            { text: "Mensaje", value: "message" },
            { text: "Estado", value: "status" },
            { text: "Acciones", value: "actions" }, // Agrega una columna para las acciones
        ],
        search: "", // Valor para la búsqueda
        pagination: {}, // Configuración de paginación
        loading: false, // Estado de carga de datos

        selectedItem: 1,
        items: [
            { text: "Error en red", icon: "mdi-tag" },
            { text: "Inconveniente con el cargue de archivo", icon: "mdi-tag" },
            { text: "No puedo registrar estudiantes", icon: "mdi-tag" },
        ],
        links: [
            {
                text: "Dashboard",
                disabled: false,
                href: "/dashboard",
            },
            {
                text: "Tickets",
                disabled: true,
                href: "/dashboard/ticket",
            },
        ],
        categories: [],
        users: [],
    }),
    mounted() {
        axios
            .get(route("ticket-category.all"))
            .then((response) => {
                // Lógica de manejo de éxito de la llamada
                // Puedes realizar acciones adicionales aquí si es necesario
                this.categories = response.data;
            })
            .catch((error) => {
                // Lógica de manejo de error de la llamada
                // Puedes realizar acciones adicionales aquí si es necesario
                return error; // Retornar el error de la respuesta
            });
        this.fetchTickets();
    },
    methods: {
        // Método para obtener el color del ícono de prioridad según el valor de prioridad del ticket
        getPriorityColor(priority) {
            // Implementa tu lógica para asignar colores basados en la prioridad
            switch (priority) {
                case "Alta":
                    return "red"; // Color rojo para prioridad alta
                case "Media":
                    return "orange"; // Color naranja para prioridad media
                case "Baja":
                    return "green"; // Color verde para prioridad baja
                default:
                    return "grey"; // Color gris para otros casos
            }
        },
        // Método para obtener el ícono de prioridad según el valor de prioridad del ticket
        getPriorityIcon(priority) {
            // Implementa tu lógica para asignar íconos basados en la prioridad
            switch (priority) {
                case "alta":
                    return "mdi-flag-outline"; // Ícono de bandera para prioridad alta
                case "media":
                    return "mdi-flag-triangle"; // Ícono de triángulo para prioridad media
                case "baja":
                    return "mdi-flag-checkered"; // Ícono de bandera a cuadros para prioridad baja
                default:
                    return "mdi-flag"; // Ícono de bandera por defecto para otros casos
            }
        },
        // Método para obtener el color del chip de estado según el valor de estado del ticket
        getStatusColor(status) {
            // Implementa tu lógica para asignar colores basados en el estado
            switch (status) {
                case "Open":
                    return "green"; // Color verde para estado "abierto"
                case "Closed":
                    return "red"; // Color rojo para estado "cerrado"
                default:
                    return "grey"; // Color gris para otros casos
            }
        },
        // Método para obtener el nombre según el valor de estado del ticket
        getStatusName(status) {
            // Implementa tu lógica para asignar colores basados en el estado
            switch (status) {
                case "Open":
                    return "Abierto"; // Color verde para estado "abierto"
                case "Closed":
                    return "Cerrado"; // Color rojo para estado "cerrado"
                default:
                    return "grey"; // Color gris para otros casos
            }
        },
        // Método para editar un ticket
        editTicket(ticket) {
            // Implementa la lógica para editar un ticket
        },
        // Método para eliminar un ticket
        deleteTicket(ticket) {
            ticket._method = "DELETE";
            this.$swal
                .fire({
                    title: "¿Estás seguro?",
                    text: "Esta acción no se puede deshacer",
                    icon: "warning",
                    showCancelButton: true,
                    cancelButtonColor: "#3085d6",
                    confirmButtonColor: "#d33",
                    confirmButtonText: "Sí, eliminar",
                    cancelButtonText: "Cancelar",
                })
                .then((result) => {
                    if (result.isConfirmed) {
                        this.$inertia.post(
                            route("ticket.destroy", ticket.id),
                            ticket,
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
        getItems() {
            // Realizar una solicitud a la ruta de Laravel para obtener los elementos paginados
            this.$inertia.get(route("ticket.index"), {
                onSuccess: (response) => {
                    this.tickets = response; // Actualizar los datos de los elementos paginados
                },
                onError: (error) => {
                    console.error(error);
                },
            });
        },
        async getUserNameFromId(userId) {
            // Realizamos una solicitud HTTP a tu API de Laravel para obtener el nombre del usuario
            this.userName = await axios.get(`/user/by/${userId}`);
        },
        onPageChange(page) {
            // Manejar el cambio de página
            this.currentPage = page;
            this.getItems();
        },
        getCategoryById(categoryId) {
            try {
                const category = this.categories.find(
                    (category) => category.id === categoryId
                );
                return category.name; // Retorna la categoría encontrada
            } catch (e) {}
        },
        async fetchTickets() {
            try {
                for (const ticket of this.tickets) {
                    const userName = await this.getUserNameById(ticket.user_id);
                    this.$set(this.users, ticket.user_id, userName);
                }
            } catch (error) {
                console.error(error);
            }
        },
        async getUserNameById(userId) {
            try {
                const response = await axios.get("/user/by/" + userId);
                return response.data;
            } catch (error) {
                console.error(error);
                return "No definido";
            }
        },
        viewTicket(item) {
            this.$inertia.visit(`/dashboard/ticket/${item.id}`);
        },
    },
};
</script>

<style scoped></style>
