<?php

// app/Http/Controllers/IncomeExpenseController.php

namespace App\Http\Controllers;

use App\Models\IncomeExpense;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class IncomesExpensesController extends Controller
{
    public function index()
    {
        return Inertia::render('IncomesExpenses/Index');
    }

    public function create()
    {
        return Inertia::render('IncomesExpenses/CreateEdit');
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'line' => 'required|max:255',
            'description' => 'required|max:255',
            'amount' => 'required|numeric',
            'type' => 'required|in:income,expense',
            'date' => 'required|date',
            'file_path' => 'nullable|file',
            'ticket_id' => 'nullable',
            'headquarter_id' => 'nullable',
            'establishment_id' => 'nullable'
        ]);

        $incomeExpense = new IncomeExpense($validatedData);

        if ($request->hasFile('file_path')) {
            $file = $request->file('file_path');
            // Generate a file name with extension
            $fileName = 'file-' . time() . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('income-expenses', $fileName);
            $incomeExpense->file_path = $path;
        }

        $incomeExpense->save();


        return redirect()->back()->with([
            'message' => 'Movimiento creado con éxito',
            'data' => $incomeExpense
        ]);
    }

    public function show(IncomeExpense $incomeExpense)
    {
        return Inertia::render('IncomesExpenses/Show', [
            'incomeExpense' => $incomeExpense
        ]);
    }

    public function edit($id)
    {
        $incomeExpense = IncomeExpense::findOrFail($id);
        return Inertia::render('IncomesExpenses/CreateEdit', [
            'incomeExpense' => $incomeExpense,
            'editMode' => true
        ]);
    }

    public function update(Request $request, $id)
    {
        $incomeExpense = IncomeExpense::findOrFail($id);

        $validatedData = $request->validate([
            'line' => 'required|max:255',
            'description' => 'required|max:255',
            'amount' => 'required|numeric',
            'type' => 'required|in:income,expense',
            'date' => 'required|date',
            'ticket_id' => 'nullable',
            'headquarter_id' => 'nullable',
            'establishment_id' => 'nullable'
        ]);

        if ($request->hasFile('file_path')) {
            $file = $request->file('file_path');
            // Generate a file name with extension
            $fileName = 'file-' . time() . '.' . $file->getClientOriginalExtension();
            $path = $file->storeAs('income-expenses', $fileName);
            $incomeExpense->file_path = $path;
        }

        $incomeExpense->update($validatedData);


        return redirect()->back()->with([
            'message' => 'movimiento actualizado con éxito',
            'data' => $incomeExpense
        ]);


    }


    /* public function getIncomeExpensesByMonth()
     {
         $incomeExpensesByMonth = IncomeExpense::select(DB::raw('MONTH(date) as month'), DB::raw('SUM(amount) as total'), 'type')
             ->groupBy(DB::raw('MONTH(date)'), 'type')
             ->get();

         $incomeByMonth = $incomeExpensesByMonth->where('type', 'income')->groupBy('month');
         $expensesByMonth = $incomeExpensesByMonth->where('type', 'expense')->groupBy('month');

         $incomeExpensesTotal = IncomeExpense::select(DB::raw('SUM(amount) as total'), 'type')
             ->groupBy('type')
             ->get();

         return response()->json([
             'incomeByMonth' => $incomeByMonth,
             'expensesByMonth' => $expensesByMonth,
             'incomeTotal' => $incomeExpensesTotal->where('type', 'income')->sum('total'),
             'expensesTotal' => $incomeExpensesTotal->where('type', 'expense')->sum('total'),
         ]);
     }*/


    /*public function showIncomeExpensesFrom($line)
    {
        $query = IncomeExpense::query();

        if ($line) {
            $query->where('line', $line);
        }

        $incomesExpenses = $query->get()
            ->groupBy(function ($item) {
                return Carbon::parse($item->date)->format('Y-m');
            })
            ->map(function ($item) {
                $groupedData = collect([
                    'incomes' => $item->where('type', 'income')->sum('amount'),
                    'expenses' => $item->where('type', 'expense')->sum('amount'),
                    'data' => $item
                ]);

                $groupedData['balance'] = $groupedData['incomes'] - $groupedData['expenses'];

                return $groupedData;
            })
            ->sortBy('data.0.date', SORT_REGULAR, true);

        //return $incomesExpenses;
        return Inertia::render('IncomesExpenses/View', ['incomesExpenses' => $incomesExpenses]);
    }*/

    public function showIncomeExpensesFrom($line)
    {
        $query = IncomeExpense::query();

        if ($line) {
            $query->where('line', $line);
        }

        $incomesExpenses = $query->get()
            ->groupBy(function ($item) {
                return Carbon::parse($item->date)->format('Y-m');
            })
            ->map(function ($item) {
                $groupedData = collect([
                    'incomes' => $item->where('type', 'income')->sum('amount'),
                    'expenses' => $item->where('type', 'expense')->sum('amount'),
                    'data' => $item
                ]);

                $groupedData['balance'] = $groupedData['incomes'] - $groupedData['expenses'];

                return $groupedData;
            })
            ->sortBy('data.0.date', SORT_REGULAR, true);

        // Obtener todos los ingresos y gastos sin agrupar
        $allIncomesExpenses = $incomesExpenses->flatMap(function ($group) {
            return $group['data'];
        });

        $all = collect([
            'incomes' => $allIncomesExpenses->where('type', 'income')->sum('amount'),
            'expenses' => $allIncomesExpenses->where('type', 'expense')->sum('amount'),
            'data' => $allIncomesExpenses,
        ]);

        $all['balance'] = $all['incomes'] - $all['expenses'];

        // Agregar el array "all" al array "incomesExpenses"
        $incomesExpenses['all'] = $all;

        return Inertia::render('IncomesExpenses/View', ['incomesExpenses' => $incomesExpenses]);
    }


    public function getIncomeExpensesByMonth($startDate = null, $endDate = null)
    {
        $query = IncomeExpense::query();

        if ($startDate && $endDate) {
            $query->whereBetween('date', [$startDate, $endDate]);
        }

        $incomesExpenses = $query->get()
            ->groupBy(function ($item) {
                return Carbon::parse($item->date)->format('Y-m');
            })
            ->map(function ($item) {
                $groupedData = collect([
                    'incomes' => $item->where('type', 'income')->sum('amount'),
                    'expenses' => $item->where('type', 'expense')->sum('amount'),
                    'data' => $item
                ]);

                $groupedData['balance'] = $groupedData['incomes'] - $groupedData['expenses'];

                return $groupedData;
            })
            ->sortBy('data.0.date', SORT_REGULAR, true);

        return $incomesExpenses;
    }


    public function destroy($id)
    {
        $incomeExpense = IncomeExpense::findOrFail($id);
        $incomeExpense->delete();

        return redirect()->back()->with('message', 'Registro eliminado correctamente.');
    }
}
