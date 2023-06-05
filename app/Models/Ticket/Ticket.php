<?php

namespace App\Models\Ticket;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'category_id',
        'title',
        'priority',
        'message',
        'status',
        'resource',
        'line',
        'date',
        'establishment_id',
        'headquarter_id',
        'published_at',
        'archived_at'
    ];

    public function category()
    {
        return $this->belongsTo(TicketCategory::class);
    }
}
