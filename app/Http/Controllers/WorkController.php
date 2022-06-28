<?php

namespace App\Http\Controllers;

use App\Models\Work;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class WorkController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = $this::all();
        return Inertia::render('Dashboard/Tracing/Work', ['data' => $data]);

    }

    protected function all()
    {
        return Work::all();
    }

    protected function groupBy($group)
    {
        return Work::all()->groupBy($group);
    }

    protected function adequacy($municipality, $establishments, $headquarters)
    {
        //DB::table('works')->where('votes', 100)->get();
        // $data = Work::where('work_type', 'Adecuación')->get();
        return Inertia::render('Dashboard/Tracing/Adequacy', ['data' => ["municipality" => $municipality, "headquarters" => $headquarters, "establishments" => $establishments]]);
    }


    protected function building($municipality, $establishments, $headquarters)
    {
        /* $data = Work::where('work_type', 'Construcción')->get();
         return Inertia::render('Dashboard/Tracing/Building', ['data' => $data]);*/
        return Inertia::render('Dashboard/Tracing/Building', ['data' => ["municipality" => $municipality, "headquarters" => $headquarters, "establishments" => $establishments]]);

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Area $area
     * @return \Illuminate\Http\Response
     */
    public function show(Work $work)
    {
        $this::index();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function store(Request $request)
    {
        Validator::make($request->all(), [
            'work_type' => ['required'],
            'coordinates' => ['required'],
            'establishments_id' => ['required'],
            'headquarters_id' => ['required'],
        ])->validate();

        Work::create($request->all());

        return redirect()->back()
            ->with('message', 'Obra creada correctamente.');
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function update(Request $request)
    {
        Validator::make($request->all(), [
            'work_type' => ['required'],
            'coordinates' => ['required'],
            'establishments_id' => ['required'],
            'headquarters_id' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            Work::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Obra actualizada correctamente.');
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
            Work::find($request->input('id'))->delete();
            return redirect()->back()->with('message', 'Obra eliminada correctamente.');;
        }
    }
}
