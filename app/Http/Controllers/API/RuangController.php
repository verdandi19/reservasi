<?php

namespace App\Http\Controllers\API;

use App\Helpers\ResponseFormatter;
use App\Http\Controllers\Controller;
use App\Models\Ruang;
use Illuminate\Http\Request;

class RuangController extends Controller
{
    public function all(Request $request) {
        $id = $request->input('id');
        $limit = $request->input('limit', 6);
        $name = $request->input('name');
        $lantai = $request->input('lantai');
        $fasilitas = $request->input('fasilitas');

        if($id)
        {
            $ruang = Ruang::find($id);

            if($ruang)
            {
                return ResponseFormatter::success(
                    $ruang, 'Data ruang berhasil diambil'
                );
            }
            else {
                return ResponseFormatter::error(
                    null, 'Data produk tidak ada',
                );
            }
        }

        $ruang = Ruang::query();

        if($name) {
            $ruang->where('name', 'like','%' . $name . '%');
        }

        if($lantai) {
            $ruang->where('lantai', 'like','%' . $lantai . '%');
        }

        if($fasilitas) {
            $ruang->where('fasilitas', 'like','%' . $fasilitas . '%');
        }

        return ResponseFormatter::success(
            $ruang->paginate($limit), 'Data list ruang berhasil diambil'
        );
    }

    public function index(){
        $ruang = Ruang::all();
        return $ruang;
    }
}
