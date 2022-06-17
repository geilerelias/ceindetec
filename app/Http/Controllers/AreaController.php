<?php

namespace App\Http\Controllers;

use App\Models\Area;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class AreaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Area::all();
        return Inertia::render('Dashboard/Area/Index', ['data' => $data]);
    }


    public function all()
    {
        return Area::all();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
            'establishments_id' => ['required'],
        ])->validate();

        Area::create($request->all());

        return redirect()->back()
            ->with('message', 'Area curricular creada correctamente.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Area $area
     * @return \Illuminate\Http\Response
     */
    public function show(Area $area)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Area $area
     * @return \Illuminate\Http\Response
     */
    public function edit(Area $area)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Area $area
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Area $area)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
            'establishments_id' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            Area::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Area curricular actualizada correctamente.');
        }

        return redirect()->back()
            ->withErrors('message', 'Ah ocurrido un error.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Area $area
     * @return \Illuminate\Http\Response
     */
    public function destroy(Area $area)
    {
        $area->delete();
        return redirect()->back()->with('message', 'Area curricular eliminada correctamente.');
    }
}
