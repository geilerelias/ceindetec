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

Route::get('/package', function () {
    return Inertia\Inertia::render('Package');
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
Route::get('/qrcode/search-show', [\App\Http\Controllers\QrCodeController::class, 'searchShow']);
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


Route::middleware(['auth:sanctum', 'verified'])->group(function () {
    // 'can:Ver dashboard'

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
    Route::controller(RoleController::class)->group(function () {
        Route::middleware(['auth:sanctum', 'verified'])
            ->get('/role/all', 'all');

        Route::middleware(['auth:sanctum', 'verified'])
            ->post('/role/assign/permissions', 'assignPermissions');

        Route::middleware(['auth:sanctum', 'verified'])
            ->get('/role/{role}/permissions', 'getPermissions');
    });

    Route::middleware(['auth:sanctum', 'verified'])
        ->resource('role', RoleController::class);

    Route::middleware(['auth:sanctum', 'verified',])
        ->get('/permission/all', [PermissionController::class, 'all']);

    Route::middleware(['auth:sanctum', 'verified',])
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
    //echo "actualización de información";
    $qrcode = new \App\Models\QrCode();
    $trapezoidales = [
        array('CONV005-001000', 'active', 'Mesas Trapezoidal', 5, 5),
        array('CONV005-001001', 'active', 'Mesas Trapezoidal', 5, 5),
        array('CONV005-001002', 'active', 'Mesas Trapezoidal', 5, 5),
        array('CONV005-001003', 'active', 'Mesas Trapezoidal', 5, 5),
        array('CONV005-001004', 'active', 'Mesas Trapezoidal', 7, 7),
        array('CONV005-001005', 'active', 'Mesas Trapezoidal', 7, 7),
        array('CONV005-001006', 'active', 'Mesas Trapezoidal', 7, 7),
        array('CONV005-001007', 'active', 'Mesas Trapezoidal', 7, 7),
        array('CONV005-001008', 'active', 'Mesas Trapezoidal', 3, 3),
        array('CONV005-001009', 'active', 'Mesas Trapezoidal', 3, 3),
        array('CONV005-001010', 'active', 'Mesas Trapezoidal', 3, 3),
        array('CONV005-001011', 'active', 'Mesas Trapezoidal', 3, 3),
        array('CONV005-001012', 'active', 'Mesas Trapezoidal', 1, 1),
        array('CONV005-001013', 'active', 'Mesas Trapezoidal', 1, 1),
        array('CONV005-001014', 'active', 'Mesas Trapezoidal', 1, 1),
        array('CONV005-001015', 'active', 'Mesas Trapezoidal', 1, 1),
        array('CONV005-001016', 'active', 'Mesas Trapezoidal', 9, 10),
        array('CONV005-001017', 'active', 'Mesas Trapezoidal', 9, 10),
        array('CONV005-001018', 'active', 'Mesas Trapezoidal', 9, 10),
        array('CONV005-001019', 'active', 'Mesas Trapezoidal', 9, 10),
        array('CONV005-001020', 'active', 'Mesas Trapezoidal', 18, 26),
        array('CONV005-001021', 'active', 'Mesas Trapezoidal', 18, 26),
        array('CONV005-001022', 'active', 'Mesas Trapezoidal', 18, 26),
        array('CONV005-001023', 'active', 'Mesas Trapezoidal', 18, 26),
        array('CONV005-001024', 'active', 'Mesas Trapezoidal', 21, 27),
        array('CONV005-001025', 'active', 'Mesas Trapezoidal', 21, 27),
        array('CONV005-001026', 'active', 'Mesas Trapezoidal', 21, 27),
        array('CONV005-001027', 'active', 'Mesas Trapezoidal', 21, 27),
        array('CONV005-001028', 'active', 'Mesas Trapezoidal', 12, 15),
        array('CONV005-001029', 'active', 'Mesas Trapezoidal', 12, 15),
        array('CONV005-001030', 'active', 'Mesas Trapezoidal', 12, 15),
        array('CONV005-001031', 'active', 'Mesas Trapezoidal', 12, 15),
        array('CONV005-001032', 'active', 'Mesas Trapezoidal', 13, 16),
        array('CONV005-001033', 'active', 'Mesas Trapezoidal', 13, 16),
        array('CONV005-001034', 'active', 'Mesas Trapezoidal', 13, 16),
        array('CONV005-001035', 'active', 'Mesas Trapezoidal', 13, 16),
        array('CONV005-001036', 'active', 'Mesas Trapezoidal', 14, 18),
        array('CONV005-001037', 'active', 'Mesas Trapezoidal', 14, 18),
        array('CONV005-001038', 'active', 'Mesas Trapezoidal', 14, 18),
        array('CONV005-001039', 'active', 'Mesas Trapezoidal', 14, 18),
        array('CONV005-001040', 'active', 'Mesas Trapezoidal', 11, 14),
        array('CONV005-001041', 'active', 'Mesas Trapezoidal', 11, 14),
        array('CONV005-001042', 'active', 'Mesas Trapezoidal', 11, 14),
        array('CONV005-001043', 'active', 'Mesas Trapezoidal', 11, 14),
        array('CONV005-001044', 'active', 'Mesas Trapezoidal', 15, 19),
        array('CONV005-001045', 'active', 'Mesas Trapezoidal', 15, 19),
        array('CONV005-001046', 'active', 'Mesas Trapezoidal', 15, 19),
        array('CONV005-001047', 'active', 'Mesas Trapezoidal', 15, 19),
        array('CONV005-001048', 'active', 'Mesas Trapezoidal', 15, 20),
        array('CONV005-001049', 'active', 'Mesas Trapezoidal', 15, 20),
        array('CONV005-001050', 'active', 'Mesas Trapezoidal', 15, 20),
        array('CONV005-001051', 'active', 'Mesas Trapezoidal', 15, 20),
        array('CONV005-001052', 'active', 'Mesas Trapezoidal', 10, 11),
        array('CONV005-001053', 'active', 'Mesas Trapezoidal', 10, 11),
        array('CONV005-001054', 'active', 'Mesas Trapezoidal', 10, 11),
        array('CONV005-001055', 'active', 'Mesas Trapezoidal', 10, 11),
        array('CONV005-001056', 'active', 'Mesas Trapezoidal', 8, 9),
        array('CONV005-001057', 'active', 'Mesas Trapezoidal', 8, 9),
        array('CONV005-001058', 'active', 'Mesas Trapezoidal', 8, 9),
        array('CONV005-001059', 'active', 'Mesas Trapezoidal', 8, 9),
        array('CONV005-001060', 'active', 'Mesas Trapezoidal', 8, 8),
        array('CONV005-001061', 'active', 'Mesas Trapezoidal', 8, 8),
        array('CONV005-001062', 'active', 'Mesas Trapezoidal', 8, 8),
        array('CONV005-001063', 'active', 'Mesas Trapezoidal', 8, 8),
    ];

    foreach ($trapezoidales as $sub) {
        echo " Consecutive: " . $sub[0] . " status: " . $sub[1] . " description: " . $sub[2] . " establishment_id: " . $sub[3] . " headquarters_id: " . $sub[4];
        $qrcode->consecutive = $sub[0];
        $qrcode->status = $sub[1];
        $qrcode->description = $sub[2];
        $qrcode->establishment_id = $sub[3];
        $qrcode->headquarters_id = $sub[4];
        $qrcode->save();
        echo '</br>';
    }


});



