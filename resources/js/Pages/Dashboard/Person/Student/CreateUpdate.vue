<template>
    <v-dialog
        :value="open"
        max-width="800"
        style="z-index: 9"
        fullscreen
        hide-overlay
        persistent
        transition="dialog-bottom-transition"
        scrollable
    >
        <v-card tile color="grey lighten-4" class="min-h-screen">
            <v-toolbar
                flat
                dark
                color="primary"
                style="max-height: 150px"
            >
                <v-btn
                    icon
                    dark
                    @click="closeModal()"
                >
                    <v-icon>mdi-close</v-icon>
                </v-btn>
                <v-toolbar-title class="text-h5 white--text">{{
                        isEdit !== false ? 'Editar estudiante' : 'Crear nuevo estudiante'
                    }}
                </v-toolbar-title>
                <v-spacer></v-spacer>
                <v-menu
                    bottom
                    right
                    offset-y
                >
                    <template v-slot:activator="{ on, attrs }">
                        <v-btn
                            dark
                            icon
                            v-bind="attrs"
                            v-on="on"
                        >
                            <v-icon>mdi-dots-vertical</v-icon>
                        </v-btn>
                    </template>
                    <v-list dense>
                        <inertia-link :href="route(item.route)" v-for="(item, i) in management"
                                      :key="i">
                            <v-list-item link>
                                <v-list-item-icon>
                                    <v-icon>{{ item.icon }}</v-icon>
                                </v-list-item-icon>
                                <v-list-item-title>{{ item.title }}</v-list-item-title>
                            </v-list-item>
                        </inertia-link>
                    </v-list>
                </v-menu>
            </v-toolbar>
            <v-container>
                <v-form
                    ref="form"
                    v-model="valid">
                    <v-card class="mt-12">
                        <v-card-title class="align-start">
                            <v-card class="overflow-hidden mt-n9 transition-swing elevation-6 rounded primary fixed"
                                    style="max-width: 100%; "
                            >
                                <div class="pa-8">
                                    <v-icon dark size="36">mdi-book-multiple</v-icon>
                                </div>
                            </v-card>
                            <div class="text-h5  pl-4 ">
                                {{ isEdit !== false ? 'Editar area' : 'Crear nueva area' }}
                            </div>
                        </v-card-title>
                        <v-card-text>
                            <v-row>
                                <v-col class="col-12">
                                    <v-text-field
                                        outlined
                                        v-model="form.name"
                                        :counter="50"
                                        label="Nombre"
                                        :rules="[rules.required]"
                                    ></v-text-field>

                                    <div v-if="$page.errors.title" class="text-red-500">
                                        {{ $page.errors.title[0] }}
                                    </div>
                                </v-col>

                                <v-col class="col-12">
                                    <v-label for="myTextEditor" class="mb-4">Descripción</v-label>
                                    <div class="py-2">
                                        <vue-editor :editor-toolbar="customToolbar"
                                                    ref="myTextEditor"
                                                    v-model="form.description"
                                                    :rules="[rules.required]"
                                        ></vue-editor>
                                    </div>

                                    <div v-if="$page.errors.starts_at" class="text-red-500">
                                        {{ $page.errors.starts_at[0] }}
                                    </div>
                                </v-col>
                            </v-row>


                            <div class="d-flex justify-end">
                                <v-btn wire:click.prevent="store()" type="button"
                                       v-show="!edit" @click="save(form)"
                                       class="primary mx-1" dark>
                                    Guardar
                                </v-btn>

                                <v-btn wire:click.prevent="store()" type="button"
                                       v-show="edit" @click="update(form)"
                                       class="primary x-1" dark>
                                    Actualizar
                                </v-btn>

                                <v-btn @click="closeModal()" type="button"
                                       class="secondary mx-1" dark>
                                    Cancelar
                                </v-btn>
                            </div>

                        </v-card-text>

                    </v-card>
                </v-form>
            </v-container>
        </v-card>
    </v-dialog>
</template>

<script>
import {VueEditor} from "vue2-editor";
import SpinnerComponent from "@/Components/SpinnerComponent";

