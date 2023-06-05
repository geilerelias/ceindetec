<?php

namespace App\Models;

use App\Models\Users\Person;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Establishment extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'nit', 'municipality', 'department'
    ];

    public function headquarters()
    {
        return $this->hasMany(Headquarters::class);
    }

    public function people()
    {
        return $this->hasMany(Person::class);
    }
}
