<?php

namespace App\Http\Controllers;

use App\Models\Person;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Inertia\Inertia;

class PersonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Person::all();
        return Inertia::render('Dashboard/Person/Index', ['data' => $data]);
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
        # return redirect()->back();

        Validator::make($request->all(), [
            'name' => ['required'],
            'surname' => ['required'],
            'gender' => ['required'],
            'identification_type' => ['required'],
            'identification_number' => ['required'],
            'birthday_date' => ['required'],
            'ethnic_group' => ['required'],
            'email' => ['required', 'unique:people'],
            'phone' => ['required'],
            'person_type' => ['required'],
        ])->validate();

        $person = new Person($request->all());
        if ($request->hasFile('profile_photo_path')) {
            $file = $request->file('profile_photo_path');
            // Generate a file name with extension
            $fileName = 'person-image-' . time() . '.' . $file->getClientOriginalExtension();
            // Save the file
            $pathImage = $file->storeAs('person', $fileName);
            $person->profile_photo_path = $pathImage;
        }

        $person->save();

        return redirect()->back()
            ->with('message', $request->person_type . ' creado correctamente.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Person $person
     * @return \Illuminate\Http\Response
     */
    public function show(Person $person)
    {
        return Inertia::render('Dashboard/Person/Show', ['data' => $person]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Person $person
     * @return \Illuminate\Http\Response
     */
    public function edit(Person $person)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Person $person
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Person $person)
    {

        $update = $request->all();
        $pathImage = '';
        if ($request->hasFile('profile_photo_path')) {
            $file = $request->file('profile_photo_path');
            // Generate a file name with extension
            $fileName = 'person-image-' . time() . '.' . $file->getClientOriginalExtension();
            // Save the file
            $pathImage = $file->storeAs('person', $fileName);

            if ($person->profile_photo_path !== null) {
                Storage::delete($person->profile_photo_path);
            }
            $update['profile_photo_path'] = $pathImage;

        } else {
            $update['profile_photo_path'] = $request->profile_photo_path;;
        }
        $person->update($update);

        return redirect()->back()
            ->with('message', $request->person_type . ' Actualizado correctamente.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Models\Person $person
     * @return \Illuminate\Http\Response
     */
    public function destroy(Person $person)
    {
        $person->delete();
        return redirect()->back()->with('message', 'Miembro eliminado correctamente.');
    }
}
