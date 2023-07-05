<template>
    <app-layout>
        <bread-crumbs
            :items="links"
            name="Información de Ticket"
        ></bread-crumbs>

        <v-container>
            <v-card class="ma-2">
                <v-system-bar></v-system-bar>
                <div class="d-flex justify-space-around mt-2">
                    <logo
                        :light="false"
                        :tile="true"
                        :width="100"
                        color="primary"
                    ></logo>

                    <logo
                        :light="false"
                        :tile="true"
                        :width="100"
                        color="primary"
                        src="logoAlcaldia"
                    ></logo>
                </div>

                <v-card-title
                    class="d-flex justify-space-around pt-1 pb-0 mb-0"
                >
                    <v-row>
                        <v-col>
                            <div>
                                <v-list-item three-line>
                                    <v-list-item-content class="text-center">
                                        <div class="text-overline mb-1">
                                            {{ ticket.line }}
                                        </div>
                                        <v-list-item-title class="text-h5 mb-1">
                                            {{ ticket.title }}
                                        </v-list-item-title>
                                        <v-list-item-subtitle
                                            v-html="ticket.message"
                                        >
                                        </v-list-item-subtitle>
                                    </v-list-item-content>
                                </v-list-item>
                            </div>
                        </v-col>
                    </v-row>
                </v-card-title>

                <v-container>
                    <div class="d-flex justify-space-around mb-6">
                        <div>
                            <div>
                                Establecimiento:
                                <span class="font-weight-black text--primary">
                                    {{
                                        getEstablishment(
                                            ticket.establishment_id
                                        )
                                    }}
                                </span>
                            </div>
                            <div>
                                Sede:
                                <span class="font-weight-black text--primary">
                                    {{ getHeadquarters(ticket.headquarter_id) }}
                                </span>
                            </div>
                            <div>
                                Usuario responsable:
                                <span class="font-weight-black text--primary">
                                    {{ getUserName }}
                                </span>
                            </div>
                            <div>
                                Categoría:
                                <span class="font-weight-black text--primary">
                                    {{ getCategoryById(ticket.category_id) }}
                                </span>
                            </div>
                            <div>
                                Prioridad:
                                <span class="font-weight-black text--primary">
                                    {{ ticket.priority }}
                                </span>
                            </div>
                            <div>
                                Estado:
                                <span class="font-weight-black text--primary">
                                    {{ ticket.status }}
                                </span>
                            </div>
                            <div>
                                Publicado en:
                                <span class="font-weight-black text--primary">
                                    {{ getDate(ticket.published_at) }}
                                </span>
                            </div>
                        </div>
                        <div class="d-flex justify-center align-center">
                            <v-card :aspect-ratio="1" outlined width="180">
                                <v-card-text class="pa-3 flex-grow-1">
                                    <div
                                        class="d-flex align-center flex-column"
                                    >
                                        <v-avatar color="" size="150" tile>
                                            <qrcode-vue
                                                :size="150"
                                                :value="`https://ceindetecguajira.com`"
                                                class=""
                                                level="H"
                                            />
                                        </v-avatar>
                                    </div>
                                </v-card-text>
                            </v-card>
                        </div>
                    </div>
                </v-container>

                <v-banner single-line>
                    <template v-slot:actions>
                        <v-btn color="primary">
                            <v-icon>mdi-plus</v-icon>
                            Responder
                        </v-btn>
                    </template>
                </v-banner>

                <v-card-text class="grey lighten-4">
                    <v-sheet class="mx-auto" height="300" max-width="800">
                        <template>
                            <v-container fluid>
                                <v-row>
                                    <v-col cols="12">
                                        <v-card
                                            v-for="(message, index) in messages"
                                            :key="index"
                                            class="message-card"
                                            :class="
                                                message.type === 'incoming'
                                                    ? 'incoming'
                                                    : 'outgoing'
                                            "
                                        >
                                            <v-card-text>
                                                <div class="message-content">
                                                    <div class="message-text">
                                                        {{ message.text }}
                                                    </div>
                                                    <div
                                                        class="message-timestamp"
                                                    >
                                                        {{ message.timestamp }}
                                                    </div>
                                                </div>
                                            </v-card-text>
                                        </v-card>
                                    </v-col>
                                </v-row>
                            </v-container>
                        </template>
                    </v-sheet>
                </v-card-text>
            </v-card>
        </v-container>
    </app-layout>
