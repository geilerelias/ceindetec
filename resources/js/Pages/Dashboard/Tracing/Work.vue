<template>
    <app-layout>
        <bread-crumbs name="Obras" :items="items"></bread-crumbs>

        <v-container class="d-flex justify-center">
            <v-card>
                <v-data-table
                    :headers="headers"
                    :items="data"
                    sort-by="calories"
                    :search="search"
                    class="elevation-1"
                >
                    <template v-slot:top>
                        <v-toolbar
                            flat
                        >
                            <v-text-field
                                class="mr-3"
                                v-model="search"
                                append-icon="mdi-magnify"
                                label="Search"
                                single-line
                                hide-details
                            ></v-text-field>
                            <v-divider
                                class="mx-4"
                                inset
                                vertical
                            ></v-divider>
                            <v-spacer></v-spacer>


                            <v-dialog
                                v-model="dialog"
                                max-width="800px"
                            >
                                <template v-slot:activator="{ on, attrs }">
                                    <v-btn
                                        color="primary"
                                        dark
                                        class="mb-2"
                                        v-bind="attrs"
                                        v-on="on"
                                    >
                                        New Item
                                    </v-btn>
                                </template>
                                <v-card>
                                    <v-card-title>
                                        <span class="text-h5">{{ formTitle }}</span>
                                    </v-card-title>

                                    <v-card-text>
                                        <v-container>
                                            <v-row>
                                                <v-col class="col-12 col-sm-6">
                                                    <v-select
                                                        v-model="editedItem.establishments_id"
                                                        :items="establishments"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Establecimiento al que pertenece"
                                                        @change="getHeadquarters"
                                                        :rules="[rules.required]">
                                                    </v-select>
                                                </v-col>
                                                <v-col class="col-12 col-sm-6">
                                                    <v-select
                                                        :disabled="editedItem.establishments_id===null"
                                                        v-model="editedItem.headquarters_id"
                                                        :items="headquarters"
                                                        item-text="name"
                                                        item-value="id"
                                                        label="Sede a la que pertenece"
                                                        :rules="[rules.required]">
                                                    </v-select>
                                                </v-col>


                                                <v-col
                                                    cols="12"
                                                >
                                                    <v-select
                                                        v-model="editedItem.work_type"
                                                        :items="['Adecuación','Construcción']"
                                                        label="Tipo de obra"
                                                        :rules="[rules.required]"
                                                    ></v-select>
                                                </v-col>
                                                <v-col
                                                    cols="12"
                                                >
                                                    <v-textarea
                                                        v-model="editedItem.coordinates"
                                                        label="Coordenadas"
                                                        :rules="[rules.required]"
                                                    ></v-textarea>
                                                </v-col>
                                            </v-row>
                                        </v-container>
                                    </v-card-text>

                                    <v-card-actions>
                                        <v-spacer></v-spacer>
                                        <v-btn
                                            color="secondary"
                                            @click="close"
                                        >
                                            Cancelar
                                        </v-btn>
                                        <v-btn v-if="editedIndex === -1"
                                               color="primary"
                                               @click="save(editedItem)"
                                        >
                                            Guardar
                                        </v-btn>
                                        <v-btn v-else
                                               color="primary"
                                               text
                                               @click="update(editedItem)"
                                        >
                                            Actualizar
                                        </v-btn>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                        </v-toolbar>
                    </template>


                    <template v-slot:item.establishments_id="{item}">
                                <span>
                                    {{ getEstablishmentsById(item.establishments_id) }}
                                </span>
                    </template>

                    <template v-slot:item.headquarters_id="{item}">
                        <span>
                           {{ getHeadquartersById(item.headquarters_id) }}
                        </span>
                    </template>

                    <template v-slot:item.actions="{ item }">
                        <v-icon
                            small
                            class="mr-2"
                            @click="editItem(item)"
                        >
                            mdi-pencil
                        </v-icon>
                        <v-icon
                            small
                            @click="deleteItem(item)"
                        >
                            mdi-delete
                        </v-icon>
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
        </v-container>
        <spinner-component :value="saving"></spinner-component>
    </app-layout>
</template>
<script>
import AppLayout from '@/Layouts/AppLayout.vue'
import BreadCrumbs from "@/Components/BreadCrumbs.vue";
import colombiaJson from "../../../../assets/colombia.json";
import SpinnerComponent from "@/Components/SpinnerComponent.vue";

