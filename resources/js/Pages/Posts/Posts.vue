<template>
    <app-layout>
        <bread-crumbs name="Posts" :items="items"></bread-crumbs>
        <v-container class="py-12">
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-card-text class="">
                            <v-row class=" no-gutters">
                                <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                    <v-btn
                                        @click="isOpen = !isOpen"
                                        class="mr-3 success">
                                        <v-icon class="notranslate mr-2">
                                            mdi-plus
                                        </v-icon>
                                        Add
                                    </v-btn>

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
                            :headers="headers"
                            :items="data"
                            sort-by="calories"
                            :search="search"
                            class="elevation-1"
                        >
                            <template v-slot:item.actions="{ item }">
                                <v-icon
                                    small
                                    class="mr-2"
                                    @click="edit(item)"
                                >
                                    mdi-pencil-outline
                                </v-icon>
                                <v-icon
                                    small
                                    @click="deleteRow(item)"
                                >
                                    mdi-delete-outline
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
                </v-col>
            </v-row>
        </v-container>

        <v-dialog
            v-model="isOpen"
            max-width="800"
        >
            <v-card class="pa-6">
                <v-card-text>
                    <v-text-field
                        v-model="form.title"
                        :counter="10"
                        label="Title"
                        required
                    ></v-text-field>
                    <div v-if="$page.errors.title" class="text-red-500">{{
                            $page.errors.title[0]
                        }}
                    </div>

                    <v-textarea
                        v-model="form.body"
                        label="Body"
                        required
                    ></v-textarea>

                    <div v-if="$page.errors.body" class="text-red-500">{{
                            $page.errors.body[0]
                        }}
                    </div>
                    <div class="d-flex justify-end">
                        <v-btn wire:click.prevent="store()" type="button"
                               v-show="!editMode" @click="save(form)"
                               class="primary mx-1" dark>
                            Save
                        </v-btn>

                        <v-btn wire:click.prevent="store()" type="button"
                               v-show="editMode" @click="update(form)"
                               class="primary x-1" dark>
                            Update
                        </v-btn>

                        <v-btn @click="closeModal()" type="button"
                               class="secondary mx-1" dark>
                            Cancel
                        </v-btn>
                    </div>
                </v-card-text>
            </v-card>
        </v-dialog>
    </app-layout>
</template>
<script>
import AppLayout from '../../Layouts/AppLayout'
import BreadCrumbs from "../../Components/BreadCrumbs";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
    },
    props: ['data', 'errors'],
    data() {
        return {
            editMode: false,
            isOpen: false,
            search: '',
            form: {
                title: null,
                body: null,
            },
            headers: [
                {
                    text: 'Id',
                    align: 'start',
                    sortable: false,
                    value: 'id',
                },
                {text: 'Title', value: 'title',},
                {text: 'Body', value: 'body'},
                {text: 'Actions', value: 'actions', sortable: false},
            ],
            editedIndex: -1,
            editedItem: {
                name: '',
            },
            defaultItem: {
                name: '',
            },
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'breadcrumbs_dashboard',
                },
                {
                    text: 'Link 1',
                    disabled: false,
                    href: 'breadcrumbs_link_1',
                },
                {
                    text: 'Link 2',
                    disabled: true,
                    href: 'breadcrumbs_link_2',
                },
            ],
        }
    },
    methods: {
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.reset();
            this.editMode = false;
        },
        reset: function () {
            this.form = {
                title: null,
                body: null,
            }
        },
        save: function (data) {
            this.$inertia.post('/posts', data, {
                onSuccess: page => {
                    this.$swal(
                        'Good job!',
                        this.$page.flash.message,
                        'success'
                    )
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
                onError: errors => {
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
                onFinish: visit => {
                    this.reset();
                    this.closeModal();
                    this.editMode = false;
                },
            })

        },
        edit: function (data) {
            this.form = Object.assign({}, data);
            this.editMode = true;
            this.openModal();
        },
        update: function (data) {
            data._method = 'PUT';
            this.$inertia.post('/posts/' + data.id, data, {
                onSuccess: page => {
                    this.$swal(
                        'Good job!',
                        'updated post successfully!',
                        'success'
                    )
                    this.reset();
                    this.closeModal();
                },
                onError: errors => {
                    this.reset();
                    this.closeModal();
                },
                onFinish: visit => {
                    this.reset();
                    this.closeModal();
                },
            })
        },
        deleteRow: function (data) {

            this.$swal({
                title: 'Are you sure?',
                text: "this option cannot be reversed.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {


                if (result.isConfirmed) {
                    data._method = 'DELETE';
                    this.$inertia.post('/posts/' + data.id, data)
                    this.reset();
                    this.closeModal();

                    this.$swal(
                        'Deleted!',
                        'Your post has been deleted.',
                        'success'
                    )
                }
            })

        },
        initialize() {
        }
    }
}
</script>
