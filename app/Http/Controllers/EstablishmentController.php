<?php

namespace App\Http\Controllers;

use App\Models\Establishment;
use Illuminate\Http\Request;
use Inertia\Inertia;

class EstablishmentController extends Controller
{
    public function __construct()
    {
//        $this->middleware('can:view rol')->only('index');
//        $this->middleware('can:create rol')->only('create', 'store');
//        $this->middleware('can:edit rol')->only('edit', 'update');
//        $this->middleware('can:destroy rol')->only('destroy');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function index()
    {
        $data = Establishment::all();
        return Inertia::render('Dashboard/Establishment/Index', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function all()
    {
        return Establishment::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('Dashboard/Establishment/Create');
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

        Establishment::create($request->all());

        return Redirect::route('establishment.index')
            ->with('message', 'Establishment Created Successfully.', 'data', 'el espacio de este lugar es para investigacion');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function assignPermissions(Request $request)
    {
        $Establishment = Establishment::find($request->Establishment);
        //return $request->permission;
        $Establishment->syncPermissions($request->permission);

        return redirect()->back()
            ->with('message', 'Permissions successfully set.');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function getPermissions(Establishment $Establishment)
    {
        return $Establishment->permissions;
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
            $Establishment = Establishment::find($request->input('id'));
            $Establishment->name = $request->name;
            $Establishment->save();
            return redirect()->back()
                ->with('message', 'Establishment Updated Successfully.');
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
            Establishment::find($request->input('id'))->delete();
            return redirect()->back();
        }
    }
}
