<template>
    <v-app>
        <v-row align="center">
            <v-col>
                <v-window
                    v-model="window">

                    <v-window-item :value="1">
                        {{ packages }}
                        <v-main>
                            <div class="d-flex justify-center align-center flex-column">
                                <div v-for="(item, n) in headquarters"
                                     :key="item.id"
                                     class="d-flex justify-center align-center sheet-letter saltopagina"
                                     style="page-break-before: avoid !important;">
                                    <v-row class=" d-flex justify-center"
                                           style="height: 8in !important;
                            width: 10in !important;
                            max-height: 8in !important;
                            max-width: 10in !important;
                            min-height: 8in !important;
                            min-width: 10in !important;">
                                        <v-col class="col-md-8 col-12"
                                               style="width: 100%;min-width: 100%;height: 100%;min-height: 100%"
                                        >
                                            <v-card class="d-flex flex-column">
                                                <div class="d-flex align-end justify-end mr-2">
                                                    <v-card
                                                        class="overflow-hidden  transition-swing elevation-6 rounded primary fixed mt-1"
                                                        style="max-width: 100%; width: 65px;height: 65px"
                                                    >
                                                        <div
                                                            class="pa-3 text-h4 text--white white--text font-weight-bold text-center">
                                                            {{ n + 1 }}
                                                        </div>

                                                    </v-card>
                                                </div>

                                                <v-card-title class="d-flex justify-space-around pt-1 pb-0 mb-0">


                                                    <logo :light="false" :tile="true" :width="120"
                                                          color="primary"></logo>
                                                    <logo :light="false" :tile="true" :width="120" color="primary"
                                                          src="logoAlcaldia"></logo>
                                                </v-card-title>
                                                <v-divider class="my-2"></v-divider>
                                                <v-toolbar flat>
                                                    <div class="d-flex  flex-column">
                                                        <div
                                                            class=" text-subtitle-2 text-sm-h6  primary--text font-weight-bold text-uppercase py-0 my-0">
                                                            {{ item.name }}
                                                        </div>
                                                        <div
                                                            class="grey--text font-weight-bold text-uppercase py-0 my-0">
                                                            {{ getEstablishment(item.establishment_id) }}
                                                        </div>
                                                    </div>
                                                    <v-spacer></v-spacer>
                                                    <div
                                                        class="text-caption text-right text-sm-subtitle-1 secondary--text font-weight-bold py-0 my-0 uppercase">
                                                        {{ item.address }}
                                                        <br>
                                                        <span class="grey--text">
                                                            {{ item.municipality }}
                                                            {{ item.department }}
                                                        </span>
                                                    </div>
                                                </v-toolbar>
                                                <v-card-text class="pa-3 flex-grow-1">
                                                    <v-simple-table class="rounded-lg" dense>
                                                        <template v-slot:default>
                                                            <thead class="primary rounded-b-0">
                                                            <tr>
                                                                <th class="text-left text-uppercase white--text text-center rounded-b-0"
                                                                    style="border: solid 1px white !important;">
                                                                    Descripción
                                                                </th>
                                                                <th class="text-left text-uppercase white--text text-center rounded-b-0"
                                                                    style="border: solid 1px white !important;">
                                                                    Serial
                                                                </th>
                                                                <th class="text-left text-uppercase white--text text-center rounded-b-0"
                                                                    style="border: solid 1px white !important;">
                                                                    Cantidad
                                                                </th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                            {{ getElements }}
                                                            <!--                                                            <template v-for="(item, i) in getElements[n]"
                                                                                                                                  class=" rounded-b-0">
                                                                                                                            {{ item }}
                                                                                                                            <tr v-if="i!=='TOTAL'">
                                                                                                                                <td class="b-solid-g rounded-b-0">
                                                                                                                                    {{
                                                                                                                                        i
                                                                                                                                    }}
                                                                                                                                </td>
                                                                                                                                <td class="b-solid-g  rounded-b-0">
                                                                                                                                    <div class="d-flex flex-wrap">
                                                                                                                                        <div
                                                                                                                                            v-for="(j, x) in item"
                                                                                                                                            :key="x"
                                                                                                                                            class="w-half  mb-1"
                                                                                                                                        >
                                                                                                                                            <div
                                                                                                                                                class="text-decoration-none"
                                                                                                                                            >
                                                                                                                                                <v-icon color="success" left>
                                                                                                                                                    mdi-checkbox-marked-outline
                                                                                                                                                </v-icon>
                                                                                                                                                {{ j }}<span
                                                                                                                                                v-if="i==='PRESENTADOR INALÁMBRICO'">{{
                                                                                                                                                    n
                                                                                                                                                }}</span>
                                                                                                                                            </div>
                                                                                                                                        </div>
                                                                                                                                    </div>
                                                                                                                                </td>
                                                                                                                                <td class="b-solid-g rounded-b-0">
                                                                                                                                    {{
                                                                                                                                        item.length
                                                                                                                                    }}
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                        </template>
                                                                                                                     -->
                                                            <tr class="primary">
                                                                <td class="text-uppercase white--text text-center rounded-b-0"
                                                                    colspan="2"
                                                                    style="border: solid 1px white !important;">
                                                                    TOTAL
                                                                </td>
                                                                <td class="text-uppercase white--text text-center rounded-b-0"
                                                                    style="border: solid 1px white !important;">
                                                                    <!--                                                                    {{ getElements[n].TOTAL }}-->
                                                                </td>
                                                            </tr>
                                                            </tbody>
                                                        </template>
                                                    </v-simple-table>
                                                </v-card-text>
                                            </v-card>
                                        </v-col>
                                    </v-row>
                                </div>
                            </div>
                        </v-main>
                    </v-window-item>

                    <v-window-item :value="2">
                        <v-main>
                            <v-container class="d-flex justify-center">
                                <v-card flat class="sheet-width-letter mt-4">
                                    <v-card-title
                                        class="d-flex justify-space-around pt-6 pb-0 mb-0">
                                        <logo :light="false" :tile="true" :width="120"
                                              color="primary"></logo>
                                        <logo :light="false" :tile="true" :width="120"
                                              color="primary"
                                              src="logoAlcaldia"></logo>
                                    </v-card-title>

                                    <v-simple-table id="tableId" class="rounded-lg" dense>
                                        <template v-slot:default>
                                            <thead class="primary rounded-lg rounded-b-0">
                                            <tr>
                                                <td class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                    style="border: solid 1px white !important;">
                                                    Institución
                                                </td>
                                                <td class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                    style="border: solid 1px white !important;">
                                                    Sede
                                                </td>
                                                <td class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                    style="border: solid 1px white !important;">
                                                    Fecha
                                                </td>
                                                <td class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                    style="border: solid 1px white !important;">
                                                    Descripción
                                                </td>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            <template v-for="(elements, n) in obtenerEntregas">
                                                <tr v-if="n!=0">
                                                    <td class="b-solid-g text-uppercase font-weight-black"
                                                        :rowspan="Object.values(elements).length+1">
                                                        {{ getEstablishment(n) }}
                                                    </td>
                                                </tr>

                                                <tr v-if="n!=0"
                                                    v-for="(sede, i) in elements" :key="sede.id">
                                                    <td class="b-solid-g">
                                                        {{ sede.name }}
                                                    </td>
                                                    <td class="b-solid-g">
                                                        {{ getDateObra(sede.id) }}
                                                    </td>
                                                    <td class="b-solid-g">
                                                        <div v-if="entregas[(sede.id*1-1)].tipo==1">
                                                            Entrega de elementos mobiliario y
                                                            <span class="font-weight-black">adecuación</span> de las
                                                            aulas institucionales
                                                            para la innovación
                                                        </div>
                                                        <div v-else>
                                                            Entrega de elementos mobiliario y
                                                            <span class="font-weight-black">Construcción</span> de
                                                            las aulas institucionales
                                                            para la innovación.
                                                        </div>

                                                    </td>
                                                </tr>
                                            </template>

                                            <!--                                                    <td class="d-flex  flex-column">
                                                                                                    <div
                                                                                                        class=" text-subtitle-2 text-sm-h6  primary&#45;&#45;text font-weight-bold text-uppercase py-0 my-0">
                                                                                                        {{ item.id }}
                                                                                                        {{ item.name }}

                                                                                                    </div>
                                                                                                    <div class="grey&#45;&#45;text">
                                                                                                        {{ getDate(entregas[n].entrega_mobiliario) }}
                                                                                                    </div>
                                                                                                    <div
                                                                                                        class="grey&#45;&#45;text font-weight-bold text-uppercase py-0 my-0">
                                                                                                        {{ getEstablishment(item.establishment_id) }}
                                                                                                    </div>
                                                                                                </td>
                                                                                                <td
                                                                                                    class="text-caption text-right text-sm-subtitle-1 secondary&#45;&#45;text font-weight-bold py-0 my-0 uppercase">
                                                                                                    {{ item.address }}
                                                                                                    <br>
                                                                                                    <span class="grey&#45;&#45;text">
                                                                                                                                                                {{
                                                                                                            item.municipality
                                                                                                        }}
                                                                                                                                                                {{
                                                                                                            item.department
                                                                                                        }}
                                                                                                                                                            </span>
                                                                                                </td>-->

                                            </tbody>
                                        </template>
                                    </v-simple-table>

                                </v-card>
                            </v-container>
                        </v-main>
                    </v-window-item>

                    <v-window-item :value="3">
                        <v-main>
                            <v-container class="d-flex justify-center">
                                <v-card class="sheet-width-letter ">
                                    <v-card-text class="pa-3 flex-grow-1">
                                        <v-simple-table id="tableId" class="rounded-lg" dense>
                                            <template v-slot:default>
                                                <thead class="primary rounded-lg rounded-b-0">
                                                <tr>
                                                    <th class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                        style="border: solid 1px white !important;">
                                                        Descripción
                                                    </th>
                                                    <th class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                        style="border: solid 1px white !important;">
                                                        Serial
                                                    </th>
                                                    <th class="text-left text-uppercase white--text text-center rounded-lg rounded-b-0"
                                                        style="border: solid 1px white !important;">
                                                        Cantidad
                                                    </th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr v-for="(item, n) in elementos"
                                                    :key="item.id">
                                                    <td class="b-solid-g rounded-b-0">
                                                        {{ item.DESCRIPTION }}
                                                    </td>
                                                    <td class="b-solid-g rounded-b-0">
                                                        {{ item.SERIAL }}
                                                    </td>
                                                    <td class="b-solid-g rounded-b-0">
                                                        {{ item.QUANTITY }}
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </template>
                                        </v-simple-table>
                                    </v-card-text>
                                </v-card>
                            </v-container>
                        </v-main>
                    </v-window-item>
                </v-window>
                <v-bottom-navigation class="no-print">
                    <v-pagination
                        v-model="window"
                        :length="length"
                        circle
                    ></v-pagination>
                </v-bottom-navigation>
            </v-col>
        </v-row>
    </v-app>
