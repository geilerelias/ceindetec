<?php

namespace App\Http\Controllers;

use App\Models\QrCode;
use Illuminate\Http\Request;
use Inertia\Inertia;

class QrCodeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $response = QrCode::all();
        return Inertia::render('CodeQr/Index', ['data' => $response]);
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
        QrCode::create($request->all());

        return redirect()->back()
            ->with('message', 'QrCode Created Successfully.');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function generate($starts_in, $ends_in)
    {
        for ($i = $starts_in; $i <= $ends_in; $i++) {
            $qrCode = new QrCode(['consecutive' => 'CONV005-00' . $i]);
            $qrCode->save();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function showQr($consecutive)
    {
        $response = QrCode::where('consecutive', $consecutive)->first();
        return Inertia::render('CodeQr/Show', ['data' => $response]);
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function show(QrCode $qrCode)
    {
        return Inertia::render('CodeQr/Show', ['data' => $qrCode]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function edit(QrCode $qrCode)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, QrCode $qrCode)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function destroy(QrCode $qrCode)
    {
        //
    }
}
