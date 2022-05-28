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
            [1, 'admin', 'sanctum', '2022-01-04 13:32:03'],
            [2, 'directivo', 'sanctum', '2022-01-04 13:32:12'],
            [3, 'administrativo', 'sanctum', '2022-01-04 13:32:21'],
            [4, 'docente', 'sanctum', '2022-01-04 13:33:01'],
            [5, 'estudiante', 'sanctum', '2022-01-04 13:33:12'],
            [6, 'acudiente', 'sanctum', '2022-01-04 13:33:22'],
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
