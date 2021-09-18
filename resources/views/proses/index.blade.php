<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight">
            {{ __('Proses') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="mb-10">

            </div>
        </div>
        <div class="bg-white">
            <table class="table-auto w-full">
                <thead>
                <tr>
                    <th class="border px-6 py-4">Id</th>
                    <th class="border px-6 py-4">Nama</th>
                    <th class="border px-6 py-4">Nomor</th>
                    <th class="border px-6 py-4">Hari</th>
                    <th class="border px-6 py-4">Tanggal</th>
                    <th class="border px-6 py-4">Mulai</th>
                    <th class="border px-6 py-4">Selesai</th>
                    <th class="border px-6 py-4">Ruang</th>
                    <th class="border px-6 py-4">Keterangan</th>
                </tr>
                </thead>
                <tbody>
                @forelse ($proses as $item)
                    <tr>
                        <td class="border px-6 py-4">{{ $item->id }}</td>
                        <td class="border px-6 py-4">{{ $item->user->name }}</td>
                        <td class="border px-6 py-4">{{ $item->user->nim }}</td>
{{--                        <td class="border px-6 py-4">{{ date('w', strtotime($item->tanggal)) }}</td>--}}
                        <td class="border px-6 py-4">{{ \App\Http\Controllers\ProsesController::setDay(date('w', strtotime($item->tanggal))) }}</td>
                        <td class="border px-6 py-4">{{ date('d F Y', strtotime($item->tanggal)) }}</td>
                        <td class="border px-6 py-4">{{ date('H:i', strtotime($item->jam))  }}</td>
                        <td class="border px-6 py-4">{{ date('H:i', strtotime($item->selesai)) }}</td>
                        <td class="border px-6 py-4">{{ $item->getRuang->nama }}</td>
                        <td class="border px-6 py-4">{{ $item->keterangan }}</td>
                        <td class="border px-6 py-4 text-center">
                    </tr>
                @empty
                    <tr>
                        <td colspan="9" class="border text-center p-5">
                            Data Tidak Ditemukan
                        </td>
                    </tr>

                @endforelse
                </tbody>
            </table>
        </div>
        <div class="text-center mt-5">
            {{ $proses->links() }}
        </div>
    </div>
    </div>
    <div class="flex flex-wrap -mx-3 mb-6">
        <div class="w-full px-3 text-right">
            <a type="submit" class="bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded" href="/dashboard/proses/cetak" target="_blank">
                Cetak
            </a>
        </div>
    </div>

</x-app-layout>
