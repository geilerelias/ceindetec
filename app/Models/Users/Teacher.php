<?php

namespace App\Models\Users;

use App\Models\Establishment;
use App\Models\Headquarters;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
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
        'department',
        'municipality',
        'direction',
        'profile_photo_path',
        'headquarters_id',
        'establishments_id',
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
