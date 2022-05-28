<template>
    <app-layout>
        <bread-crumbs name="Establecimientos" :items="items"></bread-crumbs>
        <v-container class="d-flex justify-center">
            <div>
                <v-data-table v-model="selectedEstablishment" :headers="headers" :items="data" :search="search"
                              class="elevation-1" single-select single-expand show-select show-expand>
                    <template v-slot:top>
                        <v-toolbar flat>
                            <v-text-field class="mr-3" v-model="search" append-icon="mdi-magnify" label="Search"
                                          single-line hide-details></v-text-field>
                            <v-divider class="mx-4" inset vertical></v-divider>
                            <v-spacer></v-spacer>

                            <inertia-link :href="route('establishment.create')">
                                <v-btn color="primary" dark class="mb-2"
                                       :loading="loadingNewItem" :disabled="loadingNewItem">
                                    New Item
                                </v-btn>
                            </inertia-link>

                            <v-dialog v-model="dialog" max-width="500px">
                                <template v-slot:activator="{ on, attrs }">


                                </template>
                                <v-card>Registro de estableciemunto
                                    <v-card-title>
                                        <span class="text-h5">{{ formTitle }}</span>
                                    </v-card-title>

                                    <v-card-text>
                                        <v-container>
                                            <v-row>
                                                <v-col cols="12">
                                                    <v-text-field v-model="editedItem.name" label="Name"></v-text-field>
                                                </v-col>
                                            </v-row>
                                        </v-container>

                                    </v-card-text>

                                    <v-card-actions>
                                        <v-spacer></v-spacer>
                                        <v-btn color="blue darken-1" text @click="close">
                                            Cancel
                                        </v-btn>
                                        <v-btn v-if="editedIndex === -1" color="blue darken-1" text
                                               @click="save(editedItem)">
                                            Save
                                        </v-btn>
                                        <v-btn v-else color="blue darken-1" text @click="update(editedItem)">
                                            update
                                        </v-btn>
                                    </v-card-actions>
                                </v-card>
                            </v-dialog>
                        </v-toolbar>
                    </template>


                    <template v-slot:item.actions="{ item }">
                        <v-icon small class="mr-2" @click="editItem(item)" :loading="loadingEditItem"
                                :disabled="loadingEditItem">
                            mdi-pencil
                        </v-icon>
                        <v-icon small @click="deleteItem(item)" :loading="loadingDeleteItem"
                                :disabled="loadingDeleteItem">
                            mdi-delete
                        </v-icon>
                    </template>

                    <template v-slot:expanded-item="{ headers, item }">
                        <td :colspan="headers.length">
                            established permissions:
                            <v-chip v-for="permission in item.permission" :key="permission.id" class="ma-2 white--text"
                                    color="indigo" small>
                                {{ permission.name }}
                            </v-chip>
                        </td>
                    </template>

                    <template v-slot:no-data>
                        <v-btn color="primary" @click="initialize">
                            Reset
                        </v-btn>
                    </template>
                </v-data-table>
            </div>
        </v-container>
    </app-layout>
</template>


