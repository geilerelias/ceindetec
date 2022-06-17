<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Headquarters extends Model
{
    use HasFactory;

    protected $fillable = [
        "name", "dane_code", "address", "municipality", "department", "email", "phone", "establishments_id",];

    public function establishments()
    {
        return $this->belongsTo(Establishment::class);
    }
}
