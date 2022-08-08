<?php

namespace Database\Seeders;

use App\Models\Establishment;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class EstablishmentsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $establishments = [
            [1, "Centro Educativo Eduardo Pinto Aragón de Porciosa", "0000", "Albania", "La Guajira",],
            [2, "Centro Utpurai	", "0000", "Albania", "La Guajira",],
            [3, "Institución Etnoeducativa Rural Akuaipa Internado Indígena de Albania", "0000", "Albania", "La Guajira",],
            [4, "Centro Educativo luis A. Brito de San Pedro", "0000", "Barrancas", "La Guajira",],
            [5, "Institución educativa técnica rural agropecuaria de mingueo", "0000", "Dibulla", "La Guajira",],
            [6, "Centro educativo rural buenos aires de campana", "0000", "Dibulla", "La Guajira",],
            [7, "Institución educativa rural san antonio de palomino", "0000", "Dibulla", "La Guajira",],
            [8, "Institución educativa técnica roig y villalba", "0000", "Fonseca", "La Guajira",],
            [9, "Institución educativa técnica agropecuaria anaurio manjarrez", "0000", "La Jagua", "La Guajira",],
            [10, "Institución etnoeducativa san rafael del pájaro", "0000", "Manaure", "La Guajira",],
            [11, "Institución etnoeducativa técnica eusebio septimio mari", "0000", "Manaure", "La Guajira",],
            [12, "Centro etnoeducativo rural kanaan", "0000", "Manaure", "La Guajira",],
            [13, "Centro etnoeducativo rural de ishashimana", "0000", "Manaure", "La Guajira",],
            [14, "Institución educativa urbana mixta no.1", "0000", "Manaure", "La Guajira",],
            [15, "Institución etnoducativa rural internado laachon mayapo", "0000", "Manaure", "La Guajira",],
            [16, "Institución etnoeducativa nuestra señora de Fátima", "0000", "Manaure", "La Guajira",],
            [17, "Institución etnoeducativa de maracari", "0000", "Manaure", "La Guajira",],
            [18, "Centro etnoeducativo #17 (kousachon)", "0000", "Riohacha", "La Guajira",],
            [19, "Centro etnoeducativo #4", "0000", "Riohacha", "La Guajira",],
            [20, "Centro etnoeducativo #8 (paraver)", "0000", "Riohacha", "La Guajira",],
            [21, "Centro etnoeducativo #9 (mañature)", "0000", "Riohacha", "La Guajira"],
        ];


        foreach ($establishments as $establishment) {
            Establishment::create([
                'id' => $establishment[0],
                'name' => $establishment[1],
                'nit' => $establishment[2],
                'municipality' => $establishment[3],
                'department' => $establishment[4],
            ]);
        }
    }
}
