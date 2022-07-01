<template>
    <v-app>
        <main style="min-height: calc(100vh - 56px); transform-origin: center top 0px;">
            <v-img cover style="height: 70vh;" :src="gers"
                   gradient="to top, rgba(255, 255, 255, 0.75), rgba(255, 255, 255, 0.75)">
                <v-container class="container container--fluid fill-height">
                    <v-row align-center="" class="row">
                        <div class="col" style="transform-origin: center top 0px;"><h1
                            class="text-uppercase font-weight-bold mb-4 display-3"> Hola, Mi nombre es
                            <br>Geiler Elias
                            Radillo Sarmiento </h1>
                            <div class="mb-4 display-2 font-weight-light"> Soy un desarrollador de software</div>
                            <v-responsive class=" mb-5" style="max-width: 600px;">
                                <!--Ingeniero de Sistemas, egresado de la Universidad
                                   Popular del Cesar. -->
                                Con amplios conocimientos en la gestión de las tecnologías de
                                la información y la comunicación con énfasis en el desarrollo de software.
                            </v-responsive>
                        </div>
                    </v-row>
                </v-container>
            </v-img>


        </main>


    </v-app>
</template>

<script>
import gers from '@/../images/gers.jpg'

export default {
    name: "Gers",
    data: () => ({
        gers: gers,
    })
}
</script>

<style scoped>

</style>