export default {
    name: "CreateUpdate",
    components: {
        VueEditor,
        SpinnerComponent
    },
    props: {
        data: Object,
        edit: Boolean,
        open: {
            type: Boolean,
            default: false
        },
        close: Function,
        errors: Object,
    },
    data: () => ({
        valid: false,
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
        form: {
            name: null,
            description: null
        },
        defaultForm: {
            name: null,
            description: null
        },

        customToolbar: [
            [{'font': []}],
            [{'header': [false, 1, 2, 3, 4, 5, 6,]}],
            [{'size': ['small', false, 'large', 'huge']}],
            ['bold', 'italic', 'underline', 'strike'],
            [{'align': ''}, {'align': 'center'}, {'align': 'right'}, {'align': 'justify'}],
            [{'header': 1}, {'header': 2}],
            ['blockquote', 'code-block'],
            [{'list': 'ordered'}, {'list': 'bullet'}, {'list': 'check'}],
            [{'script': 'sub'}, {'script': 'super'}],
            [{'indent': '-1'}, {'indent': '+1'}],
            [{'color': []}, {'background': []}],
            ['link', 'formula'],
            [{'direction': 'rtl'}],
            ['clean'],
        ],

        management: [
            {title: 'Editar', icon: 'mdi-playlist-edit', route: 'person.create.student'},
            {title: 'Eliminar', icon: 'mdi-playlist-remove', route: 'person.index.student'},
            {title: 'Crear', icon: 'mdi-playlist-plus', route: 'person.create.student'},
            {title: 'Salir', icon: 'mdi-close', route: 'person.create.student'},
        ],

    }),
    computed: {
        isEdit() {
            if (this.edit === true)
                this.form = this.data

            return this.edit
        }
    },
    methods: {
        validate() {
            if (!this.$refs.form.validate()) {
                return;
            }
        },
        closeModal() {
            this.reset()
            this.close();
        },
        reset: function () {
            this.form = this.defaultForm
            this.resetValidation();
        },
        resetValidation() {
            this.$refs.form.resetValidation()
        },
        save: function (data) {
            this.saving = true;
            if (!this.validate() && !this.valid) {

                this.$swal.fire(
                    "Campos Obligatorio!",
                    "Ingresa los campos obligatorios!",
                    "error"
                )

                this.saving = false;
            } else {
                this.$inertia.post(this.route('estudiante.store'), data, {
                    onSuccess: (response) => {
                        let res = response.data;
                        console.log(response)
                        console.log('errors => ', this.$page.errors)
                        //console.log('este es page', this.$page);
                        this.$swal({
                            icon: `${this.$page.errors.name ? 'error' : 'success'}`,
                            title: `${this.$page.errors.name ? 'Ups...' : '¡Buen trabajo!'}`,
                            text: `${this.$page.errors.name ? this.$page.errors.name[0] : this.$page.flash.message}`
                        }).then(result => {
                            this.saving = false;
                            if (result.isConfirmed) {
                                this.headquarters = this.defaultHeadquarters;
                                this.reset();
                                this.resetValidation();
                                this.$inertia.get(this.route('estudiante.index'));
                            }
                        });
                    },
                    onError: error => {
                        //console.log(error);
                        this.saving = false;

                        const array = error.response.data.errors;
                        let text = "";
                        for (var clave in array) {
                            text += clave + ": " + array[clave] + "\n ";
                        }
                        this.$swal.fire("Error!", text, "error");
                        console.log(text);
                    },
                    onFinish: visit => {
                        this.saving = false;
                    },
                });
            }

        },
        update: function (data) {
            data._method = 'PUT';
            this.$inertia.post(this.route('estudiante.update', data.id), data, {
                onSuccess: page => {
                    console.log(page.props.errors)
                    this.$swal({
                        icon: `${page.props.errors ? 'error' : 'success'}`,
                        title: `${page.props.errors ? 'Ups...' : '¡Buen trabajo!'}`,
                        text: `${page.props.errors ? page.props.errors : page.props.flash.message}`
                    })
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
                    this.editMode = false;
                },
            })
        },
    }
}
</script>

<style scoped>

</style>