</template>

<script>
import SimpleLayout from "@/Layouts/SimpleLayout.vue";
import logo from "@/Components/Logo.vue";


export default {
    name: "Package",
    components: {
        SimpleLayout,
        logo
    },
    data: () => ({
        establishments: [],
        headquarters: [],
        elementos: [
            {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814780",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814792",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814793",
                "QUANTITY": 1
            }, {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814809",
                "QUANTITY": 1
            }, {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814811",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814815",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814816",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG1111150LSW",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556820",
                "QUANTITY": 1
            },
            {
                "GROUP": 1,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 1,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04766",
                "QUANTITY": 1
            }, {
                "GROUP": 1,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04658",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814850",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814852",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814853",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814825",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814826",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814828",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814843",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG1103507P4",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55577263",
                "QUANTITY": 1
            },
            {
                "GROUP": 2,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 2,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04659",
                "QUANTITY": 1
            }, {
                "GROUP": 2,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04763",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813422",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813428",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813429",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813430",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813355",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813398",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813396",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0692561EBF",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55297526",
                "QUANTITY": 1
            },
            {
                "GROUP": 3,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813276",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813259",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813220",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813332",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813394",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814665",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814651",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8G0XG1214320L78",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55296445",
                "QUANTITY": 1
            },
            {
                "GROUP": 4,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 4,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03386",
                "QUANTITY": 1
            }, {
                "GROUP": 4,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02555",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813393",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813397",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813399",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813395",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813392",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813391",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813354",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG12143217NQ",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55221582",
                "QUANTITY": 1
            },
            {
                "GROUP": 5,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813400",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813402",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813403",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813404",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813405",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813424",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813425",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG1214320RNB",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55549332",
                "QUANTITY": 1
            },
            {
                "GROUP": 6,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 6,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04769",
                "QUANTITY": 1
            }, {
                "GROUP": 6,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04655",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814817",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814819",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814820",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814821",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814822",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814823",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814824",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG111207039K",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55558548",
                "QUANTITY": 1
            },
            {
                "GROUP": 7,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 7,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04643",
                "QUANTITY": 1
            }, {
                "GROUP": 7,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02832",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814599",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814628",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814659",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814771",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814772",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814773",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814778",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XE111145083E",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55549272",
                "QUANTITY": 1
            },
            {
                "GROUP": 8,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814653",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814656",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814657",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814660",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814661",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814662",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814663",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0793912SLU",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556686",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04652",
                "QUANTITY": 1
            },
            {
                "GROUP": 9,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03465",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813998",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813999",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814000",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814001",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814002",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814003",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814009",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0692830NJS",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55299230",
                "QUANTITY": 1
            },
            {
                "GROUP": 10,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814635",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814641",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814650",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814636",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814646",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814620",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814645",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG1212440D1B",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556718",
                "QUANTITY": 1
            },
            {
                "GROUP": 11,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 11,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02490",
                "QUANTITY": 1
            }, {
                "GROUP": 11,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02023",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814643",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814619",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814647",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814648",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814618",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814621",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814649",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0793912SMG",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55584067",
                "QUANTITY": 1
            },
            {
                "GROUP": 12,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 12,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02078",
                "QUANTITY": 1
            }, {
                "GROUP": 12,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02847",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813414",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813415",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813416",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813417",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813418",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813419",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813420",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG121432166B",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55299112",
                "QUANTITY": 1
            },
            {
                "GROUP": 13,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 13,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02082",
                "QUANTITY": 1
            }, {
                "GROUP": 13,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03432",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813406",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813408",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122823409",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122823410",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122823411",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122823412",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122823413",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0793912SMQ",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556681",
                "QUANTITY": 1
            },
            {
                "GROUP": 14,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814010",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814011",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814012",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814013",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814014",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814015",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814016",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG11124103GS",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55576655",
                "QUANTITY": 1
            },
            {
                "GROUP": 15,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 15,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03467",
                "QUANTITY": 1
            }, {
                "GROUP": 15,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04776",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813990",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813992",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813993",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813994",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813995",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813996",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813997",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G0G090XG0692561D8W",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55271505",
                "QUANTITY": 1
            },
            {
                "GROUP": 16,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 16,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02824",
                "QUANTITY": 1
            }, {
                "GROUP": 16,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03465",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814017",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814018",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814019",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814020",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814023",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814035",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814598",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "g090xg0692561dnr",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55549152",
                "QUANTITY": 1
            },
            {
                "GROUP": 17,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 17,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02076",
                "QUANTITY": 1
            }, {
                "GROUP": 17,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02829",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813979",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813980",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813981",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813982",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813983",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813984",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813985",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG12203205HE",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55559058",
                "QUANTITY": 1
            },
            {
                "GROUP": 18,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 18,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04637",
                "QUANTITY": 1
            }, {
                "GROUP": 18,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04640",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814622",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814637",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814638",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814639",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814640",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814642",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814652",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG121423041B",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55549660",
                "QUANTITY": 1
            },
            {
                "GROUP": 19,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812895",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812949",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812950",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812951",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812952",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812955",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812968",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG1213220014",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55577118",
                "QUANTITY": 1
            },
            {
                "GROUP": 20,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812977",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812978",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813423",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813480",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813601",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813604",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813608",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0793852NXH",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55238783",
                "QUANTITY": 1
            },
            {
                "GROUP": 21,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 21,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02850",
                "QUANTITY": 1
            }, {
                "GROUP": 21,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04541",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813815",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813929",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813930",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813931",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813976",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813977",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813978",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG12119707BU",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556755",
                "QUANTITY": 1
            },
            {
                "GROUP": 22,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 22,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02085",
                "QUANTITY": 1
            }, {
                "GROUP": 22,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03480",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813609",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813732",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813771",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813773",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813774",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813775",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813777",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G6G0XG121432162K",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55577123",
                "QUANTITY": 1
            },
            {
                "GROUP": 23,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 23,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04674",
                "QUANTITY": 1
            }, {
                "GROUP": 23,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "02074",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813793",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813794",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813795",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813811",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813812",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813813",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813814",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090X079391306",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55212811",
                "QUANTITY": 1
            },
            {
                "GROUP": 24,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 24,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04675",
                "QUANTITY": 1
            }, {
                "GROUP": 24,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "0275",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813785",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813786",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813787",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813789",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813790",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813791",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122813792",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G090XG0692830Q2V",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55283751",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },
            {
                "GROUP": 25,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "03435",
                "QUANTITY": 1
            }, {
                "GROUP": 25,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04689",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814664",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814666",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814667",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814668",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814669",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814670",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814827",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG1111410047",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55556932",
                "QUANTITY": 1
            },
            {
                "GROUP": 26,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            }, {
                "GROUP": 26,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04755",
                "QUANTITY": 1
            }, {
                "GROUP": 26,
                "DESCRIPTION": "VENTILADOR DE PARED",
                "SERIAL": "04647",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812770",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812663",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122812839",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814616",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122814617",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122815000",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "DIADEMA CON MICRÓFONO",
                "SERIAL": "20122815001",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "PARLANTE ALEXA",
                "SERIAL": "G8M0XG11117300PS",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "CAMARA DE SEGURIDAD",
                "SERIAL": "55549808",
                "QUANTITY": 1
            },
            {
                "GROUP": 27,
                "DESCRIPTION": "PRESENTADOR INALÁMBRICO",
                "SERIAL": "EN60825-1",
                "QUANTITY": 1
            },

        ],
        length: 3,
        window: 1,
        fab: false,
        entregas: [
            {
                id: 1,
                entrega_mobiliario: '2022-08-11',
                entrega_audio_visuales: '2022-08-11',
                entrega_obra: '2022-08-11',
                tipo: 1
            }, {
                id: 2,
                entrega_mobiliario: '2022-09-08',
                entrega_audio_visuales: '2022-09-08',
                entrega_obra: '2022-09-08',
                tipo: 2
            }, {
                id: 3,
                entrega_mobiliario: '2022-08-11',
                entrega_audio_visuales: '2022-08-11',
                entrega_obra: '2022-08-11',
                tipo: 1
            }, {
                id: 4,
                entrega_mobiliario: '2022-09-14',
                entrega_audio_visuales: '2022-09-14',
                entrega_obra: '2022-09-14',
                tipo: 2
            }, {
                id: 5,
                entrega_mobiliario: '2022-08-09',
                entrega_audio_visuales: '2022-08-09',
                entrega_obra: '2022-08-09',
                tipo: 1
            }, {
                id: 6,
                entrega_mobiliario: '2022-09-06',
                entrega_audio_visuales: '2022-09-06',
                entrega_obra: '2022-09-06',
                tipo: 2
            }, {
                id: 7,
                entrega_mobiliario: '2022-09-06',
                entrega_audio_visuales: '2022-09-06',
                entrega_obra: '2022-09-06',
                tipo: 1
            }, {
                id: 8,
                entrega_mobiliario: '2022-08-10',
                entrega_audio_visuales: '2022-08-10',
                entrega_obra: '2022-08-10',
                tipo: 1
            }, {
                id: 9,
                entrega_mobiliario: '2022-08-10',
                entrega_audio_visuales: '2022-08-10',
                entrega_obra: '2022-08-10',
                tipo: 1
            }, {
                id: 10,
                entrega_mobiliario: '2022-08-10',
                entrega_audio_visuales: '2022-08-10',
                entrega_obra: '2022-08-10',
                tipo: 1
            }, {
                id: 11,
                entrega_mobiliario: '2022-08-18',
                entrega_audio_visuales: '2022-08-18',
                entrega_obra: '2022-08-18',
                tipo: 1
            }, {
                id: 12,
                entrega_mobiliario: '2022-10-06',
                entrega_audio_visuales: '2022-10-06',
                entrega_obra: '2022-10-06',
                tipo: 2
            }, {
                id: 13,
                entrega_mobiliario: '2022-09-20',
                entrega_audio_visuales: '2022-09-20',
                entrega_obra: '2022-09-20',
                tipo: 2
            }, {
                id: 14,
                entrega_mobiliario: '2022-08-17',
                entrega_audio_visuales: '2022-08-17',
                entrega_obra: '2022-08-17',
                tipo: 1
            }, {
                id: 15,
                entrega_mobiliario: '2022-08-16',
                entrega_audio_visuales: '2022-08-16',
                entrega_obra: '2022-08-16',
                tipo: 1
            }, {
                id: 16,
                entrega_mobiliario: '2022-08-16',
                entrega_audio_visuales: '2022-08-16',
                entrega_obra: '2022-08-16',
                tipo: 1
            }, {
                id: 17,
                entrega_mobiliario: '2022-09-20',
                entrega_audio_visuales: '2022-09-20',
                entrega_obra: '2022-09-20',
                tipo: 2
            }, {
                id: 18,
                entrega_mobiliario: '2022-08-17',
                entrega_audio_visuales: '2022-08-17',
                entrega_obra: '2022-08-17',
                tipo: 1
            }, {
                id: 19,
                entrega_mobiliario: '2022-08-18',
                entrega_audio_visuales: '2022-08-18',
                entrega_obra: '2022-08-18',
                tipo: 1
            }, {
                id: 20,
                entrega_mobiliario: '2022-08-18',
                entrega_audio_visuales: '2022-08-18',
                entrega_obra: '2022-08-18',
                tipo: 1
            }, {
                id: 21,
                entrega_mobiliario: '2022-09-09',
                entrega_audio_visuales: '2022-09-09',
                entrega_obra: '2022-09-09',
                tipo: 2
            }, {
                id: 22,
                entrega_mobiliario: '2022-09-09',
                entrega_audio_visuales: '2022-09-09',
                entrega_obra: '2022-09-09',
                tipo: 2
            }, {
                id: 23,
                entrega_mobiliario: '2022-09-20',
                entrega_audio_visuales: '2022-09-20',
                entrega_obra: '2022-09-20',
                tipo: 2
            }, {
                id: 24,
                entrega_mobiliario: '2022-09-09',
                entrega_audio_visuales: '2022-09-09',
                entrega_obra: '2022-09-09',
                tipo: 2
            }, {
                id: 25,
                entrega_mobiliario: '2022-09-14',
                entrega_audio_visuales: '2022-09-14',
                entrega_obra: '2022-09-14',
                tipo: 2
            }, {
                id: 26,
                entrega_mobiliario: '2022-08-12',
                entrega_audio_visuales: '2022-08-12',
                entrega_obra: '2022-08-12',
                tipo: 1
            }, {
                id: 27,
                entrega_mobiliario: '2022-08-12',
                entrega_audio_visuales: '2022-08-12',
                entrega_obra: '2022-08-12',
                tipo: 1
            },


        ],
        packages: [],
    }),
    async created() {
        this.establishments = await axios.get('/dashboard/establishment/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                // console.log(error)
            })

        this.headquarters = await axios.get('/dashboard/headquarters/all')
            .then((response) => {
                //console.log(response.data)
                return response.data
            })
            .catch((error) => {
                // console.log(error)
            })


    },
    computed: {
        obtenerEntregas() {
            try {
                let nuevoObjeto = []
                //Recorremos el arreglo
                this.headquarters.forEach(x => {
                    //Si la ciudad no existe en nuevoObjeto entonces
                    //la creamos e inicializamos el arreglo de profesionales.
                    console.log(x)
                    if (!nuevoObjeto.hasOwnProperty(x.establishment_id)) {
                        nuevoObjeto[x.establishment_id] = []
                    }

                    //Agregamos los datos de profesionales.
                    nuevoObjeto[x.establishment_id].push(x)
                })
                console.log('nuevoObjeto', nuevoObjeto)
                return nuevoObjeto;
            } catch (e) {
                return null
            }
        },

        getElements() {
            try {
                let result = []

                this.groupByGroup.forEach(element => {
                    let nuevoObjeto = []
                    let total = 0
                    element.forEach(x => {
                        console.log('x => ', x)
                        if (!nuevoObjeto.hasOwnProperty(x.DESCRIPTION)) {
                            nuevoObjeto[x.DESCRIPTION] = []
                        }
                        total++;
                        nuevoObjeto[x.DESCRIPTION].push(x.SERIAL)
                    })
                    nuevoObjeto['TOTAL'] = total;
                    console.log('Nuevo Objeto => ', nuevoObjeto)
                    result.push(nuevoObjeto)
                })

                console.log('resultados => ', result)

                console.log('resultados[1] => ', result[1])

                /* result = _.groupBy(this.elementos, "GROUP")
                 console.log(result)

                 let newresult = _.groupBy(this.elementos, "DESCRIPTION")
                 console.log(newresult)*/
                this.$nextTick(() => {
                    this.packages = result
                })

                return result
            } catch (e) {

            }
            return null;
        },

    },
    methods: {
        groupByGroup() {
            let items = []
            for (let i = 0; i < 27; i++) {
                items[i] = this.elementos.filter(item => item.GROUP == (i + 1));
                console.log('ITEM GROUP => ', items[i])
            }
            return items
        },
        getDateObra(value) {
            console.log('entregas', this.entregas[(value - 1)], ' value => ', value)
            let valor = this.entregas[(value - 1)].entrega_obra
            try {
                //.log('this is tab => ', tab)
                //console.log(this.getRecords[tab].folder)
                let date = new Date(valor + " 00:00:00").toLocaleDateString("es-ES",
                    {
                        weekday: 'long',
                        day: 'numeric',
                        month: 'long',
                        year: 'numeric',
                    })
                //console.log(date)
                return date
            } catch (e) {
                //console.log(e)
            }
        },

        getDate(value) {
            try {
                //.log('this is tab => ', tab)
                //console.log(this.getRecords[tab].folder)
                let date = new Date(value + " 00:00:00").toLocaleDateString("es-ES",
                    {
                        weekday: 'long',
                        day: 'numeric',
                        month: 'long',
                        year: 'numeric',
                    })
                //console.log(date)
                return date
            } catch (e) {
                //console.log(e)
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
        next() {
            this.window = this.window + 1 === this.length
                ? 0
                : this.window + 1
        },
        prev() {
            this.window = this.window - 1 < 0
                ? this.length - 1
                : this.window - 1
        },
        downloadExl() {
            let wb = XLSX.utils.table_to_book(document.getElementById('tableId')),
                wopts = {
                    bookType: 'xlsx',
                    bookSST: false,
                    type: 'binary'
                },
                wbout = XLSX.write(wb, wopts);

            FileSaver.saveAs(new Blob([this.s2ab(wbout)], {
                type: "application/octet-stream;charset=utf-8"
            }), "Formulario de perfil personal.xlsx");
        },
        s2ab(s) {
            if (typeof ArrayBuffer !== 'undefind') {
                var buf = new ArrayBuffer(s.length);
                var view = new Uint8Array(buf);
                for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
                return buf;
            } else {
                var buf = new Array(s.length);
                for (var i = 0; i != s.length; ++i) buf[i] = s.charCodeAt(i) & 0xFF;
                return buf;
            }
        }
    }
}
</script>


<style type="text/css" media="print">
@media print {
    #no-print-btn {
        display: none;
    }

    .no-print {
        display: none;
    }

    #no-print-btn {
        display: none;
    }

    #no-print-header {
        display: none;
    }

    #no-print {
        display: none;
    }

    .no-print {
        display: none;
    }

    #no-print-footer {
        display: none;
    }

    div.saltopagina {
        page-break-before: always;
    }

    /*ul, img, table {*/
    /*    page-break-inside: avoid;*/
    /*}*/
    /*#printer > div > div > div > div {*/
    /*    page-break-inside: avoid !important;*/
    /*}*/
    @page {
        margin-top: 1cm;
        margin-left: 1cm;
        margin-right: 1cm;
    }

    .bg {
        background: rgb(255, 255, 255) !important;
    }

}
</style>
<style>
.bg {
    background: rgb(255, 255, 255);
    background: radial-gradient(circle, rgba(255, 255, 255, 1) 10%, rgba(206, 206, 206, 1) 100%);
}

.b-solid-g {
    border: solid 1px lightgray !important;
}

.b-solid {
    border: solid 1px white !important;
}

.sheet-letter {
    height: 8.5in !important;
    width: 11in !important;
    max-height: 8.5in !important;
    max-width: 11in !important;
    min-height: 8.5in !important;
    min-width: 11in !important;
}

.sheet-width-letter {
    width: 11in !important;
    max-width: 11in !important;
    min-width: 11in !important;
}

.v-application .w-half {
    width: 50% !important;
}

#create .v-speed-dial {
    position: absolute;
}

#create .v-btn--floating {
    position: relative;
}

</style>