</template>

<script>
import { defineComponent } from "vue";
import AppLayout from "@/Layouts/AppLayout.vue";
import BreadCrumbs from "@/Components/BreadCrumbs.vue";
import QrcodeVue from "qrcode.vue";
import SpinnerComponent from "@/Components/SpinnerComponent.vue";
import logo from "@/Components/Logo.vue";

export default defineComponent({
    name: "Show",
    props: ["ticket"],
    components: {
        QrcodeVue,
        BreadCrumbs,
        AppLayout,
        SpinnerComponent,
        logo,
    },
    data() {
        return {
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
                    text: "Ver Ticket",
                    disabled: true,
                    href: "",
                },
            ],
            sticky: false,
            userName: null,
            establishments: [],
            headquarters: [],
            categories: [],
            messages: [
                {
                    type: "incoming",
                    text: "Hola, ¿cómo estás?",
                    timestamp: "2023-06-02 16:29:23",
                },
                {
                    type: "outgoing",
                    text: "¡Hola! Estoy bien, gracias.",
                    timestamp: "2023-06-02 16:30:15",
                },
                {
                    type: "incoming",
                    text: "¿Qué planes tienes para hoy?",
                    timestamp: "2023-06-02 16:31:10",
                },
                {
                    type: "outgoing",
                    text: "No tengo planes específicos, ¿tienes alguna sugerencia?",
                    timestamp: "2023-06-02 16:32:05",
                },
            ],
        };
    },
    computed: {
        getUserName: function () {
            try {
                this.getUserNameFromId(this.ticket.user_id);
                return this.userName.data;
            } catch (e) {}
        },
    },
    created() {
        axios.get(`/dashboard/establishment/all`).then((response) => {
            //console.log(response.data);
            this.establishments = response.data;
        });

        axios.get(`/dashboard/headquarters/all`).then((response) => {
            //console.log(response.data);
            this.headquarters = response.data;
        });
        axios.get(`/dashboard/ticket-category/all`).then((response) => {
            //console.log(response.data);
            this.categories = response.data;
        });
    },
    methods: {
        getColor(priority) {
            switch (priority) {
                case "Alta":
                    return "error";
                case "Media":
                    return "warning";
                case "Baja":
                    return "success";
                default:
                    return "primary";
            }
        },
        getEstablishment(id) {
            try {
                let found = this.establishments.find(
                    (element) => element.id === id
                );
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getHeadquarters(id) {
            console.log(id);
            try {
                let found = this.headquarters.find(
                    (element) => element.id === id
                );
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getCategoryById: function (id) {
            const category = this.categories.find(
                (category) => category.id === id
            );
            return category ? category.name : "Categoría no encontrada";
        },
        async getUserNameFromId(userId) {
            // Realizamos una solicitud HTTP a tu API de Laravel para obtener el nombre del usuario
            this.userName = await axios.get(`/user/by/${userId}`);
        },
        getDate(val) {
            try {
                //.log('this is tab => ', tab)
                //console.log(this.getRecords[tab].folder)
                const dateTime = new Date(val);
                const options = {
                    weekday: "long",
                    day: "numeric",
                    month: "long",
                    year: "numeric",
                    hour: "numeric",
                    minute: "numeric",
                    hour12: true,
                };

                return dateTime.toLocaleDateString("es-ES", options);
            } catch (e) {
                console.log(e);
            }
        },
    },
});
</script>

<style>
.message-card {
    margin-bottom: 10px;
}

.incoming {
    background-color: #e0e0e0;
    text-align: left;
}

.outgoing {
    background-color: #2196f3;
    text-align: right;
    color: white;
}

.message-content {
    padding: 10px;
}

.message-text {
    font-size: 16px;
}

.message-timestamp {
    font-size: 12px;
    color: #777;
}
</style>
