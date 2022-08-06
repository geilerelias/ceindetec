<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $roles = [
            [1, 'Admin', 'sanctum', '2022-01-04 13:32:03'],
            [2, 'Directivo', 'sanctum', '2022-01-04 13:32:12'],
            [3, 'Administrativo', 'sanctum', '2022-01-04 13:32:21'],
            [4, 'Docente', 'sanctum', '2022-01-04 13:33:01'],
            [5, 'Estudiante', 'sanctum', '2022-01-04 13:33:12'],
            [6, 'Acudiente', 'sanctum', '2022-01-04 13:33:22'],
        ];

        foreach ($roles as $role) {
            Role::create([
                'id' => $role[0],
                'name' => $role[1],
                'guard_name' => $role[2],
                'created_at' => $role[3],
            ]);
        }
    }
}
