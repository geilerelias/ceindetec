<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RoleController;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\EstablishmentController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/welcome', function () {
    return view('welcome');
});

Route::get('/', function () {
    return Inertia\Inertia::render('Home');
})->name('home');

Route::get('/allies', function () {
    return Inertia\Inertia::render('Allies');
})->name('allies');

Route::get('/agreements', function () {
    return Inertia\Inertia::render('Agreements');
})->name('agreements');

Route::get('/customers', function () {
    return Inertia\Inertia::render('Customers');
})->name('customers');

Route::get('/blog', function () {
    return Inertia\Inertia::render('Blog');
})->name('blog');


Route::get('/about-us', function () {
    return Inertia\Inertia::render('AboutUs');
})->name('about-us');

Route::get('/contact-us', function () {
    return Inertia\Inertia::render('ContactUs');
})->name('contact-us');


Route::middleware(['auth:sanctum', 'verified',])->group(function () {
    Route::middleware(['can:view dashboard'])->get('/dashboard', function () {
        return Inertia\Inertia::render('Dashboard');
    })->name('dashboard');

    Route::get('/dashboard/schedule', function () {
        return Inertia\Inertia::render('Dashboard/Schedule/Index');
    })->name('schedule');

    Route::get('/dashboard/reports', function () {
        return Inertia\Inertia::render('Dashboard/Reports/Index');
    })->name('reports');

    /*Route::get('/dashboard/establishment', function () {
        return Inertia\Inertia::render('Dashboard/Establishment/Index');
    })->name('establishment');*/

    Route::resource('/dashboard/establishment', EstablishmentController::class);

});


//spatie Permission laravel
Route::middleware(['auth:sanctum', 'verified'])
    ->get('/role/all', [RoleController::class, 'all']);
Route::middleware(['auth:sanctum', 'verified'])
    ->post('/role/assign/permissions', [RoleController::class, 'assignPermissions']);
Route::middleware(['auth:sanctum', 'verified'])
    ->get('/role/{role}/permissions', [RoleController::class, 'getPermissions']);
Route::middleware(['auth:sanctum', 'verified'])
    ->resource('role', RoleController::class);

Route::middleware(['auth:sanctum', 'verified'])
    ->get('/permission/all', [PermissionController::class, 'all']);
Route::middleware(['auth:sanctum', 'verified'])
    ->resource('permission', PermissionController::class);

Route::middleware(['auth:sanctum', 'verified'])
    ->post('/user/assign/roles', [UserController::class, 'assignRole']);
Route::middleware(['auth:sanctum', 'verified'])
    ->post('/user/remove/roles', [UserController::class, 'removeRole']);
Route::middleware(['auth:sanctum', 'verified'])
    ->get('/user/{user}/roles', [UserController::class, 'getRoleNames']);

Route::middleware(['auth:sanctum', 'verified'])->resource('user', UserController::class);

Route::get('/example', function (Request $request) {
    $role = Role::find('admin');
    dd($role);
});
