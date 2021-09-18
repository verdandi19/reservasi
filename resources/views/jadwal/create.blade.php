<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {!! __('Jadwal &raquo; Create') !!}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div>
                @if($errors->any())
                    <div class="mb-5" role="alert">
                        <div class="bg-red-500 text-black font-bold rounded-t px-4 py-2"></div>
                        There's something wrong
                    </div>
                    <div class="border border-t-0 border-red-400 rounded-b bg-red-100 px-4 py-3 text-red-700">
                        <p>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        </p>
                    </div>
            </div>
            @endif
            <form action="{{ route('jadwal.store') }}" class="w-full" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Nama Kelas
                        </label>
                        <input value="{{ old('nama') }}" name="nama"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="text" placeholder="Kelas">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Hari
                        </label>
                        <select value="{{ old('hari') }}" name="hari"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name" type="text" placeholder="Hari" required>
                            <option value="">Pilih Hari</option>
                            @foreach($hari as $h)
                                <option value="{{$h->id}}">{{$h->nama}}</option>

                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Jam Mulai
                        </label>
                        <input value="{{ old('jam') }}" name="jam"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="time" placeholder="Jam">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Jam Selesai
                        </label>
                        <input value="{{ old('selesai') }}" name="selesai"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="time" placeholder="Jam">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            MataKuliah
                        </label>
                        <input value="{{ old('matakuliah') }}" name="matakuliah"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="text" placeholder="Jam">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            SKS
                        </label>
                        <input value="{{ old('sks') }}" name="sks"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="text" placeholder="SKS">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Sifat
                        </label>
                        <input value="{{ old('sifat') }}" name="sifat"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="text" placeholder="Sifat">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Dosen
                        </label>
                        <input value="{{ old('dosen') }}" name="dosen"
                               class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                               id="grid-last-name" type="text" placeholder="Dosen">
                    </div>
                </div>
                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3">
                        <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                            Ruang
                        </label>
                        <select value="{{ old('ruang') }}" name="ruang"
                                class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded  py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500"
                                id="grid-last-name">
                            <option disabled selected>Pilih Ruang</option>
                            @foreach($ruang as $r)
                                <option value="{{$r->id}}">{{$r->nama}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>

                <div class="flex flex-wrap -mx-3 mb-6">
                    <div class="w-full px-3 text-right">
                        <button type="submit" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
                            Save Jadwal
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</x-app-layout>
