<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class IncomeExpense extends Model
{
    use HasFactory;

    protected $fillable = [
        'line',
        'description',
        'amount',
        'type',
        'date',
        'file_path',
        'ticket_id',
        'headquarter_id',
        'establishment_id',
    ];
}
