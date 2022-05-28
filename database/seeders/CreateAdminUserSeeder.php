<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $userAdmin = User::firstOrNew([
            'name' => 'Geiler Elias Radillo Sarmiento',
            'email' => 'geilerelias@gmail.com',
            'password' => bcrypt('gers150595')
        ]);
        $userAdmin->save();

        $role = Role::firstOrNew(['name'=> 'admin']);

        $permissions = Permission::pluck('id', 'id')->all();

        $role->syncPermissions($permissions);

        $userAdmin->assignRole([$role->id]);

        $user = User::firstOrNew([
            'name' => 'Ledis Beatriz Sarmiento',
            'email' => 'ledisbersage@gmail.com',
            'password' => bcrypt('cristiana')
        ]);
        $user->save();
    }
}
