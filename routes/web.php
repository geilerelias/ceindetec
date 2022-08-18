<?php


use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PermissionController;
use App\Http\Controllers\RoleController;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\EstablishmentController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\HeadquartersController;
use App\Http\Controllers\PensumController;
use App\Http\Controllers\YearController;
use App\Http\Controllers\StudyPlanController;
use App\Http\Controllers\PersonController;

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

Route::get('/qrcode/print', [\App\Http\Controllers\QrCodeController::class, 'print']);
Route::get('/qrcode/search-edit', [\App\Http\Controllers\QrCodeController::class, 'searchEdit']);
Route::get('/qrcode/search/{consecutive}', [\App\Http\Controllers\QrCodeController::class, 'search']);
Route::get('/qrcode/{consecutive}', [\App\Http\Controllers\QrCodeController::class, 'showQr']);
Route::get('/qrcode/generate/{starts_in}/{ends_in}', [\App\Http\Controllers\QrCodeController::class, 'generate']);
Route::resource('/qrcode', \App\Http\Controllers\QrCodeController::class);

Route::get('/contact-us', function () {
    return Inertia\Inertia::render('ContactUs');
})->name('contact-us');

Route::get('/benefited', function () {
    return Inertia\Inertia::render('Benefited/Follow');
})->name('follow');

Route::get('/dashboard/work/adequacy/{municipality}/{establishments}/{headquarters}', function ($municipality, $establishments, $headquarters) {
    # [\App\Http\Controllers\WorkController::class, 'adequacy'])
    return Inertia\Inertia::render('Benefited/Adequacy',
        ['data' => ["municipality" => $municipality, "headquarters" => $headquarters, "establishments" => $establishments]]
    );
})->name('work.adequacy');

Route::get('/dashboard/work/building/{municipality}/{establishments}/{headquarters}',
    [\App\Http\Controllers\WorkController::class, 'building'])->name('work.building');


Route::get('/back', function () {
    //return back();
    return redirect()->back();

    return redirect()->previous();

    return url()->previous();
})->name('back');

//sedes de establecimientos
Route::get('/dashboard/headquarters/all', [HeadquartersController::class, 'all']);
Route::get('/dashboard/headquarters/{id}/establishment', [HeadquartersController::class, 'getEstablishment']);

//establecimientos educativos
Route::get('/dashboard/establishment/all', [EstablishmentController::class, 'all']);
Route::get('/dashboard/establishment/{id}/headquarters', [EstablishmentController::class, 'getHeadquarters']);

Route::get('/dashboard/work/all', [\App\Http\Controllers\WorkController::class, 'all']);
Route::get('/dashboard/work/group-by/{group}', [\App\Http\Controllers\WorkController::class, 'groupBy']);


Route::middleware(['auth:sanctum', 'verified', 'can:Ver dashboard'])->group(function () {
    //middleware(['can:view dashboard'])->

    Route::get('/dashboard', function () {
        return Inertia\Inertia::render('Dashboard');
    })->name('dashboard');

    Route::get('/dashboard/schedule', function () {
        return Inertia\Inertia::render('Dashboard/Schedule/Index');
    })->name('schedule');

    Route::get('/dashboard/reports', function () {
        return Inertia\Inertia::render('Dashboard/Reports/Index');
    })->name('reports');


    /*    Route::post('/dashboard/work/building', [\App\Http\Controllers\WorkController::class, 'building'])->name('work.building');*/
    Route::resource('/dashboard/work', \App\Http\Controllers\WorkController::class);
    Route::resource('/dashboard/seguimiento', \App\Http\Controllers\TracingController::class);


    /*Route::get('/dashboard/establishment', function () {
        return Inertia\Inertia::render('Dashboard/Establishment/Index');
    })->name('establishment');*/

    //establecimientos educativos
    Route::resource('/dashboard/establishment', EstablishmentController::class);

    //sedes de establecimientos
    Route::resource('/dashboard/headquarters', HeadquartersController::class);

    //personas
    Route::get('/dashboard/person/student/create', [PersonController::class, 'createStudent'])->name('person.create.student');
    Route::get('/dashboard/person/student', [PersonController::class, 'indexStudent'])->name('person.index.student');
    Route::get('/dashboard/person/teacher', [PersonController::class, 'createTeacher'])->name('person.create.teacher');
    Route::get('/dashboard/person/attendant', [PersonController::class, 'createAttendant'])->name('person.create.attendant');
    Route::resource('/dashboard/person', PersonController::class);


    //años académicos
    Route::get('/dashboard/year/all', [YearController::class, 'all']);
    Route::resource('/dashboard/year', YearController::class);

    //planes de estudios académicos
    Route::get('/dashboard/study-plans/all', [StudyPlanController::class, 'all']);
    Route::resource('/dashboard/study-plans', StudyPlanController::class);


    //areas
    Route::resource('/dashboard/area', \App\Http\Controllers\AreaController::class);

    //asignaturas
    Route::resource('/dashboard/subject', \App\Http\Controllers\SubjectController::class);

    //Curso
    Route::resource('/dashboard/grade', \App\Http\Controllers\GradeController::class);


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
});

