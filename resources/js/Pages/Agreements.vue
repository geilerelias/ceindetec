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
                            <v-row
                                class="ma-0 fill-height text-center d-flex align-center justify-center"
                            >
                                <v-col class="col-12">
                                    <h1
                                        class="text-h3 font-weight-500 mb-2  white--text animate__animated animate__zoomIn"
                                    >
                                        Convenios
                                    </h1>
                                    <v-responsive
                                        dense
                                        class="secondary mx-auto mb-6 base-divider--dense"
                                        style="max-width: 28px;"
                                    >
                                        <div class="v-responsive__content">
                                            <v-divider></v-divider>
                                        </div>
                                    </v-responsive>
                                    <v-breadcrumbs
                                        class="secondary--text justify-center pa-0 theme--dark "
                                        :items="items"
                                        divider="/"
                                    >
                                        <template v-slot:item="{ item }">
                                            <v-breadcrumbs-item
                                                :href="item.href"
                                                :disabled="item.disabled"
                                            >
                                                <span
                                                    :class="
                                                        item.disabled
                                                            ? 'white--text'
                                                            : 'secondary--text'
                                                    "
                                                >
                                                    {{
                                                        item.text.toUpperCase()
                                                    }}
                                                </span>
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
    </page-layout>
</template>

<script>
import PageLayout from '@/Layouts/PageLayout.vue';
import BreadCrumbs from '@/Components/BreadCrumbs.vue';
import bg from '@/../images/computer3.jpg';
export default {
    name: 'Allies',
    components: {
        PageLayout,
        BreadCrumbs
    },
    data: () => ({
        bg,
        items: [
            {
                text: 'Inicio',
                disabled: false,
                href: '/'
            },

            {
                text: 'Convenios',
                disabled: true,
                href: '/contact-us'
            }
        ]
    })
};
</script>

<style scoped></style>
