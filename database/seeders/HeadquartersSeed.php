<?php

namespace Database\Seeders;

use App\Models\Headquarters;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class HeadquartersSeed extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $headquarters = [
            ["id" => 1, "name" => "Escuela Rural de Santa Fe", "dane_code" => "244035003360", "address" => "Resguardo Pitulumani", "municipality" => "Albania", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3145053111", "establishment_id" => 1, "created_at" => "2022-06-07T00:44:17.000000Z", "updated_at" => "2022-06-07T00:44:17.000000Z"],
            ["id" => 2, "name" => "Escuela Indígena Itaka", "dane_code" => "244035003432", "address" => "Km 41 Via Riohacha", "municipality" => "Albania", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3133782458", "establishment_id" => 2, "created_at" => "2022-06-07T00:48:14.000000Z", "updated_at" => "2022-06-07T00:48:14.000000Z"],
            ["id" => 3, "name" => "Escuela Indígena Almirante Padilla", "dane_code" => "2443000086", "address" => "Zona Rural de Albania", "municipality" => "Albania", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3145517794", "establishment_id" => 3, "created_at" => "2022-06-07T00:49:59.000000Z", "updated_at" => "2022-06-07T00:49:59.000000Z"],
            ["id" => 4, "name" => "Escuela Rural de La Granjita", "dane_code" => "244078001484", "address" => "Rancheria La Granjita", "municipality" => "Barrancas", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3008052296", "establishment_id" => 4, "created_at" => "2022-06-07T01:02:21.000000Z", "updated_at" => "2022-06-07T01:02:21.000000Z"],
            ["id" => 5, "name" => "Escuela Rural Siete de Junio", "dane_code" => "244001000515", "address" => "Barrio Campo Alegre", "municipality" => "Dibulla", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3145517794", "establishment_id" => 5, "created_at" => "2022-06-07T01:15:58.000000Z", "updated_at" => "2022-06-07T01:15:58.000000Z"],
            ["id" => 6, "name" => "Sede Principal", "dane_code" => "2440001001678", "address" => "Vereda Campana Nuevo", "municipality" => "Dibulla", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3104113246", "establishment_id" => 6, "created_at" => "2022-06-07T01:17:43.000000Z", "updated_at" => "2022-06-07T01:17:43.000000Z"],
            ["id" => 7, "name" => "Sede Principal", "dane_code" => "244090003069", "address" => "Corregimiento de Palomino", "municipality" => "Dibulla", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3175849898", "establishment_id" => 7, "created_at" => "2022-06-07T01:19:23.000000Z", "updated_at" => "2022-06-07T01:19:23.000000Z"],
            ["id" => 8, "name" => "Escuela Tomas Emilio Medina Curiel", "dane_code" => "144560000067", "address" => "Calle 17 Nro 19-46", "municipality" => "Fonseca", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "0000000000", "establishment_id" => 8, "created_at" => "2022-06-07T01:20:26.000000Z", "updated_at" => "2022-06-07T01:20:26.000000Z"],
            ["id" => 9, "name" => "Escuela Cleotilde Povea de Romero", "dane_code" => "144560000067", "address" => "Cra 20 Nro 10B-12", "municipality" => "Fonseca", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3164619810", "establishment_id" => 8, "created_at" => "2022-06-07T01:21:15.000000Z", "updated_at" => "2022-06-07T01:21:15.000000Z"],
            ["id" => 10, "name" => "Escuela Mixta Emira Armenta", "dane_code" => "244560000067", "address" => "Cra 3 Nro 2-67", "municipality" => "La Jagua del Pilar", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3134077030", "establishment_id" => 9, "created_at" => "2022-06-07T01:22:29.000000Z", "updated_at" => "2022-06-07T01:22:29.000000Z"],
            ["id" => 11, "name" => "Sede Principal", "dane_code" => "244560000037", "address" => "Corregimiento del Pájaro", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "0000000000", "establishment_id" => 10, "created_at" => "2022-06-07T01:24:00.000000Z", "updated_at" => "2022-06-07T01:24:00.000000Z"],
            ["id" => 12, "name" => "Escuela Rural Indígena Amaichon #1", "dane_code" => "244560001661", "address" => "Comunidad Amaichon", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "0000000000", "establishment_id" => 10, "created_at" => "2022-06-07T01:25:12.000000Z", "updated_at" => "2022-06-07T01:25:12.000000Z"],
            ["id" => 13, "name" => "Escuela Rural Indígena Tatailamana", "dane_code" => "244560001734", "address" => "Corregimiento del Pájaro", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "0000000000", "establishment_id" => 10, "created_at" => "2022-06-07T01:26:32.000000Z", "updated_at" => "2022-06-07T01:26:32.000000Z"],
            ["id" => 14, "name" => "Escuela Urbana Mixta Primero de Octubre", "dane_code" => "24456000067", "address" => "Calle 14 Nro 5-41", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3144545651", "establishment_id" => 11, "created_at" => "2022-06-07T01:28:00.000000Z", "updated_at" => "2022-06-07T01:28:00.000000Z"],
            ["id" => 15, "name" => "Sede Principal", "dane_code" => "244560003362", "address" => "Comunidad Kanaan", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3214537196", "establishment_id" => 12, "created_at" => "2022-06-07T01:29:10.000000Z", "updated_at" => "2022-06-07T01:29:10.000000Z"],
            ["id" => 16, "name" => "Sede Principal", "dane_code" => "244560004253", "address" => "Rancheria Ishashimana", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3154144725", "establishment_id" => 13, "created_at" => "2022-06-07T01:30:11.000000Z", "updated_at" => "2022-06-07T01:30:11.000000Z"],
            ["id" => 17, "name" => "Escuela Rural Indigena Chojonchon", "dane_code" => "244560003478", "address" => "Rancheria Chojonchon", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3008052296", "establishment_id" => 13, "created_at" => "2022-06-07T01:31:08.000000Z", "updated_at" => "2022-06-07T01:31:08.000000Z"],
            ["id" => 18, "name" => "Escuela Urbana Santa Rita de Cassia", "dane_code" => "2445600000211", "address" => "Calle 2 N 8-50", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3002781670", "establishment_id" => 14, "created_at" => "2022-06-07T01:33:05.000000Z", "updated_at" => "2022-06-07T01:33:05.000000Z"],
            ["id" => 19, "name" => "Sede Principal", "dane_code" => "244560000151", "address" => "Corregimiento Mayapo", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3114114457", "establishment_id" => 15, "created_at" => "2022-06-07T01:34:09.000000Z", "updated_at" => "2022-06-07T01:34:09.000000Z"],
            ["id" => 20, "name" => "Escuela Rural Indígena Manzana", "dane_code" => "244560000568", "address" => "Corregimiento Mayapo", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3216975095", "establishment_id" => 15, "created_at" => "2022-06-07T01:34:51.000000Z", "updated_at" => "2022-06-07T01:34:51.000000Z"],
            ["id" => 21, "name" => "Escuela Rural Indígena Iyospa", "dane_code" => "244560002196", "address" => "Ranchería Fatima", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3163849660", "establishment_id" => 16, "created_at" => "2022-06-07T01:35:53.000000Z", "updated_at" => "2022-06-07T01:35:53.000000Z"],
            ["id" => 22, "name" => "Escuela Rural Indígena Ricardo Gomez", "dane_code" => "244560000681", "address" => "Caraca Ruleya", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3135618416", "establishment_id" => 16, "created_at" => "2022-06-07T02:58:22.000000Z", "updated_at" => "2022-06-07T02:58:22.000000Z"],
            ["id" => 23, "name" => "Sede Principal", "dane_code" => "244560003834", "address" => "Ranchería Maracari", "municipality" => "Manaure", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3135905197", "establishment_id" => 17, "created_at" => "2022-06-07T03:00:00.000000Z", "updated_at" => "2022-06-07T03:00:00.000000Z"],
            ["id" => 24, "name" => "Sede El pasito", "dane_code" => "3004215140", "address" => "Comunidad El Pasito", "municipality" => "Riohacha", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3004215140", "establishment_id" => 19, "created_at" => "2022-06-07T03:01:43.000000Z", "updated_at" => "2022-06-07T03:01:43.000000Z"],
            ["id" => 25, "name" => "Sede Paraver", "dane_code" => "244001003514", "address" => "Comunidad Paraver", "municipality" => "Riohacha", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3106120762", "establishment_id" => 20, "created_at" => "2022-06-07T03:02:50.000000Z", "updated_at" => "2022-06-07T03:02:50.000000Z"],
            ["id" => 26, "name" => "Sede Kousachon", "dane_code" => "24400001005011", "address" => "Comunidad Kousachon", "municipality" => "Riohacha", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "3008052296", "establishment_id" => 18, "created_at" => "2022-06-07T03:04:06.000000Z", "updated_at" => "2022-06-07T03:04:06.000000Z"],
            ["id" => 27, "name" => "Sede Mañature", "dane_code" => "244001004529", "address" => "Resguardo Mañature", "municipality" => "Riohacha", "department" => "La Guajira", "email" => "mail@mail.com", "phone" => "0000000000", "establishment_id" => 21, "created_at" => "2022-06-07T03:05:06.000000Z", "updated_at" => "2022-06-07T03:05:06.000000Z"]
        ];

        foreach ($headquarters as $value) {
            Headquarters::create([
                'id' => $value['id'],
                'name' => $value['name'],
                'dane_code' => $value['dane_code'],
                'address' => $value['address'],
                'municipality' => $value['municipality'],
                'department' => $value['department'],
                'email' => $value['email'],
                'phone' => $value['phone'],
                'establishment_id' => $value['establishment_id'],
            ]);
        }


    }

}
