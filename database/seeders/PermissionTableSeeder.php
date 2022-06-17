<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permisos = [
            [1, 'ver dashboard', 'sanctum', '2022-01-04 13:32:03', '2022-01-04 13:32:03'],
            [2, 'crear rol', 'sanctum', '2022-01-04 13:32:12', '2022-01-04 13:32:12'],
            [3, 'edit rol', 'sanctum', '2022-01-04 13:32:21', '2022-01-04 15:03:40'],
            [4, 'ver user', 'sanctum', '2022-01-04 13:33:01', '2022-01-04 13:33:01'],
            [5, 'ver persona', 'sanctum', '2022-01-04 13:33:12', '2022-01-04 13:33:12'],
            [6, 'ver rol', 'sanctum', '2022-01-04 13:33:22', '2022-01-04 15:03:47'],
            [7, 'ver permisos', 'sanctum', '2022-01-04 13:33:33', '2022-01-04 13:33:33'],
            [8, 'edit persona', 'sanctum', '2022-01-04 13:33:45', '2022-01-04 13:33:45'],
            [9, 'eliminar persona', 'sanctum', '2022-01-04 13:33:58', '2022-01-04 13:33:58'],
            [10, 'crear persona', 'sanctum', '2022-01-04 13:34:07', '2022-01-04 13:34:07'],
            [11, 'asignar permisos', 'sanctum', '2022-01-04 15:02:26', '2022-01-04 15:02:26'],
            [12, 'get permisos', 'sanctum', '2022-01-04 15:02:49', '2022-01-04 15:02:49'],
            [13, 'eliminar rol', 'sanctum', '2022-01-04 15:04:15', '2022-01-04 15:04:15'],
            [14, 'asignar roles', 'sanctum', '2022-01-05 02:25:27', '2022-01-05 02:25:27'],
            [15, 'quitar roles', 'sanctum', '2022-01-05 02:25:59', '2022-01-05 02:25:59']
        ];

        foreach ($permisos as $permisos) {
            Permission::create([
                'id' => $permisos[0],
                'name' => $permisos[1],
                'guard_name' => $permisos[2],
            ]);
        }
    }
}
