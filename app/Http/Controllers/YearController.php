<?php

namespace App\Http\Controllers;

use App\Models\Year;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class YearController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Year::all();
        return Inertia::render('Dashboard/Year/Index', ['data' => $data]);
    }

    public function all()
    {
        return Year::all();
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
            'starts_at' => ['required'],
            'ends_at' => ['required'],
        ])->validate();

        Year::create($request->all());

        return redirect()->back()
            ->with('message', 'Año lectivo creado correctamente.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Year $year
     * @return \Illuminate\Http\Response
     */
    public function show(Year $year)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Year $year
     * @return \Illuminate\Http\Response
     */
    public function edit(Year $year)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Year $year
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Year $year)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
            'establishments_id' => ['required'],
            'starts_at' => ['required'],
            'ends_at' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            Year::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Año lectivo actualizado correctamente.');
        }

        return redirect()->back()
            ->withErrors('message', 'Ah ocurrido un error.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Year $year
     * @return \Illuminate\Http\Response
     */
    public function destroy(Year $year)
    {
        $year->delete();
        return redirect()->back()->with('message', 'Año lectivo eliminado correctamente.');
    }
}
