<?php

namespace App\Http\Controllers;

use App\Models\StudyPlan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class StudyPlanController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = StudyPlan::all();
        return Inertia::render('Dashboard/StudyPlan/Index', ['data' => $data]);
    }


    public function all()
    {
        return StudyPlan::all();
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
            'year_id' => ['required'],
        ])->validate();

        StudyPlan::create($request->all());

        return redirect()->back()
            ->with('message', 'Plan de estudio creado correctamente.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\StudyPlan $studyPlan
     * @return \Illuminate\Http\Response
     */
    public function show(StudyPlan $studyPlan)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\StudyPlan $studyPlan
     * @return \Illuminate\Http\Response
     */
    public function edit(StudyPlan $studyPlan)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\StudyPlan $studyPlan
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, StudyPlan $studyPlan)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
            'establishments_id' => ['required'],
            'year_id' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            StudyPlan::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Plan de estudio actualizado correctamente.');
        }

        return redirect()->back()
            ->withErrors('message', 'Ah ocurrido un error.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\StudyPlan $studyPlan
     * @return \Illuminate\Http\Response
     */
    public function destroy(StudyPlan $studyPlan)
    {
        $studyPlan->delete();
        return redirect()->back()->with('message', 'Plan de estudio eliminado correctamente.');
    }
}
