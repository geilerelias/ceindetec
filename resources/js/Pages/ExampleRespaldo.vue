<template>
    <app-layout>
        <v-toolbar>
            <v-toolbar-title>
                Respaldo de información
            </v-toolbar-title>
        </v-toolbar>

        <v-container>
            <v-card flat>
                <v-card-title></v-card-title>
                <v-card-text>
                    <v-expansion-panels>
                        <v-expansion-panel v-for="clase in clases" :key="clase.id">
                            <v-expansion-panel-header>
                                <v-checkbox v-model="clase.selected"></v-checkbox>
                                <div>{{ clase.nombre }}</div>
                                <div class="grey--text">{{ clase.docente }}</div>
                            </v-expansion-panel-header>
                            <v-expansion-panel-content>
                                <v-data-table :headers="headers" :items="clase.estudiantes"
                                              :selected="clase.estudiantes.filter(e => e.selected)"
                                              item-key="id"
                                              @click:row="onRowClick">
                                    <template v-slot:item.check-box="{ item }">
                                        <v-checkbox v-model="item.selected"></v-checkbox>
                                    </template>
                                </v-data-table>
                            </v-expansion-panel-content>
                        </v-expansion-panel>
                    </v-expansion-panels>
                </v-card-text>
                <v-card-actions>
                    <v-btn color="primary" @click="respaldar">Respaldar</v-btn>
                    <v-progress-linear v-if="progress > 0" :height="10" :value="progress"></v-progress-linear>
                </v-card-actions>
            </v-card>
        </v-container>
    </app-layout>
</template>

<script>
import appLayout from "@/Layouts/AppLayout.vue";


export default {
    components: {
        appLayout
    }
    ,
    data() {
        return {
            headers: [
                {text: '', value: 'check-box', sortable: false},
                {text: 'Nombre', value: 'nombre'},
                {text: 'Edad', value: 'edad'},
                {text: 'Email', value: 'email'},
            ],
            clases: [
                {
                    id: 1,
                    nombre: 'Matemáticas I',
                    docente: 'María Pérez',
                    estudiantes: [
                        {id: 1, nombre: 'Juan González', edad: 23, email: 'juan@gmail.com', selected: false},
                        {id: 2, nombre: 'Ana López', edad: 21, email: 'ana@gmail.com', selected: false},
                        {id: 3, nombre: 'Pedro Martínez', edad: 24, email: 'pedro@gmail.com', selected: false},
                    ],
                    selected: false,
                },
                {
                    id: 2,
                    nombre: 'Historia Universal',
                    docente: 'Carlos Gómez',
                    estudiantes: [
                        {id: 4, nombre: 'María Hernández', edad: 25, email: 'maria@gmail.com', selected: false},
                        {id: 5, nombre: 'Andrea Torres', edad: 22, email: 'andrea@gmail.com', selected: false},
                    ],
                    selected: false,
                },
                {
                    id: 3,
                    nombre: 'Física II',
                    docente: 'Juan Pérez',
                    estudiantes: [
                        {id: 6, nombre: 'Luis García', edad: 20, email: 'luis@gmail.com', selected: false},
                        {id: 7, nombre: 'Pablo Ramírez', edad: 22, email: 'pablo@gmail.com', selected: false},
                        {id: 8, nombre: 'Lucía Fernández', edad: 23, email: 'lucia@gmail.com', selected: false},
                    ],
                    selected: false,
                },
            ],
            progress: 0,
        };
    },
    methods: {
        onRowClick(item) {
            item.selected = !item.selected;
        },
        respaldar() {
            const clasesSeleccionadas = this.clases.filter(c => c.selected);
            if (clasesSeleccionadas.length === 0) {
                this.$toast.error('Selecciona al menos una clase para respaldar');
                return;
            }

            const totalItems = clasesSeleccionadas.reduce((total, c) => total + c.estudiantes.filter(e => e.selected).length, 0);
            let itemsRespaldo = 0;

            this.progress = 0;

            const intervalId = setInterval(() => {
                if (itemsRespaldo >= totalItems) {
                    clearInterval(intervalId);
                    this.$toast.success(`Se respaldaron ${itemsRespaldo} items`);
                    this.progress = 0;
                    return;
                }

                const porcentaje = (itemsRespaldo / totalItems) * 100;
                this.progress = porcentaje;

                const clase = clasesSeleccionadas.find(c => c.estudiantes.some(e => e.selected));
                const estudiante = clase.estudiantes.find(e => e.selected);

                this.simularRespaldarItem(clase, estudiante);
                estudiante.selected = false;
                itemsRespaldo++;
            }, 1000);
        },
        simularRespaldarItem(clase, estudiante) {
            // Simula la lógica de respaldar un item en el servidor
            console.log(`Se respaldó el estudiante ${estudiante.nombre} de la clase ${clase.nombre}`);
        },
    },
};
</script>
