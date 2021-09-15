<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\softDeletes;

class Proses extends Model
{
    use HasFactory, softDeletes;

    protected $fillable = [
        'nama','nomor', 'hari', 'tanggal', 'jam', 'ruang', 'keterangan'
    ];

    public function getCreatedAttribute($value) {
        return Carbon::parse($value)->timestamp;
    }

    public function getUpdatedAtAttribute($value) {
        return Carbon::parse($value)->timestamp;
}
}
