<?php

namespace App\Http\Controllers\API;

use App\Models\Hari;
use App\Models\Jadwal;
use App\Models\Proses;
use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Ruang;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
use Exception;

class ProsesController extends Controller
{
    public function all(Request $request)
    {
        $id         = $request->input('id');
        $limit      = $request->input('limit', 6);
        $nama       = $request->input('nama');
        $nomor      = $request->input('nomor');
        $hari       = $request->input('hari');
        $tanggal    = $request->input('tanggal');
        $jam        = $request->input('jam');
        $ruang      = $request->input('ruang');
        $keterangan = $request->input('keterangan');

        if ($id) {
            $proses = Proses::with(['ruang', 'user'])->find($id);

            if ($proses) {
                return ResponseFormatter::success(
                    $proses,
                    'Data ruang berhasil diambil'
                );
            } else {
                return ResponseFormatter::error(
                    null,
                    'Data produk tidak ada',
                    404
                );
            }
        }

        $proses = Proses::with(['ruang', 'user'])
                        ->where('user_id', Auth::user()->id);

        if ($nama) {
            $proses->where('nama', $nama);
        }
        if ($nomor) {
            $proses->where('nomor', $nomor);
        }
        if ($hari) {
            $proses->where('hari', $hari);
        }
        if ($tanggal) {
            $proses->where('tanggal', $tanggal);
        }

        if ($jam) {
            $proses->where('jam', $jam);
        }
        if ($ruang) {
            $proses->where('ruang', $ruang);
        }

        if ($keterangan) {
            $proses->where('keterangan', $keterangan);
        }

        return ResponseFormatter::success(
            $proses->paginate($limit),
            'Data list ruang berhasil diambil'
        );
    }

    public function update(Request $request, $id)
    {
        $proses = Proses::findOrFail($id);

        $proses->update($request->all());

        return ResponseFormatter::success($proses, 'reservasi berhasil diperbarui');
    }

    public function ruangTerpakai()
    {
        $proses = new \App\Http\Controllers\ProsesController();
        $date   = date('w', strtotime(\request('date')));
        $start  = date('H:i:00', strtotime('+1 minutes', strtotime(\request('start'))));
        $end    = date('H:i:00', strtotime('-1 minutes', strtotime(\request('end'))));
        $day    = $proses::setDay($date);
        $hari   = Hari::where('nama', '=', $day)->first();
        $jadwal = Jadwal::where('hari', '=', $hari->id)->whereRaw("'$start' BETWEEN jam AND selesai")->orWhereRaw("'$end' BETWEEN jam AND selesai")->where('hari', '=', $hari->id)->orWhere(
            [['jam', '>', $start], ['selesai', '<', $end]]
        )->where('hari', '=', $hari->id)->get();
//        $jadwal  = Jadwal::orWhere([['jam', '<',$start],['selesai','>',$start]])->orWhere([['jam', '<',$end],['selesai','>',$end]])->where('hari','=',$hari->id)->get();
        $proses     = Proses::where('tanggal', '=', date('Y-m-d', strtotime(\request('date'))))->whereRaw("'$start' BETWEEN jam AND selesai")->orWhereRaw("'$end' BETWEEN jam AND selesai")->where(
            'tanggal',
            '=',
            date('Y-m-d', strtotime(\request('date')))
        )->orWhere([['jam', '>', $start], ['selesai', '<', $end]])->where('tanggal', '=', date('Y-m-d', strtotime(\request('date'))))->get();
        $dataProses = [];
        foreach ($proses as $key => $p) {
            $dataProses[$key]['id'] = $p->getRuang->id;
        }
        $dataRuangTerpakai = [];
        foreach ($jadwal as $key => $j) {
            $dataRuangTerpakai[$key]['id'] = $j->getRuang->id;
        }

        $ruangSold = array_unique(array_merge($dataRuangTerpakai, $dataProses), SORT_REGULAR);
        $ruang     = Ruang::all();
        $dataRuang = [];
        foreach ($ruang as $key => $r) {
            $dataRuang[$key]['id']     = $r->id;
            $dataRuang[$key]['nama']   = $r->nama;
            $dataRuang[$key]['status'] = 'free';
            foreach ($ruangSold as $rs) {
                if ($rs['id'] == $r->id) {
                    $dataRuang[$key]['status'] = 'full';
                }
            }
        }

        return $dataRuang;
    }

    public function store()
    {
        $field = \request()->validate(
            [
                'tanggal'    => 'required',
                'jam'        => 'required',
                'selesai'    => 'required',
                'ruang'      => 'required',
                'keterangan' => 'required',
            ]
        );
        Arr::set($field, 'user_id', Auth::id());
        $proses = Proses::create($field);
        $dataProses = Proses::find($proses->id);
        return response()->json(['msg' => 'success', 'data' => $dataProses]);
    }

    public function dataReservasi(){
        $proses = Proses::where('user_id','=',Auth::id())->get();
        return $proses;
    }

    public function dataReservasiShow($id){
        $proses = Proses::find($id);
        return $proses;
    }


}
