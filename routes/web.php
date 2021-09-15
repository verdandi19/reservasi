<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\RuangController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\ProsesController;



Route::get('/', function () {
    return redirect()->route('dashboard');
});
// Dashboard
Route::prefix('dashboard')
    ->middleware(['auth:sanctum','admin'])
    ->group(function() {
        Route::get('/',[DashboardController::class, 'index'])->name('dashboard');
        Route::resource('users', UserController::class);
        Route::resource('ruang', RuangController::class);
        Route::resource('jadwal', JadwalController::class);

        Route::get('proses/{id}/status/{status}',[ProsesController::class, 'changeStatus'])
            ->name('proses.changeStatus');
        Route::resource('proses', ProsesController::class);
    });