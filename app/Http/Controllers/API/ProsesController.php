<?php

namespace App\Http\Controllers\API;

use App\Models\Proses;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Exception;

class ProsesController extends Controller
{
    public function all(Request $request) {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $nama = $request->input('nama');
        $nomor = $request->input('nomor');
        $hari = $request->input('hari');
        $tanggal = $request->input('tanggal');
        $jam = $request->input('jam');
        $ruang = $request->input('ruang');
        $keterangan = $request->input('keterangan');

        if($id)
        {
            $proses = Proses::with(['ruang','user'])->find($id);

            if($proses)
            {
                return ResponseFormatter::success(
                    $proses, 'Data ruang berhasil diambil'
                );
            }
            else {
                return ResponseFormatter::error(
                    null, 'Data produk tidak ada',
                    404
                );
            }
        }

        $proses = Proses::with(['ruang','user'])
        ->where('user_id', Auth::user()->id);

        if($nama) {
            $proses->where('nama', $nama);
        }
        if($nomor) {
            $proses->where('nomor', $nomor);
        }
        if($hari) {
            $proses->where('hari', $hari);
        }
        if($tanggal) {
            $proses->where('tanggal', $tanggal);
        }

        if($jam) {
            $proses->where('jam', $jam);
        }
        if($ruang) {
            $proses->where('ruang', $ruang);
        }

        if($keterangan) {
            $proses->where('keterangan', $keterangan);
        }

        return ResponseFormatter::success(
            $proses->paginate($limit), 'Data list ruang berhasil diambil'
        );
    }
    public function update(Request $request, $id) {
        $proses = Proses::findOrFail($id);
    
        $proses->update($request->all());
    
        return ResponseFormatter::success($proses, 'reservasi berhasil diperbarui');
    }
}