<?php

namespace App\Http\Controllers;

use App\Models\Establishment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;
use mysql_xdevapi\Result;
use PhpParser\Node\Expr\Array_;

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

    public function getHeadquarters($id)
    {
        return Establishment::find($id)->headquarters;
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
            'municipality' => ['required'],
            'department' => ['required'],
        ])->validate();

        /* $establishment = new Establishment();
         foreach ($request->all() as $clave => $valor) {
             $establishment[$clave] = $valor;
         }

         $establishment->save();*/

        Establishment::create($request->all());
        return redirect()->route('establishment.index')
            ->with(['message' => 'Establishment Created Successfully.', 'data' => 'el espacio de este lugar es para investigacion']);
    }

    public function show(Establishment $establishment)
    {
        return Inertia::render('Dashboard/Establishment/Show', ['data' => $establishment]);
    }

    public function edit(Establishment $establishment)
    {
        return Inertia::render('Dashboard/Establishment/Edit', ['data' => $establishment]);
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
            Establishment::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Establecimiento actualizado correctamente.');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function destroy(Request $request, Establishment $establishment)
    {
        $establishment->delete();
        return redirect()->back();
    }
}
