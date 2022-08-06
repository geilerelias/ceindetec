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
            [1, 'Ver dashboard', 'sanctum', '2022-01-04 13:32:03', '2022-01-04 13:32:03'],
            [2, 'Crear rol', 'sanctum', '2022-01-04 13:32:12', '2022-01-04 13:32:12'],
            [3, 'Edit rol', 'sanctum', '2022-01-04 13:32:21', '2022-01-04 15:03:40'],
            [4, 'Ver user', 'sanctum', '2022-01-04 13:33:01', '2022-01-04 13:33:01'],
            [5, 'Ver persona', 'sanctum', '2022-01-04 13:33:12', '2022-01-04 13:33:12'],
            [6, 'Ver rol', 'sanctum', '2022-01-04 13:33:22', '2022-01-04 15:03:47'],
            [7, 'Ver permisos', 'sanctum', '2022-01-04 13:33:33', '2022-01-04 13:33:33'],
            [8, 'Edit persona', 'sanctum', '2022-01-04 13:33:45', '2022-01-04 13:33:45'],
            [9, 'Eliminar persona', 'sanctum', '2022-01-04 13:33:58', '2022-01-04 13:33:58'],
            [10, 'Crear persona', 'sanctum', '2022-01-04 13:34:07', '2022-01-04 13:34:07'],
            [11, 'Asignar permisos', 'sanctum', '2022-01-04 15:02:26', '2022-01-04 15:02:26'],
            [12, 'Get permisos', 'sanctum', '2022-01-04 15:02:49', '2022-01-04 15:02:49'],
            [13, 'Eliminar rol', 'sanctum', '2022-01-04 15:04:15', '2022-01-04 15:04:15'],
            [14, 'Asignar roles', 'sanctum', '2022-01-05 02:25:27', '2022-01-05 02:25:27'],
            [15, 'Quitar roles', 'sanctum', '2022-01-05 02:25:59', '2022-01-05 02:25:59'],
            [16, 'Crear qrcode', 'sanctum', '2022-01-05 02:25:59', '2022-01-05 02:25:59'],
            [17, 'Ver qrcode', 'sanctum', '2022-01-05 02:25:59', '2022-01-05 02:25:59'],
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
