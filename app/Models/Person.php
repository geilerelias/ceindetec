<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Person extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'surname',
        'gender',
        'identification_type',
        'identification_number',
        'birthday_date',
        'ethnic_group',
        'email',
        'phone',
        'blood_type',
        'person_type',
        'attended_by',
        'relationship',
        'department',
        'municipality',
        'direction',
        'profile_photo_path',
        'establishment_id',
        'headquarter_id'
    ];


    public function establishments()
    {
        return $this->belongsTo(Establishment::class);
    }

    public function headquarters()
    {
        return $this->belongsTo(Headquarters::class);
    }
}
