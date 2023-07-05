<?php

namespace App\Http\Controllers;

use App\Models\Ticket\Ticket;
use App\Notifications\SupportTickets;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class TicketController extends Controller
{
    public function index()
    {
        $userId = Auth::user()->id;
        $tickets = Ticket::where('user_id', $userId)->get();
        return Inertia::render('Dashboard/Ticket/Index', ['tickets' => $tickets]);
    }

    public function getAll()
    {
        return Ticket::orderBy('published_at', 'desc')->get();
    }

    public function all()
    {
        return Ticket::all();
    }


    public function create()
    {
        return Inertia::render('Dashboard/Ticket/CreateEditTicket');
    }

    public function store(Request $request, SupportTickets $mailer)
    {
        try {

            $validatedData = $request->validate([
                'title' => 'required',
                'category_id' => 'required',
                'priority' => 'required',
                'message' => 'required',
                'status' => 'required',
                'line' => 'required',
                'establishment_id' => 'required',
                'headquarter_id' => 'required',
            ]);

            $ticket = new Ticket([
                'user_id' => Auth::user()->id,
                'status' => 'Open',
                'published_at' => $request->published_at,
                //'published_at' =>  Carbon::now(),
            ]);

            $ticket->fill($validatedData);


            if ($request->hasFile('resources')) {
                $resources = $request->file('resources');
                $resourcePaths = [];
                foreach ($resources as $index => $resource) {
                    // Generar un nombre único para cada imagen
                    $resourceName = 'file-' . time() . '.' . $resource->getClientOriginalExtension();

                    // Guardar la imagen en el almacenamiento
                    $path = $resource->storeAs('tickets', $resourceName);
                    $resourcePaths[] = $path;
                }
                $allImagePaths = implode(', ', $resourcePaths);
                $ticket->resource = $allImagePaths;
            }


            $ticket->save();
            //$mailer->sendTicketInformation(Auth::user(), $ticket);
            return redirect()->back()->with("message", "Se a abierto un ticket con Id: #$ticket->ticket_id.");
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        }
    }

    public function userTickets()
    {
        $tickets = Ticket::where('user_id', Auth::user()->id)->paginate(10);
        return view('tickets.user_tickets', compact('tickets'));
    }

    public function show(Ticket $ticket)
    {
        return Inertia::render('Dashboard/Ticket/ShowTicket', ['ticket' => $ticket]);
    }

    public function edit($id)
    {
        $ticket = Ticket::findOrFail($id);
        return Inertia::render('Dashboard/Ticket/CreateEditTicket', [
            'ticket' => $ticket,
            'editMode' => true
        ]);
    }


    public function update(Request $request, $id)
    {
        $ticket = Ticket::findOrFail($id);

        $validatedData = $request->validate([
            'category_id' => 'required',
            'title' => 'required',
            'priority' => 'required',
            'message' => 'required',
            'status' => 'required',
            'resource' => 'nullable',
            'line' => 'required',
            'establishment_id' => 'required',
            'headquarter_id' => 'required',
            'published_at' => 'nullable',
            'archived_at' => 'nullable',
        ]);

        if ($request->hasFile('resources')) {
            $resources = $request->file('resources');
            $resourcePaths = [];
            foreach ($resources as $index => $resource) {
                // Generar un nombre único para cada imagen
                $resourceName = 'file-' . time() . '.' . $resource->getClientOriginalExtension();

                // Guardar la imagen en el almacenamiento
                $path = $resource->storeAs('tickets', $resourceName);
                $resourcePaths[] = $path;
            }
            $allImagePaths = implode(', ', $resourcePaths);
            $ticket->resource = $allImagePaths;
        }

        $ticket->update($validatedData);

        return redirect()->back()->with([
            'message' => 'Ticket actualizado con éxito',
            'data' => $ticket
        ]);
    }

    public function destroy(Ticket $ticket): \Illuminate\Http\RedirectResponse
    {
        // Verificar si el usuario tiene permisos para eliminar el ticket

        // Obtener los recursos del ticket como una matriz
        $resources = explode(", ", $ticket->resource);

        // Verificar si los recursos no están vacíos o son null
        if (!empty($resources)) {
            // Eliminar los recursos del storage
            foreach ($resources as $resource) {
                // Eliminar el recurso del storage
                Storage::delete($resource);
            }
        }

        // Eliminar el ticket
        $ticket->delete();

        // Redireccionar a la lista de tickets (opcional)
        return redirect()->back()->with('message', 'Ticket #' . $ticket->id . ' eliminado correctamente.');
    }


}
