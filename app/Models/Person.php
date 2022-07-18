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
        'person_type',
        'department',
        'municipality',
        'direction',
        'profile_photo_path',
    ];
}
