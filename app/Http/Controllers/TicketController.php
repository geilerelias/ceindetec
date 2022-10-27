<?php

namespace App\Http\Controllers;

use App\Models\Ticket;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TicketController extends Controller
{
    public function index()
    {
        $data = Ticket::all();
        return Inertia::render('Dashboard/Ticket/Index', ['data' => $data]);
    }

}
