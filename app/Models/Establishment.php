<?php

namespace App\Models;

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
}
