<?php

namespace App\Http\Controllers;

use App\Models\Users\AttendantStudent;
use App\Models\Users\Person;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Inertia\Inertia;

class PersonController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $data = Person::all();
        return Inertia::render('Dashboard/Person/Index', ['data' => $data]);
    }

    public function getById($id)
    {
        return DB::table('people')->where('id', '=', $id)->first();
        //return Inertia::render('Dashboard/Person/Index', ['data' => $data]);
    }

    public function getByEstablishmentAndHeadquarters($establishment_id, $headquarter_id)
    {


        $administratives = Person::where('person_type', 'Administrativo')
            ->where('establishment_id', '=', $establishment_id)
            ->get();

        $directors = Person::where('establishment_id', $establishment_id)
            ->whereIn('person_type', ['Director', 'Coordinador', 'Rector'])
            ->get();

        $students = Person::where('person_type', 'Estudiante')
            ->where('headquarter_id', '=', $headquarter_id)
            ->get();

        $teachers = Person::where('person_type', 'Docente')
            ->where('headquarter_id', '=', $headquarter_id)
            ->get();

        $attendant = Person::where('person_type', 'Acudiente')
            ->where('headquarter_id', '=', $headquarter_id)
            ->get();


        $people = [];

        if (!$administratives->isEmpty()) {
            $people['administratives'] = $administratives;
        }

        if (!$directors->isEmpty()) {
            $people['directors'] = $directors;
        }

        if (!$students->isEmpty()) {
            $people['students'] = $students;
        }

        if (!$teachers->isEmpty()) {
            $people['teachers'] = $teachers;
        }

        if (!$attendant->isEmpty()) {
            $people['attendants'] = $attendant;
        }

        return response()->json($people);

    }

    public function getByHeadquarters($headquarter_id)
    {
        return DB::table('people')->where('headquarter_id', '=', $headquarter_id)->get();
        //return Inertia::render('Dashboard/Person/Index', ['data' => $data]);
    }

    public function getByHeadquartersAndPersonType($headquarter_id, $type)
    {
        return DB::table('people')
            ->where('headquarter_id', '=', $headquarter_id)
            ->where('person_type', '=', $type)
            ->get();
        //return Inertia::render('Dashboard/Person/Index', ['data' => $data]);
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
     * @return \Illuminate\Http\RedirectResponse
     * @throws ValidationException
     */
    public function store(Request $request): \Illuminate\Http\RedirectResponse
    {
        # return redirect()->back();
        $existingDirectors = -1;
        if ($request->person_type == 'Director' || $request->person_type == 'Rector') {
            $existingDirectors = Person::whereIn('person_type', ['Director', 'Rector'])
                ->where('establishment_id', $request->establishment_id)
                ->count();
        }

        if ($existingDirectors > 0) {
            // Ya existe un Director o Rector en este establecimiento
            $errors = ['message' => 'Ya existe un registro como ' . $request->person_type . ' para este establecimiento'];
            return redirect()->back()->withErrors($errors);
        } else {
            // Crea la nueva persona

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
                'establishment_id' => ['required'],
                'headquarter_id' => ['required'],
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
                ->with([
                    'message', $request->person_type . ' creado correctamente.',
                    'person_id' => $person->id, // Aquí se agrega el ID de la persona recién creada
                ]);
        }
    }

    public function storeAttendantForStudents(Request $request)
    {
        // Validar los campos
        $request->validate([
            'relationship' => 'required|string',
            'attendant_id' => 'required|exists:people,id',
            'student_id' => 'required|exists:people,id',
        ]);

        // Crear el registro en la tabla attendant_student
        $attendantStudent = AttendantStudent::create([
            'relationship' => $request->input('relationship'),
            'attendant_id' => $request->input('attendant_id'),
            'student_id' => $request->input('student_id'),
        ]);

        if ($attendantStudent) {
            return redirect()->back()
                ->with('message', 'Acudiente asignado correctamente.');
        } else {
            return redirect()->back()
                ->withErrors(['error', 'Error al asignar el acudiente.']);
        }

    }

    /**
     * Display the specified resource.
     *
     * @param \App\Models\Users\Person $person
     * @return \Illuminate\Http\Response
     */
    public function show(Person $person)
    {
        return Inertia::render('Dashboard/Person/Show', ['data' => $person]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Models\Users\Person $person
     * @return \Illuminate\Http\Response
     */
    public function edit(Person $person): \Illuminate\Http\Response
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Models\Users\Person $person
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, Person $person)
    {


        $update = $request->validate([
            'name' => ['required'],
            'surname' => ['required'],
            'gender' => ['required'],
            'identification_type' => ['required'],
            'identification_number' => ['required'],
            'birthday_date' => ['required'],
            'ethnic_group' => ['required'],
            'email' => ['required', Rule::unique('people')->ignore($person->id)],
            'phone' => ['required'],
            'person_type' => ['required'],
            'establishment_id' => ['required'],
            'headquarter_id' => ['required'],
        ]);

        return $update;
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
     * @param \App\Models\Users\Person $person
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Person $person)
    {
        if ($person->delete()) {
            return redirect()->back()->with('message', 'La persona ha sido eliminada correctamente.');
        } else {
            return redirect()->back()->with('error', 'No se pudo eliminar la persona. Por favor, intenta de nuevo.');
        }
    }
}
