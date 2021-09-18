<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Print Card</title>
    <!-- Fonts -->

    <!-- Styles -->
    <!-- Font Awesome -->
    <link rel="stylesheet" href="assets/css/bootstrap/bootstrap.css" type="text/css">


</head>

<body>

<style>
    footer {
        position: fixed;
        bottom: 0;
        left: 0;
        right: 0;
        height: 0;
    }

    table { border: 1px solid #ccc; border-collapse: collapse; margin: 0; padding: 0; width: 100%; table-layout: fixed;}
    table caption { font-size: 1.5em; margin: .5em 0 .75em;}
    table tr { border: 1px solid #ddd; padding: .35em;}
    table th,
    table td { padding: .625em; text-align: center;}
    table th, table td { font-size: .6em; letter-spacing: .1em; text-transform: uppercase;}
    @media screen and (max-width: 600px) {
        table { border: 0; }
        table caption { font-size: 1.3em; }
        table thead { border: none; clip: rect(0 0 0 0); height: 1px; margin: -1px; overflow: hidden; padding: 0; position: absolute; width: 1px;}
        table tr { border-bottom: 3px solid #ddd; display: block; margin-bottom: .625em; }
        table td { border-bottom: 1px solid #ddd; display: block; font-size: .6em; text-align: right;}
        table td::before { content: attr(data-label); float: left; font-weight: bold; text-transform: uppercase; }
        table td:last-child { border-bottom: 0; }
    }
    .text-center {
        text-align: center !important;
    }
</style>

<br>

<div>
    <img src="{{ public_path('static-image/logo.png') }}" style="width: 120px; float: left;" />

    <div>
        <h4 style=" text-align: right;margin-bottom:0;margin-top:0">Laporan Reservasi</h4>
    </div>

    <br>
    <br>
    <br>

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


    <div style="right:10px;width: 300px;display: inline-block;margin-top:70px">
        <p class="text-center mb-5">Pimpinan</p>
        <p class="text-center">( ........................... )</p>
    </div>

    <div style="left:10px;width: 300px; margin-left : 100px;display: inline-block">
        <p class="text-center mb-5">Admin</p>
        <p class="text-center">( {{auth()->user()->name}} )</p>
    </div>


</div>




<!-- JS -->
<script src="js/app.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>

</html>