<script>
import AppLayout from '@/Layouts/AppLayout';
import BreadCrumbs from '@/Components/BreadCrumbs';

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
                text: 'Establecimientos',
                disabled: true,
                href: ''
            }
        ],
        loadingNewItem: false,
        loadingEditItem: false,
        loadingDeleteItem: false,
        selectedEstablishment: [],
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
            {text: 'name', value: 'name'},
            {text: 'nit', value: 'nit'},
            {text: 'dane', value: 'dane'},
            {text: 'icfes_code', value: 'icfes_code'},
            {text: 'direction', value: 'direction'},
            {text: 'ciudad', value: 'ciudad'},
            {text: 'departamento', value: 'departamento'},
            {text: 'email', value: 'email'},
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

    },
    computed: {
        formTitle() {
            return this.editedIndex === -1 ? 'New Item' : 'Edit Item'
        },
    },

    watch: {
        selectedEstablishment(val) {
            if (val.length > 0) {
                //console.log('selected Rol', val[0])
                this.selectedPermission = [];
                let permissions = val[0].permission;
                // console.log(permissions);
                //console.log(this.permission);

                for (const valKey in permissions) {
                    let res = this.permission.find(item => item.name === permissions[valKey].name);
                    this.selectedPermission.push(res)
                }

                //console.log(this.selectedPermission)
            }
        },

        dialog(val) {
            val || this.close()
        },
    },

    methods: {
        grantPermissions() {
            if (this.selectedEstablishment.length > 0) {
                if (this.selectedPermission.length > 0) {
                    let permissionArray = [];
                    for (let i = 0; i < this.selectedPermission.length; i++) {
                        // console.log(this.selectedPermission[i])
                        permissionArray.push(this.selectedPermission[i].name)
                    }

                    let data = {Establishment: this.selectedEstablishment[0].id, permission: permissionArray};
                    this.$inertia.post('/establishment/assign/permissions', data, {
                        onStart: (visit) => {
                            console.log('onStart', visit)
                            this.loading = true;
                        },
                        onSuccess: (page) => {
                            this.$swal({
                                icon: `${page.props.errors.name ? 'error' : 'success'}`,
                                title: `${page.props.errors.name ? 'Oops...' : 'Good job!'}`,
                                text: `${page.props.errors.name ? page.props.errors.name[0] : page.props.flash.message}`
                            })
                        },
                        onError: (errors) => {
                            this.$swal(
                                'Opps...!',
                                'Excuse me, an error occurred.',
                                'warning'
                            )
                        },
                        onFinish: visit => {
                            this.loading = false;
                        },
                    })
                } else {
                    this.$swal(
                        'Opps...!',
                        'you must select a permission.',
                        'warning'
                    )
                }
            } else {
                this.$swal(
                    'Opps...!',
                    'you must select a Establishment.',
                    'warning'
                )
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

        update(data) {
            data._method = 'PUT';
            this.$inertia.post('/establishment/' + data.id, data, {
                onStart: (visit) => {
                    this.loadingEditItem = true;
                },
                onSuccess: (page) => {
                    this.$swal({
                        icon: `${page.props.errors.name ? 'error' : 'success'}`,
                        title: `${page.props.errors.name ? 'Oops...' : 'Good job!'}`,
                        text: `${page.props.errors.name ? page.props.errors.name[0] : page.props.flash.message}`
                    })
                },
                onError: (errors) => {
                    this.$swal(
                        'Opps...!',
                        'Excuse me, an error occurred.',
                        'warning'
                    )
                },
                onFinish: visit => {
                    this.loadingEditItem = false;
                },
            })
            this.reset();
            this.closeModal();
            this.editMode = false;
            this.close()
        },

        editItem(item) {
            this.editedIndex = this.data.indexOf(item)
            console.log(this.editedIndex)
            this.editedItem = Object.assign({}, item)
            this.dialog = true
        },

        deleteItem(item) {
            item._method = 'DELETE';
            this.$swal({
                title: 'Are you sure you want to delete this item?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.$inertia.post('/establishment/' + item.id, item, {
                        onStart: (visit) => {
                            this.loadingDeleteItem = true;
                        },
                        onSuccess: (page) => {
                            this.$swal(
                                'Deleted!',
                                'Your item has been deleted.',
                                'success'
                            )
                        },
                        onError: (errors) => {
                            this.$swal(
                                'Opps...!',
                                'Excuse me, an error occurred.',
                                'warning'
                            )
                        },
                        onFinish: visit => {
                            this.loadingDeleteItem = false;
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
        }
        ,

        save(data) {
            if (this.editedIndex === -1) {
                console.log('save')
                this.$inertia.post('/Establishment', data, {

                    onStart: (visit) => {
                        this.loadingNewItem = true;
                    },
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
                    onFinish: visit => {
                        this.loadingNewItem = false;
                        this.reset();
                        this.closeModal();
                        this.editMode = false;
                        this.close()
                    },
                });
            } else {
                console.log('update')
                this.$inertia.put('/posts/' + data.id, data, {
                    onSuccess: (page) => {
                        console.log(page)
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
                    onFinish: visit => {
                        this.reset();
                        this.closeModal();
                        this.editMode = false;
                        this.close()
                    },

                })
            }


        }
        ,
        initialize() {
            location.reload();
        }
    }
}
</script>

<style scoped>
</style>
