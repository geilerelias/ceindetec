<?php

namespace App\Http\Controllers;

use App\Models\TicketCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class TicketCategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = TicketCategory::all();
        return Inertia::render('Dashboard/Ticket/TicketCategory', ['data' => $data]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
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
            'description' => ['required'],
        ])->validate();

        TicketCategory::create($request->all());

        return redirect()->back()
            ->with('message', 'Categoría ' . $request->name . ' creada correctamente.');
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
            'description' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            TicketCategory::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Categoria de tickets ' . $request->all() . ' actualizada correctamente.');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        $category = TicketCategory::findOrFail($id);
        $category->delete();
        DB::commit();
        return redirect('/dashboard/ticket-category/')
            ->with('message', 'Categoria de tickets ' . $category->name . ' eliminada correctamente.');


    }
}
