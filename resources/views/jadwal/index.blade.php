<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Jadwal') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">
                <a href="{{ route('jadwal.create') }}" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4">
                    + Create Jadwal
                </a>
            </div>
            <div class="bg-white">
                <table class="table-auto w-full">
                    <thead>
                        <tr>
                            <th class="border px-6 py-4">Id</th>
                            <th class="border px-6 py-4">Nama</th>
                            <th class="border px-6 py-4">Hari</th>
                            <th class="border px-6 py-4">Jam</th>
                            <th class="border px-6 py-4">MataKuliah</th>
                            <th class="border px-6 py-4">SKS</th>
                            <th class="border px-6 py-4">Sifat</th>
                            <th class="border px-6 py-4">Dosen</th>
                            <th class="border px-6 py-4">Ruang</th>
                            <th class="border px-6 py-4">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse ($jadwal as $item)
                        <tr>
                            <td class="border px-6 py-4">{{ $item->id }}</td>
                            <td class="border px-6 py-4">{{ $item->nama }}</td>
                            <td class="border px-6 py-4">{{ $item->hari }}</td>
                            <td class="border px-6 py-4">{{ $item->jam }}</td>
                            <td class="border px-6 py-4">{{ $item->matakuliah }}</td>
                            <td class="border px-6 py-4">{{ $item->sks }}</td>
                            <td class="border px-6 py-4">{{ $item->sifat }}</td>
                            <td class="border px-6 py-4">{{ $item->dosen }}</td>
                            <td class="border px-6 py-4">{{ $item->ruang }}</td>
                            <td class="border px-6 py-4 text-center">
                            <div class="flex flex-wrap -mx-4 mb-">
                                <a href="{{ route('jadwal.edit', $item->id) }}" class="inline-block bg-gray-500 hover:bg-gray-700 text-black font-bold py-2 px-4 mx-2 rounded">
                                    Edit
                                </a>
                                <form action="{{ route('jadwal.destroy', $item->id) }}" method="POST" class="inline-block">
                                    {!! method_field('delete') . csrf_field() !!}
                                    <button type="submit" class="bg-gray-500 hover:bg-gray-700 text-black font-bold py-2 px-4 mx-2 rounded">
                                        Delete
                                    </button>
                                </form>
                            </div>
                            </td>    
                        </tr>
                        @empty
                        <tr>
                            <td colspan="8" class="border text-center p-5">
                                Data Tidak Ditemukan
                            </td>
                        </tr>

                        @endforelse
                    </tbody>
                </table>
            </div>
            <div class="text-center mt-5">
                {{ $jadwal->links() }}
            </div>
        </div>
    </div>
</x-app-layout>
