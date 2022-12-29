<template>
    <SimpleLayout :extension="false">

        <template v-slot:header>
            <p class="fill-height text-sm-h5  text-body-2 white--text font-weight-bold text-uppercase text-right  d-flex align-center mr-2 pt-5">
                Listado de instituciones
            </p>
        </template>

        <v-main>
            <v-container>
                <v-row>
                    <v-col>
                        <v-data-iterator
                            :items="headquarters"
                            :items-per-page.sync="itemsPerPage"
                            :page.sync="page"
                            :search="search"
                            :sort-by="sortBy.toLowerCase()"
                            :sort-desc="sortDesc"
                            hide-default-footer
                        >
                            <template v-slot:header>
                                <v-toolbar
                                    dark
                                    color="primary"
                                    class="mb-3 rounded-lg"
                                >
                                    <v-text-field
                                        v-model="search"
                                        clearable
                                        flat
                                        solo-inverted
                                        hide-details
                                        prepend-inner-icon="mdi-magnify"
                                        label="Buscar"
                                    ></v-text-field>

                                    <template v-if="$vuetify.breakpoint.mdAndUp">
                                        <v-spacer></v-spacer>
                                        <v-select
                                            v-model="sortBy"
                                            flat
                                            solo-inverted
                                            hide-details
                                            :items="keys"
                                            item-text="text"
                                            item-value="value"
                                            prepend-inner-icon="mdi-filter-variant"
                                            label="Ordenar por"
                                        ></v-select>
                                        <v-spacer></v-spacer>
                                        <v-btn-toggle
                                            v-model="sortDesc"
                                            mandatory
                                        >
                                            <v-btn
                                                large
                                                depressed
                                                color="secondary"
                                                :value="false"
                                            >
                                                <v-icon>mdi-arrow-up</v-icon>
                                            </v-btn>
                                            <v-btn
                                                large
                                                depressed
                                                color="secondary"
                                                :value="true"
                                            >
                                                <v-icon>mdi-arrow-down</v-icon>
                                            </v-btn>
                                        </v-btn-toggle>
                                    </template>
                                </v-toolbar>
                            </template>

                            <template v-slot:default="props">
                                <v-row class="d-flex justify-center">
                                    <v-col
                                        class="d-flex child-flex justify-center"
                                        cols="12"
                                        sm="6"
                                        md="4"
                                        lg="3"
                                        v-for="(item, n) in  props.items" :key="item.id"
                                    >
                                        <!--                                        <inertia-link href="#"
                                                                                              class="text-decoration-none">-->
                                        <v-hover v-slot="{ hover }">
                                            <v-card class="pa-0"
                                                    @click="getFolder(item.municipality,getEstablishment(item.establishment_id),item.name)">
                                                <v-img cover
                                                       :aspect-ratio="1/1"
                                                       style="transition: all 0.5s;"
                                                       :class="hover ? 'zoom' : ''"
                                                       :src="`/get/img/${encodeURIComponent(item.municipality+'/'+getEstablishment(item.establishment_id)+'/'+item.name)}/Img aula/`"
                                                >
                                                    <v-expand-transition>
                                                        <div
                                                            v-if="hover"
                                                            class="d-flex pa-2 transition-fast-in-fast-out primary darken-2 v-card--reveal text-h6 white--text"
                                                            style="height: 100%;"
                                                        >
                                                            <v-card>
                                                                <v-list-item>
                                                                    <v-list-item-content>
                                                                        <v-list-item-title
                                                                            class="text-subtitle-1 mb-1">
                                                                            {{ item.name }}
                                                                        </v-list-item-title>
                                                                        <v-list-item-subtitle>
                                                                            {{
                                                                                getEstablishment(item.establishment_id)
                                                                            }}
                                                                        </v-list-item-subtitle>
                                                                    </v-list-item-content>
                                                                </v-list-item>
                                                            </v-card>

                                                        </div>
                                                    </v-expand-transition>
                                                    e
                                                    <template v-slot:placeholder>
                                                        <v-row
                                                            class="fill-height ma-0"
                                                            align="center"
                                                            justify="center"
                                                        >
                                                            <loading-component/>
                                                        </v-row>

                                                    </template>
                                                </v-img>
                                            </v-card>

                                        </v-hover>
                                    </v-col>
                                </v-row>
                            </template>

                            <template v-slot:footer>
                                <v-row id="no-print"
                                       class="mt-2 px-2 d-flex d-inline align-start flex-column flex-sm-row"
                                       align="center"
                                       justify="center"
                                >
                                    <div>
                                        <span class="grey--text">elementos por página</span>

                                        <v-menu offset-y>
                                            <template v-slot:activator="{ on, attrs }">
                                                <v-btn
                                                    dark
                                                    text
                                                    color="primary"
                                                    class="ml-2"
                                                    v-bind="attrs"
                                                    v-on="on"
                                                >
                                                    {{ itemsPerPage }}
                                                    <v-icon>mdi-chevron-down</v-icon>
                                                </v-btn>
                                            </template>
                                            <v-list>
                                                <v-list-item
                                                    v-for="(number, index) in itemsPerPageArray"
                                                    :key="index"
                                                    @click="updateItemsPerPage(number)"
                                                >
                                                    <v-list-item-title>{{ number }}</v-list-item-title>
                                                </v-list-item>
                                            </v-list>
                                        </v-menu>
                                    </div>
                                    <v-spacer></v-spacer>

                                    <div class="d-flex">
                                        <v-btn
                                            :disabled="page===1"
                                            x-small
                                            fab
                                            text
                                            dark
                                            color="blue darken-3"
                                            class="mr-1"
                                            @click="formerPage"
                                        >
                                            <v-icon>mdi-chevron-left</v-icon>
                                        </v-btn>
                                        <div class="mr-1 grey--text">
                                            Página {{ page }} de {{ numberOfPages }}
                                        </div>
                                        <v-btn
                                            :disabled="page===numberOfPages"
                                            x-small
                                            fab
                                            text
                                            dark
                                            color="blue darken-3"
                                            class="ml-1"
                                            @click="nextPage"
                                        >
                                            <v-icon>mdi-chevron-right</v-icon>
                                        </v-btn>
                                    </div>
                                </v-row>
                            </template>

                        </v-data-iterator>
                    </v-col>
                </v-row>


            </v-container>

        </v-main>
    </SimpleLayout>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import loadingComponent from "@/Components/LoadingComponent.vue";

