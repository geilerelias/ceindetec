<template>
    <page-layout>
        <section>
            <v-row class="no-gutters">
                <v-col class="col col-12">
                    <section>
                        <v-img
                            cover
                            color="#45516b"
                            gradient="to top, rgba(5, 11, 31, 0.8), rgba(5, 11, 31, 0.8)"
                            :src="bg"
                            max-width="100%"
                            style="height: 250px; max-width: 100%;"
                        >
                            <v-row class="ma-0 fill-height text-center d-flex align-center justify-center">
                                <v-col class="col-12">
                                    <h1 class="text-h3 font-weight-500 mb-2  white--text animate__animated animate__zoomIn">
                                        Contacto</h1>
                                    <v-responsive dense class="secondary mx-auto mb-6 base-divider--dense"
                                                  style="max-width: 28px;">
                                        <div class="v-responsive__content">
                                            <v-divider></v-divider>
                                        </div>
                                    </v-responsive>
                                    <v-breadcrumbs class="secondary--text justify-center pa-0 theme--dark "
                                                   :items="items" divider="/">
                                        <template v-slot:item="{ item }">
                                            <v-breadcrumbs-item :href="item.href" :disabled="item.disabled">
                                                <span :class="item.disabled ? 'white--text' : 'secondary--text'">{{
                                                        item.text.toUpperCase()
                                                    }}</span>
                                            </v-breadcrumbs-item>
                                        </template>
                                    </v-breadcrumbs>
                                </v-col>
                            </v-row>
                        </v-img>
                    </section>
                </v-col>
            </v-row>
        </section>

        <v-sheet light class="rounded-0" style="padding: 56px 0px;">
            <v-container class="container">
                <v-row class="justify-space-between">
                    <v-col class="col-md-5 col-12">
                        <div>
                            <v-container class="container pa-0" pace="6">
                                <v-row class="no-gutters justify-start">
                                    <v-col class="col-12">
                                        <h3 class="text-uppercase text-h6 font-weight-bold mb-1 text-left">MANTENTE EN
                                            CONTACTO CON NOSOTROS</h3>
                                        <v-responsive class=" base-divider primary mr-auto mb-6"
                                                      style="max-width: 28px;">
                                            <v-divider role="separator" aria-orientation="horizontal"
                                                       class="theme--light"/>
                                        </v-responsive>
                                    </v-col>
                                </v-row>
                            </v-container>
                            <div>
                                <div class="pt-2 mb-0 d-flex">
                                    <div class="d-inline-flex mb-3 align-self-start">
                                        <v-avatar class="grey lighten-2" size="72">
                                            <v-icon size="36" color="secondary ">mdi-map-marker</v-icon>
                                        </v-avatar>
                                    </div>
                                    <div class="d-flex justify-center align-center">
                                        <div class="d-inline ml-3">
                                            <h4 class="text-left text-h6  mb-1 secondary--text">Visítanos</h4>
                                            <p class="text-body-1  grey--text text--darken-1 text-left mb-0">Calle 10
                                                39-30, Esperanza 3ra etapa</p>
                                        </div>
                                    </div>
                                </div>
                                <v-divider class="my-2"></v-divider>
                                <div class="pt-2 mb-0 d-flex">
                                    <div class="base-avatar d-inline-flex mb-3 align-self-start">
                                        <!---->
                                        <v-avatar class="grey lighten-2" size="72">
                                            <v-icon size="36" color="secondary ">mdi-cellphone</v-icon>
                                        </v-avatar>
                                    </div>

                                    <div class="d-flex flex-column justify-center align-center">
                                        <div class="d-inline ml-3">
                                            <h4 class="text-left text-h6  mb-1 secondary--text">Llámanos</h4>
                                            <a class="base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0"
                                               href="tel:3138161129">+57 3138161129</a>
                                            <span
                                                class="base-body text-body-1 mx-auto grey--text text--darken-1 px-2">-</span>
                                            <a class="base-body text-body-1 mx-auto grey--text text--darken-1 text-left mb-0"
                                               href="tel:3504944938">+57 3504944938</a>
                                        </div>
                                    </div>
                                </div>
                                <hr role="separator" aria-orientation="horizontal" class="my-2 v-divider theme--light"/>
                                <div class="pt-2 mb-0 d-flex align-center">
                                    <div class="base-avatar d-inline-flex mb-3 align-self-start">
                                        <v-avatar class="grey lighten-2" size="72">
                                            <v-icon size="36" color="secondary ">mdi-email</v-icon>
                                        </v-avatar>
                                    </div>
                                    <div class="d-flex flex-column justify-center  align-center">
                                        <div class="d-inline ml-3">
                                            <h4 class="text-left text-h6  mb-1 secondary--text">Escríbenos</h4>
                                            <a href="mailto:informacion@ceindetec.org.co"
                                               class="text-body-1 grey--text text--darken-1 mb-0">informacion@ceindetec.org.co</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </v-col>

                    <v-col class="col-md-6 col-12">
                        <v-card outlined class="map-responsive">
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3979.432202889012!2d-73.62601908588987!3d4.13506119699349!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e3e2e71607f7927%3A0xc91b0a322b3e364b!2sCEINDETEC+Llanos!5e0!3m2!1ses-419!2sco!4v1542985312780"
                                width="100%"
                                height="400px"
                                frameborder="0"
                                style="border:0"
                                allowfullscreen=""
                            ></iframe>
                        </v-card>
                    </v-col>

                    <v-col class="col-12 d-flex justify-center">
                        <div>
                            <v-container class="container pa-0" space="4">
                                <v-row class="row no-gutters justify-start">
                                    <v-col class="col col-12">
                                        <h3 class="text-uppercase text-h6 font-weight-bold mb-1 text-left">ENVÍENOS SU
                                            MENSAJE</h3>
                                        <div class="v-responsive base-divider primary mr-auto mb-6"
                                             style="max-width: 28px;">
                                            <div class="v-responsive__content">
                                                <hr role="separator" aria-orientation="horizontal"
                                                    class="v-divider theme--light"/>
                                            </div>
                                        </div>
                                    </v-col>
                                </v-row>
                            </v-container>
                            <v-form
                                @submit.prevent="enviar(mail)"
                                ref="form"
                                class="pa-5"
                                v-model="valid"
                                :lazy-validation="false"
                            >
                                <v-card outlined>
                                    <v-card-text>
                                        <v-row>
                                            <v-col>
                                                <v-text-field v-model="mail.name"
                                                              dense
                                                              label="Nombre"
                                                              outlined/>
                                            </v-col>
                                            <v-col>
                                                <v-text-field v-model="mail.email"
                                                              dense
                                                              label="Email"
                                                              outlined/>
                                            </v-col>
                                        </v-row>
                                        <v-text-field v-model="mail.subject"
                                                      dense label="Asunto"
                                                      outlined/>

                                        <v-textarea v-model="mail.content"
                                                    dense
                                                    label="Descripción del mensaje"
                                                    outlined/>
                                        <div class="d-flex justify-center">
                                            <v-btn color="secondary" dark class="font-weight-bold "
                                                   @click="validate">
                                                Enviar mensaje
                                            </v-btn>
                                        </div>
                                    </v-card-text>
                                </v-card>
                            </v-form>
                        </div>
                    </v-col>
                </v-row>
            </v-container>
        </v-sheet>
    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';
import bg from '@/../images/computer3.jpg';

export default {
    components: {
        PageLayout,
        BreadCrumbs
    },
    name: 'ContactUs',
    data: () => ({
        bg,
        items: [
            {
                text: 'Inicio',
                disabled: false,
                href: '/'
            },

            {
                text: 'Contacto',
                disabled: true,
                href: '/contact-us'
            }
        ],
        valid: false,
        mail: {name: "", email: "", subject: "", content: ""},
    }),
    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
            this.overlay = true;
            const newMail = this.mail;
            axios
                .post("/send-mail", newMail)
                .then(res => {
                    this.overlay = false;
                    this.$swal(
                        "Mensaje enviado!",
                        "Mensaje enviado correctamente 😀",
                        "success"
                    );
                    this.reset();
                })
                .catch(res => {
                    this.$swal(
                        "Error en el envío",
                        "ha ocurrido un error en el envío del mensaje 😥",
                        "error"
                    );
                    this.overlay = false;
                });
            console.log(this.mail);
        },
        reset() {
            this.$refs.form.reset();
        },
        resetValidation() {
            this.$refs.form.resetValidation();
        }
    }
};
</script>

<style scoped></style>
