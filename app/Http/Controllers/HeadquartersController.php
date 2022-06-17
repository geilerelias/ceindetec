<?php

namespace App\Http\Controllers;

use App\Models\Headquarters;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Validator;
use function PHPUnit\Framework\isEmpty;
use function PHPUnit\Framework\isNull;


class HeadquartersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Headquarters::all();;
        return Inertia::render('Dashboard/Headquarters/Index', ['data' => $data]);

    }

    public function all()
    {
        return Headquarters::all();
    }

    public function getEstablishment($id)
    {
        return Headquarters::find($id)->establishments;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return Inertia::render('Dashboard/Headquarters/Create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        Validator::make($request->all(), [
            'name' => ['required'],
            'dane_code' => ['required'],
            'municipality' => ['required'],
            'department' => ['required'],
            'establishments_id' => ['required'],
        ])->validate();

        /* $establishment = new Establishment();
         foreach ($request->all() as $clave => $valor) {
             $establishment[$clave] = $valor;
         }

         $establishment->save();*/

        Headquarters::create($request->all());
        return redirect()->back()
            ->with(['message' => 'Sede  Creada Correctamente.', 'data' => 'el espacio de este lugar es para investigacion']);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Headquarters $headquarters
     * @return \Illuminate\Http\Response
     */
    public function show(Headquarters $headquarters)
    {
        return Inertia::render('Dashboard/Headquarters/Show', ['data' => $headquarters]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Headquarters $headquarters
     * @return \Illuminate\Http\Response
     */
    public function edit(Headquarters $headquarters)
    {
        return Inertia::render('Dashboard/Headquarters/Edit', ['data' => $headquarters]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Headquarters $headquarters
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Headquarters $headquarters)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            Headquarters::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Sede actualizada correctamente.');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Headquarters $headquarters
     * @return \Illuminate\Http\Response
     */
    public function destroy(Headquarters $headquarters)
    {

        if (isset($headquarters->id)) {
            $headquarters->delete();
            return redirect()->back()->with(['message' => 'Sede  Eliminada Correctamente.']);
        }
        return redirect()->back()->withErrors(['message' => 'Error al eliminar la sede.']);
    }
}
