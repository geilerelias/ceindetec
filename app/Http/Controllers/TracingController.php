<?php

namespace App\Http\Controllers;

use App\Models\Tracing;
use Illuminate\Http\Request;
use Inertia\Inertia;

class TracingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Tracing::all();;
        return Inertia::render('Dashboard/Tracing/Index', ['data' => $data]);

    }
}
