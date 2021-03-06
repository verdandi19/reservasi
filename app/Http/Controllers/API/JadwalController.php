<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Jadwal;
use App\Helpers\ResponseFormatter;
use Illuminate\Support\Facades\Auth;
use Exception;
use Illuminate\Http\Request;

class JadwalController extends Controller
{
    public function all(Request $request) {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $hari = $request->input('hari');
        $jam = $request->input('jam');
        $matakuliah = $request->input('matakuliah');
        $sks = $request->input('sks');
        $sifat = $request->input('sifat');
        $dosen = $request->input('dosen');
        $ruang = $request->input('ruang');

        if($id)
        {
            $jadwal = Jadwal::with(['ruang','user'])->find($id);

            if($Jadwal)
            {
                return ResponseFormatter::success(
                    $jadwal, 'Data ruang berhasil diambil'
                );
            }
            else {
                return ResponseFormatter::error(
                    null, 'Data produk tidak ada',
                    404
                );
            }
        }

        $jadwal = Jadwal::with(['ruang','user'])
        ->where('user_id', Auth::user()->id);

        if($hari) {
            $jadwal->where('hari', $hari);
        }

        if($jam) {
            $jadwal ->where('jam', $jam);
        }

        if($matakuliah) {
            $jadwal ->where('mata kuliah', $matakuliah);
        }

        if($sks) {
            $jadwal ->where('sks', $sks);
        }

        if($sifat) {
            $jadwal ->where('sifat', $sifat);
        }

        if($dosen) {
            $jadwal ->where('dosen', $dosen);
        }

        if($ruang) {
            $jadwal ->where('ruang', $ruang);
        }

        return ResponseFormatter::success(
            $jadwal->paginate($limit), 'Data list ruang berhasil diambil'
        );
}
}