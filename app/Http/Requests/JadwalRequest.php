<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class JadwalRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nama' => 'required|text',
            'hari' => 'required|text',
            'jam' => 'required|string',
            'matakuliah' => 'required|text',
            'sks' => 'required|number',
            'sifat' => 'required|text',
            'dosen' => 'required|text',
            'ruang' => 'required|text',
        ];
    }
}
