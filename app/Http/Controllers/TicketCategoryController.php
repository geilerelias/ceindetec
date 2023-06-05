<?php

namespace App\Http\Controllers;

use App\Models\Ticket\TicketCategory;
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


    public function getAllCategories()
    {
        $categories = TicketCategory::all(); // Obtiene todas las categorías
        return $categories;
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
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        Validator::make($request->all(), [
            'name' => ['required'],
            'line' => ['required'],
            'description' => ['required'],
        ])->validate();

        TicketCategory::create([
            'name' => $request->name,
            'line' => $request->line,
            'description' => $request->description,
        ]);

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
        return TicketCategory::findOrFail($id);
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
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {

        $ticketCategory = TicketCategory::find($id);
        if (!$ticketCategory) {
            return redirect()->back()
                ->withErrors(['La categoría de ticket no existe.']);
        }

        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'line' => 'required|string',
            'description' => 'nullable',
        ]);
        $ticketCategory->update($validatedData);

        if ($ticketCategory->update($validatedData) > 0) {
            return redirect()->back()
                ->with('message', 'Categoría de tickets ' . $request->name . ' actualizada correctamente.');
        } else {
            return redirect()->back()
                ->withErrors(['error' => 'Categoría de tickets ' . $request->name . ' no actualizada.']);
        }


    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function destroy($id)
    {
        DB::beginTransaction();
        $category = TicketCategory::findOrFail($id);
        $category->delete();
        DB::commit();
        return redirect('/dashboard/ticket-category/')
            ->with('message', 'Categoría de tickets ' . $category->name . ' eliminada correctamente.');

    }
}