Route::get('/example', function (Request $request) {
    $role = Role::find('admin');
    dd($role);
});

Route::resource('/posts', PostController::class);

Route::get('before-during-after', function () {
    return Inertia\Inertia::render('BeforeDuringAfter/Index');
})->name('before_during_after');

Route::get('before-during-after/building', function () {
    return Inertia\Inertia::render('BeforeDuringAfter/Building');
})->name('before_during_after.building');

Route::get('before-during-after/adequacy', function () {
    return Inertia\Inertia::render('BeforeDuringAfter/Adequacy');
})->name('before_during_after.adequacy');


Route::get('/find/{page}/{folder?}/{sub?}', function ($page, $folder, $sub) {
    $directory = base_path() . '/resources/images/' . $page . '/' . $folder . '/' . $sub;
    $dirint = dir($directory);
    $images = array();
    while (($archivo = $dirint->read()) !== false) {
        if ($archivo != "." && $archivo != "..") {
            array_push($images, $archivo);
        }
    }
    $dirint->close();
    return json_encode($images);
});

Route::get('/storage/{folder}/{filename}', function ($folder, $filename) {

    try {
        $path = storage_path() . '/app/' . $folder . '/' . $filename;

        //si no se encuentra lanzamos un error 404.
        if (!Storage::exists($folder . '/' . $filename)) {
            abort(404);
        }

        $file = File::get($path);
        $type = File::mimeType($path);

        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);
        return $response;
    } catch (\Throwable $th) {
        return $th->getMessage();
    }
});

Route::get('/src/{page?}/{folder?}/{sub?}/{filename}', function ($page = "null", $folder = "null", $sub = "null", $filename) {
    try {
        $path = '';
        if ($page == "null") {
            $path = base_path() . '/resources/images/' . $filename;
        } elseif ($folder == "null") {
            $path = base_path() . '/resources/images/' . $page . '/' . $filename;
        } elseif ($sub == "null") {
            $path = base_path() . '/resources/images/' . $page . '/' . $folder . '/' . $filename;
        } else {
            $path = base_path() . '/resources/images/' . $page . '/' . $folder . '/' . $sub . '/' . $filename;
            //$path = storage_path() . '/app/' . $folder . '/' . $filename;
        }
        $file = File::get($path);
        $type = File::mimeType($path);

        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);

        return $response;

    } catch (Throwable $th) {
        return $th->getMessage();
    }
});

Route::get('/get/route/seguimiento/{type}/{municipality}/{establishments}/{headquarters}', function ($type, $municipality, $establishments, $headquarters) {
    $directory = base_path() . '/resources/seguimiento/' . $type . '/' . $municipality . '/' . trim($establishments, " ") . '/' . trim($headquarters, " ");

    try {
        if (!file_exists($directory)) {
            mkdir($directory, 0777, true);
        }
        // array_push($images, listar_directorios_ruta($directory));

        return json_encode(listadoDirectorio($directory));
    } catch (Exception $e) {
        echo 'Excepción capturada: ', $e->getMessage(), "\n";
    }
    return $directory;
});

Route::get('/get/src/seguimiento/{type}/{municipality}/{establishments}/{headquarters}/{folder}/{file}', function ($type, $municipality, $establishments, $headquarters, $folder, $file) {
    $directory = base_path() . '/resources/seguimiento/' . $type . '/' . $municipality . '/' . trim($establishments, " ") . '/' . trim($headquarters, " ") . '/EVIDENCIAS FOTOGRAFICAS/' . trim($folder, " ") . '/' . trim($file, " ");
    try {

        $file = File::get($directory);
        $type = File::mimeType($directory);

        $response = Response::make($file, 200);
        $response->header("Content-Type", $type);

        return $response;
    } catch (Exception $e) {
        echo 'Excepción capturada: ', $e->getMessage(), "\n";
    }
    return $directory;
});

Route::get('/get/file/{path}', function ($path) {

    $fp = fopen($path, "r");

    while (!feof($fp)) {
        $linea = fgets($fp);
        echo $linea;
    }

    fclose($fp);

});

function listadoDirectorio($directorio)
{
    $folder = array();
    $listado = scandir($directorio);
    unset($listado[array_search('.', $listado, true)]);
    unset($listado[array_search('..', $listado, true)]);
    if (count($listado) < 1) {
        array_push($folder, 'directorio vacío');
    }
    foreach ($listado as $elemento) {


        if (is_dir($directorio . '/' . $elemento)) {

            //echo '<li class="open-dropdown">+ ' . $elemento . '</li>';
            //echo '<ul class="dropdown d-none">';
            //echo '</ul>';

            $array = array(
                'folder' => $elemento,
                'sub' => listadoDirectorio($directorio . '/' . $elemento),
            );

            array_push($folder, $array);
        }

        if (!is_dir($directorio . '/' . $elemento)) {
            //echo "<li>- <a href='$directorio/$elemento'>$elemento</a></li>";
            array_push($folder, $elemento);
        }
    }

    return $folder;
}


Route::get('/developer/gers', function () {
    return Inertia\Inertia::render('Gers');
})->name('developer.gers');


Route::get('/update-qrcode/', function () {
    echo "actualización de información";
});



