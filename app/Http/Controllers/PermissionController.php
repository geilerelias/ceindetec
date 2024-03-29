<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use Spatie\Permission\Models\Permission;

class PermissionController extends Controller
{

    public function __construct()
    {
        $this->middleware('can:Ver permisos')->only('index');
        $this->middleware('can:Crear permisos')->only('create', 'store');
        $this->middleware('can:Editar permisos')->only('edit', 'update');
        $this->middleware('can:Eliminar permisos')->only('destroy');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function index()
    {
        $data = Permission::all();
        return Inertia::render('Dashboard/Permission/Permission', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function all()
    {
        return Permission::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
        ])->validate();

        Permission::create($request->all());

        return redirect()->back()
            ->with('message', 'Permission Created Successfully.');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function update(Request $request)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
        ])->validate();


        if ($request->has('id')) {
            $Permission = Permission::find($request->input('id'));
            $Permission->name = $request->name;
            $Permission->save();
            return Redirect::route('permission.index')
                ->with('message', 'Permission Updated Successfully.');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function destroy(Request $request)
    {
        if ($request->has('id')) {
            Permission::find($request->input('id'))->delete();
            return Redirect::route('permission.index');
        }
    }
}
