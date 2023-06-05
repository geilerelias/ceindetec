<?php

namespace App\Http\Controllers;

use App\Models\Ticket\Ticket;
use App\Notifications\SupportTickets;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
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
        return Ticket::orderBy('date', 'desc')->get();
    }

    public function all()
    {
        return Ticket::all();
    }


    public function create()
    {
        return Inertia::render('Dashboard/Ticket/CreateTicket');
    }

    public function store(Request $request, SupportTickets $mailer)
    {
        $this->validate($request, [
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
            'category_id' => $request->input('category_id'),
            'title' => $request->input('title'),
            'priority' => $request->input('priority'),
            'message' => $request->input('message'),
            'status' => "Open",
            'line' => $request->input('line'),
            'establishment_id' => $request->input('establishment_id'),
            'headquarter_id' => $request->input('headquarter_id'),
            'published_at' => Carbon::now(),
        ]);

        $ticket->save();
        //$mailer->sendTicketInformation(Auth::user(), $ticket);
        return redirect()->back()->with("message", "A ticket with ID: #$ticket->ticket_id has been opened.");
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

}
