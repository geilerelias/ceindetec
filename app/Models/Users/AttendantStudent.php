<?php

namespace App\Models\Users;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AttendantStudent extends Model
{
    use HasFactory;

    protected $fillable = [
        'relationship',
        'attendant_id',
        'student_id',
    ];

    public function attendant(): BelongsTo
    {
        return $this->belongsTo(Person::class, 'attendant_id');
    }

    public function student(): BelongsTo
    {
        return $this->belongsTo(Person::class, 'student_id');
    }
}
