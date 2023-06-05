<?php

namespace App\Models\Ticket;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'description', 'line'
    ];

    public function tikets()
    {
        return $this->hasMany(Ticket::class);
    }
}
