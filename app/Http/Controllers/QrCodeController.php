<?php

namespace App\Http\Controllers;

use App\Models\QrCode;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class QrCodeController extends Controller
{

    public function __construct()
    {
//        $this->middleware('can:view rol')->only('index');
//        $this->middleware('can:create rol')->only('create', 'store');
//        $this->middleware('can:edit rol')->only('edit', 'update');
//        $this->middleware('can:destroy rol')->only('destroy');
        $this->middleware(['auth:sanctum', 'can:Crear qrcode'])->only('store', 'update');
        $this->middleware(['auth:sanctum', 'can:Ver qrcode'])->only('index');
        $this->middleware(['auth:sanctum', 'can:Editar qrcode'])->only('edit', 'update');
    }

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
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function print()
    {
        $response = QrCode::all();
        return Inertia::render('CodeQr/Print', ['data' => $response]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function searchEdit()
    {
        return Inertia::render('CodeQr/SearchEdit');
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

        $qrCode = QrCode::where('consecutive', $consecutive)->first();

        if ($qrCode !== null) {
            return Inertia::render('CodeQr/Show', ['data' => $qrCode]);
        } else {
            $qrCode = QrCode::find($consecutive);
            if ($qrCode !== null) {
                return Inertia::render('CodeQr/Show', ['data' => $qrCode]);
            } else {
                abort(404);
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function search($consecutive)
    {
        $qrCode = QrCode::where('consecutive', $consecutive)->first();

        if ($qrCode !== null) {
            return $qrCode;
        } else {
            $qrCode = QrCode::find($consecutive);
            if ($qrCode !== null) {
                return $qrCode;
            } else {
                return null;
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\QrCode $qrCode
     * @return \Illuminate\Http\Response
     */
    public function show(QrCode $qrCode)
    {
        return $qrCode;
        return Inertia::render('CodeQr/Show', ['data' => $qrCode]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        $qrCode = QrCode::find($id);
        if ($qrCode !== null) {
            return Inertia::render('CodeQr/Edit', ['data' => $qrCode]);
        } else {
            abort(404);
        }
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

        Validator::make($request->all(), [
            'description' => ['required'],
            'establishment_id' => ['required'],
            'headquarters_id' => ['required'],
        ])->validate();

        if ($request->has('id')) {
            QrCode::find($request->input('id'))->update($request->all());
            return redirect()->back()
                ->with('message', 'Informacion actualizada correctamente.');
        }

        return redirect()->back()
            ->withErrors('message', 'Ah ocurrido un error.');
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