export default {
    name: "Work",
    components: {
        AppLayout,
        BreadCrumbs,
        SpinnerComponent
    },
    props: ['data', 'errors'],
    data() {
        return {
            saving: false,
            editMode: false,
            isOpen: false,
            search: '',
            form: {
                id: null,
                name: null,
            },

            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: '/dashboard',
                },
                {
                    text: 'Obras',
                    disabled: true,
                    href: '#',
                },
            ],

            dialog: false,
            dialogDelete: false,
            headers: [
                {
                    text: 'Id',
                    align: 'start',
                    sortable: false,
                    value: 'id',
                },
                {text: 'Tipo de obra', value: "work_type"},
                {text: 'Sede', value: "headquarters_id"},
                {text: 'Establecimiento', value: "establishments_id"},
                {text: 'Actions', value: 'actions', sortable: false},
            ],
            desserts: [],
            establishments: [],
            headquarters: [],
            allHeadquarters: [],
            editedIndex: -1,
            editedItem: {
                work_type: null,
                coordinates: null,
                establishments_id: null,
                headquarters_id: null,
            },
            defaultItem: {
                work_type: null,
                coordinates: null,
                establishments_id: null,
                headquarters_id: null,
            },
            rules: {
                required: value => !!value || 'Campo requerido.',
                max: value => value.length <= 20 || 'Máximo 20 caracteres',
                min: value => value.length >= 10 || 'Mínimo 10 caracteres',
                email: value => {
                    const pattern = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
                    return pattern.test(value) || 'Invalid e-mail.'
                },
                phone: value => {
                    const pattern = /^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/;
                    return pattern.test(value) || 'Numero telefónico invalido.'

                },
                text: value => {
                    const pattern = /^\s+$/;
                    return pattern.test(value) || 'Solo caracteres alfabéticos.'

                },
                number: value => {
                    const pattern = /^\d+$/;
                    return pattern.test(value) || 'solo caracteres numéricos.'

                }
            },
        }
    },
    created() {
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
                this.allHeadquarters = response.data
            })
            .catch((error) => {
                console.log(error)
            })
    },
    computed: {
        formTitle() {
            return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
        },
    },

    watch: {
        dialog(val) {
            val || this.close()
        },
    },

    methods: {
        getHeadquarters() {
            let id = this.editedItem.establishments_id;

            if (id !== null) {
                axios.get(`/dashboard/establishment/${id}/headquarters`)
                    .then((response) => {
                        this.headquarters = response.data
                    })
                    .catch((error) => {
                        console.log(error)
                    })
            }

        },
        getHeadquartersById(id) {
            try {
                let found = this.allHeadquarters.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
        getEstablishmentsById(id) {
            try {
                let found = this.establishments.find(element => element.id === id);
                return found.name;
            } catch (e) {
                return null;
            }
        },
        closeModal: function () {
            this.isOpen = false;
            this.reset();
            this.editMode = false;
        },
        reset() {
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })
        },


        editItem(item) {
            this.editedIndex = this.data.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialog = true
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
                    this.$inertia.post(this.route('work.destroy', +item.id), item, {
                        onStart: () => {
                            this.saving = true;
                        },
                        onSuccess: (page) => {
                            // console.log("estamos eliminando la info", page)
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
                            this.saving = false;
                        },
                    })
                    this.$nextTick(() => {
                        this.editedItem = Object.assign({}, this.defaultItem)
                        this.editedIndex = -1
                    })
                }
            })

            this.reset();
        },


        close() {
            this.dialog = false
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })
        },

        save(data) {
            this.saving = true;
            if (this.editedIndex === -1) {

                this.$inertia.post(this.route('work.store', data.id), data, {
                    onSuccess: (page) => {
                        this.$swal({
                            icon: `${page.props.errors.name ? 'error' : 'success'}`,
                            title: `${page.props.errors.name ? 'Oops...' : '¡Buen trabajo!'}`,
                            text: `${page.props.errors.name ? page.props.errors.name[0] : page.props.flash.message}`
                        })
                    },
                    onError: (errors) => {
                        console.log(errors)
                        this.$swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: this.errors.errors.name[0],
                        })
                    },
                    onFinish: () => {
                        this.saving = false
                    }
                });

            } else {
                this.$inertia.post(this.route('work.update', data.id), data, {
                    onSuccess: (page) => {
                        this.$swal({
                            icon: `${page.props.errors.name ? 'error' : 'success'}`,
                            title: `${page.props.errors.name ? 'Oops...' : '¡Buen trabajo!'}`,
                            text: `${page.props.errors.name ? page.props.errors.name[0] : page.props.flash.message}`
                        })
                    },
                    onError: (errors) => {
                        console.log(errors)
                        this.$swal({
                            icon: 'error',
                            title: 'Oops...',
                            text: this.errors.errors.name[0],
                        })
                    },
                    onFinish: () => {
                        this.saving = false
                    }
                })
            }

            this.reset();
            this.closeModal();
            this.editMode = false;
            this.close()
        },
        initialize() {
            this.saving = true;
            this.$inertia.get(this.route('work.index'), null, {
                onFinish: () => {
                    this.saving = false;
                }
            });
        }
    }
}
</script>