export default {
    name: "List",
    components: {SimpleLayout, loadingComponent},
    data: () => ({
        establishments: [],
        headquarters: [],
        headers: [
            {
                text: 'Id',
                align: 'start',
                sortable: false,
                value: 'id',
            },
            {text: 'Nombre', value: 'name'},
            {text: 'Establecimiento', value: 'establishments_id'},
            {text: 'Municipio', value: 'municipality'},
            {text: 'Departamento', value: 'department'},
        ],
        selectedEstablishment: null,
        search: null,
        page: 1,
        sortBy: 'Municipio',
        sortDesc: null,
        keys: [
            {text: 'Municipio', value: 'municipality'},
            {text: 'Departamento', value: 'department'},
            {text: 'Establecimiento', value: 'establishments_id'},
            {text: 'Sede', value: 'name'},
            {text: 'Creado en ', value: 'created_at'},
            {text: 'Actualizado en', value: 'updated_at'},
            {text: 'Creado en', value: 'created_at'},
        ],
        itemsPerPageArray: [6, 9, 12, 15, 21, 30, 'all'],
        itemsPerPage: null,
    }),

    created() {
        if (this.$vuetify.breakpoint.smAndDown) {
            this.itemsPerPage = 6
        } else if (this.$vuetify.breakpoint.mdAndUp) {
            this.itemsPerPage = 12
        } else {
            this.itemsPerPage = 9
        }

        axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                this.establishments = response.data
            })
            .catch((error) => {
                console.log(error)
            })

        axios.get('/dashboard/headquarters/all')
            .then((response) => {
                //console.log(response.data)
                this.headquarters = response.data
            })
            .catch((error) => {
                console.log(error)
            });

        this.getFolder("")
    },

    computed: {

        numberOfPages() {
            try {
                return Math.ceil(this.headquarters.length / this.itemsPerPage)
            } catch (e) {

            }
        },
        filteredKeys() {
            return this.keys.filter(key => key !== 'consecutive')
        },

    },
    methods: {

        getFirstImage(municipality, establishment, headquarters) {
            try {

                let ruta = municipality + '/' + establishment + '/' + headquarters;
                ruta = encodeURIComponent(ruta)

                let url = '/get/img/' + ruta + '/Img entregas/';
                console.log(url)
                return axios.get(url)

            } catch (e) {
                console.log(e)
            }
        },
        getFolder(municipality, establishment, headquarters) {
            try {

                let ruta = municipality + '/' + establishment + '/' + headquarters;
                ruta = encodeURIComponent(ruta)
                let url = '/get/src/' + ruta
                console.log(url)
                axios.get(url)

            } catch (e) {
                console.log(e)
            }

        },
        getEstablishment(id) {
            try {
                let found = this.establishments.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },

        nextPage() {
            if (this.page + 1 <= this.numberOfPages) this.page += 1
        },
        formerPage() {
            if (this.page - 1 >= 1) this.page -= 1
        },
        updateItemsPerPage(number) {
            if (number === 'all') {
                this.itemsPerPage = this.headquarters.length
            } else {
                this.itemsPerPage = number
            }
        },
    }
}
</script>

<style scoped>
.v-card--reveal {
    align-items: center;
    bottom: 0;
    justify-content: center;
    opacity: .8;
    position: absolute;
    width: 100%;
}

/*zoom en imagenes*/
.v-image .v-image__image {
    transition: all 0.6s;
}

.v-image.zoom .v-image__image {
    transform: scale(1.2);
}

.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}
</style>
