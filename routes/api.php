<?php

use App\Http\Controllers\API\JadwalController;
use App\Http\Controllers\API\ProsesController;
use App\Http\Controllers\API\RuangController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->group(function(){
    Route::get('user', [UserController::class, 'fetch']);
    Route::post('user', [UserController::class, 'updateProfile']);
    Route::post('user/photo', [UserController::class, 'updatePhoto']);
    Route::post('logout', [UserController::class, 'logout']);

    Route::get('proses', [ProsesController::class, 'all']);
    Route::get('ruang', [RuangController::class, 'index']);
    Route::get('hari', [JadwalController::class, 'hari']);
    Route::get('jadwal', [JadwalController::class, 'jadwal']);
    Route::get('cari-ruangan', [ProsesController::class,'ruangTerpakai']);
    Route::post('reservation', [ProsesController::class,'store']);
    Route::get('reservation', [ProsesController::class,'dataReservasi']);
    Route::get('reservation/{id}', [ProsesController::class,'dataReservasiShow']);
});

Route::post('login', [UserController::class, 'login']);
Route::post('register', [UserController::class, 'register']);


