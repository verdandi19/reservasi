<?php

namespace App\Http\Controllers;

use App\Models\Hari;
use App\Models\Ruang;
use Illuminate\Http\Request;
use App\Models\Jadwal;
use App\Http\Requests\JadwalRequest;

class JadwalController extends Controller
{

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function index()
    {
        $jadwal = Jadwal::paginate(10);
        return view('jadwal.index')->with(['jadwal' => $jadwal ]);
    }

    public function data(){
        $jadwal = Jadwal::all();
        return $jadwal;
    }

    /**
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function create()
    {
        $ruang = Ruang::all();
        $hari = Hari::all();

        return view('jadwal.create')->with(['ruang' => $ruang,'hari' => $hari]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        Jadwal::create($data);

        return redirect()->route('jadwal.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * @param Jadwal $jadwal
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View
     */
    public function edit(Jadwal $jadwal)
    {
        $ruang = Ruang::all();
        $hari = Hari::all();

        return view('jadwal.edit',[
            'item' => $jadwal,
            'ruang' => $ruang,
            'hari' => $hari
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Jadwal $jadwal)
    {
        $data = $request->all();

        $jadwal->update($data);

        return redirect()->route('jadwal.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Jadwal $jadwal)
    {
        $jadwal->delete();

        return redirect()->route('jadwal.index');
    }
}
