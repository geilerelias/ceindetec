<template>
    <app-layout>
        <bread-crumbs name="Sedes de Establecimientos" :items="items"></bread-crumbs>
        <v-container>
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-card-text class="">
                            <v-row class=" no-gutters">
                                <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                    <inertia-link :href="route('headquarters.create')">
                                        <v-btn
                                            class="mr-3 success">
                                            <v-icon class="notranslate mr-2">
                                                mdi-plus
                                            </v-icon>
                                            Add
                                        </v-btn>
                                    </inertia-link>
                                    <v-btn outlined
                                           class="button-shadow primary--text">
                                        <v-icon aria-hidden="true"
                                                class="notranslate mr-2">
                                            mdi-filter-variant
                                        </v-icon>
                                        Filters
                                    </v-btn>
                                </div>
                                <v-spacer></v-spacer>

                                <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                    <v-text-field hide-details dense enclosed outlined
                                                  append-icon="mdi-magnify"
                                                  placeholder="search"
                                                  v-model="search"
                                    ></v-text-field>
                                </div>
                            </v-row>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-data-table
                            v-model="selectedEstablishment"
                            :headers="headers"
                            :items="data"
                            sort-by="calories"
                            :search="search"
                            class="elevation-1"
                        >

                            <template v-slot:item.establishments_id="{item}">
                                <span>
                                    {{ getEstablishment(item.establishment_id) }}
                                </span>
                            </template>
                            <template v-slot:item.actions="{ item }">
                                <div class="d-flex">
                                    <v-icon
                                        size="24"
                                        color="secondary"
                                        class="mr-2"
                                        @click="showItem(item)"
                                    >
                                        mdi-information-outline
                                    </v-icon>
                                    <v-icon
                                        size="24"
                                        color="secondary"
                                        class="mr-2"
                                        @click="editItem(item)"
                                    >
                                        mdi-pencil-outline
                                    </v-icon>
                                    <v-icon
                                        size="24"
                                        color="secondary"
                                        @click="deleteItem(item)"
                                    >
                                        mdi-delete-outline
                                    </v-icon>
                                </div>
                            </template>

                            <template v-slot:no-data>
                                <v-btn
                                    color="primary"
                                    @click="initialize"
                                >
                                    Reset
                                </v-btn>
                            </template>
                        </v-data-table>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </app-layout>
</template>


<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import BreadCrumbs from '@/Components/BreadCrumbs.vue';

export default {
    name: 'Index',
    components: {
        AppLayout,
        BreadCrumbs
    },
    props: ['data', 'errors'],

    data: () => ({
        items: [
            {
                text: 'Dashboard',
                disabled: false,
                href: '/'
            },
            {
                text: 'Sedes de Establecimientos',
                disabled: true,
                href: ''
            }
        ],
        headerTooltips: {
            name: 'Name tooltip',
            calories: 'Calories tooltip',
            fat: 'Fat tooltip'
        },
        loadingNewItem: false,
        loadingEditItem: false,
        loadingDeleteItem: false,
        selectedEstablishment: [],
        establishments: [],
        selectedPermission: [],
        //Establishment: [],
        permission: [],
        editMode: false,
        isOpen: false,
        search: '',
        searchPermission: '',
        form: {
            id: null,
            name: null,
        },

        dialog: false,
        dialogDelete: false,
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
            {text: 'Actions', value: 'actions', sortable: false},
        ],
        loading: false,

        editedIndex: -1,
        editedItem: {
            name: '',
        },
        defaultItem: {
            name: '',
        },
    }),

    created() {
        axios.get(`/dashboard/establishment/all`)
            .then((response) => {
                console.log(response.data)
                this.establishments = response.data
            })
    },

    methods: {
        getEstablishment(id) {
            try {
                let found = this.establishments.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },

        editItem(item) {
            this.$inertia.get(this.route('headquarters.edit', item.id));
        },

        showItem(item) {
            this.$inertia.get(this.route('headquarters.show', item.id));
        },

        deleteItem(item) {
            item._method = 'DELETE';
            this.$swal({
                title: '¿Está seguro de que desea eliminar este elemento?',
                text: "¡No podrás revertir esto!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, Eliminarlo!'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post(this.route('headquarters.destroy', item.id), item, {
                        onStart: (visit) => {
                            this.loadingDeleteItem = true;
                        },
                        onSuccess: (page) => {
                            console.log("estamos eliminando la info", page)
                            this.$swal({
                                icon: `${page.props.errors.message ? 'error' : 'success'}`,
                                title: `${page.props.errors.message ? 'Ups...' : '¡Buen trabajo!'}`,
                                text: `${page.props.errors.message ? page.props.errors.message : page.props.flash.message}`
                            })
                        },
                        onError: (errors) => {
                            this.$swal(
                                '¡Ay...!',
                                'Disculpe, ocurrió un error.',
                                'warning'
                            )
                        },
                        onFinish: visit => {
                            this.loadingDeleteItem = false;
                        },
                    })

                }
            })
        },

        initialize() {
            this.$inertia.get(this.route('headquarters.index'));
        }
    }
}
</script>

<style scoped>
/*.v-data-table >>> th, .v-data-table >>> th > i {*/
/*    font-size: 0.8rem;*/
/*    color: white !important;*/
/*    font-weight: bold;*/
/*    background-color: #001C47;*/
/*}*/

</style>
