<template>
    <app-layout>
        <bread-crumbs name="Gestión de los Miembros de la Comunidad educativa" :items="items"></bread-crumbs>
        <v-container class="py-12">
            <v-row class="ma-0">
                <v-col>
                    <v-card style="width: 100%;">
                        <v-card-text class="">
                            <v-row class=" no-gutters">
                                <div class="d-flex justify-space-between justify-md-start col-md-6 col-12">
                                    <v-btn
                                        @click="create()"
                                        class="mr-3 success">
                                        <v-icon class="notranslate mr-2">
                                            mdi-plus
                                        </v-icon>
                                        Agregar
                                    </v-btn>

                                    <v-btn outlined
                                           class="button-shadow primary--text">
                                        <v-icon aria-hidden="true"
                                                class="notranslate mr-2">
                                            mdi-filter-variant
                                        </v-icon>
                                        Filtros
                                    </v-btn>
                                </div>
                                <v-spacer></v-spacer>

                                <div style="max-width: 250px;" class="mx-auto mt-4 mt-md-0">
                                    <v-text-field hide-details dense enclosed outlined
                                                  append-icon="mdi-magnify"
                                                  placeholder="Buscar"
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

                            <template v-slot:item.profile_photo_path="{ item }">
                                <v-img
                                    height="40"
                                    width="40"
                                    cover
                                    :aspect-ratio="1/1"
                                    class="elevation-4 rounded-circle"
                                    :src="`/storage/${item.profile_photo_path}`"
                                    :alt="item.profile_photo_path!==null?item.name:`/src/avatar/null/null/${item.gender}.jpg`"
                                />
                            </template>
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
                                    class="mr-2"
                                    @click="deleteRow(item)"
                                >
                                    mdi-delete-outline
                                </v-icon>
                                <inertia-link :href="route('person.show',item.id)">
                                    <v-icon
                                        small
                                        @click="view(item)"
                                    >
                                        mdi-eye-outline
                                    </v-icon>
                                </inertia-link>
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
        <create-update :close="closeModal" :open="isOpen" :edit="editMode" :data="form"></create-update>
    </app-layout>
</template>
<script>
import AppLayout from '@/Layouts/AppLayout'
import BreadCrumbs from "@/Components/BreadCrumbs";

export default {
    components: {
        AppLayout,
        BreadCrumbs,
        CreateUpdate: () => import('@/Pages/Dashboard/Person/CreateEdit'),
    },
    props: ['data', 'errors'],
    data() {
        return {
            modalShow: false,
            saving: false,
            establishments: [],
            studyPlans: [],
            editMode: false,
            isOpen: false,
            search: '',
            person: Object,
            headers: [
                {
                    text: 'ID',
                    align: 'start',
                    sortable: false,
                    value: 'id',
                },
                {text: 'IMAGEN', value: 'profile_photo_path',},
                {text: 'NOMBRES', value: 'name',},
                {text: 'APELLIDOS', value: 'surname',},
                {text: 'TIPO DOC.', value: 'identification_type',},
                {text: 'NUM. DOC.', value: 'identification_number',},
                {text: 'CARGO', value: 'person_type',},
                {text: 'ACCIONES', value: 'actions', sortable: false},
            ],
            items: [
                {
                    text: 'Dashboard',
                    disabled: false,
                    href: 'dashboard',
                },
                {
                    text: 'Miembros de la comunidad educativa',
                    disabled: true,
                    href: 'areas.index',
                }
            ],

            form: null,
        }
    },

    methods: {

        ConvertStringToHTML(str) {
            let parser = new DOMParser();
            let doc = parser.parseFromString(str, 'text/html');
            /*  console.log("este es el objeto => ", doc.body)
              doc.body.className = "text-truncate";
              for (const property in doc.body) {
                  console.log("este es un elemento => ", property);
              }*/
            return doc.body.innerText;
        },
        getActualYear() {
            return new Date(Date.parse(`${new Date().getFullYear().toString()}-01-01`)).toISOString().slice(0, 7);
        },
        create: function () {
            this.editMode = false;
            this.openModal();
        },
        edit: function (data) {
            this.form = Object.assign({}, data);
            this.editMode = true;
            this.openModal();
        },
        openModal: function () {
            this.isOpen = true;
        },
        closeModal: function () {
            this.isOpen = false;
            this.editMode = false;
        },


        deleteRow(item) {
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
                    this.$inertia.post(this.route('person.destroy', item.id), item, {
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

        view(item) {

        },

        initialize() {
            this.$inertia.get(this.route('person.index'));
        },


    }
}
</script>
