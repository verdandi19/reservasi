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
        'nama',
        'nomor',
        'hari',
        'tanggal',
        'jam',
        'ruang',
        'keterangan',
        'jadwal',
        'selesai',
        'user_id',
    ];

    protected $with = ['getRuang', 'user'];

    public function getCreatedAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }

    public function getUpdatedAtAttribute($value)
    {
        return Carbon::parse($value)->timestamp;
    }

    public function getRuang()
    {
        return $this->belongsTo(Ruang::class, 'ruang');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

}
