<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DocsController;
use App\Http\Controllers\AppointmentsController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
Route::put('/appointments/{appointment}', [AppointmentsController::class, 'markCompleted'])->name('markCompleted');
// routes/web.php
Route::put('/appointments/{appointment}/cancel', [AppointmentsController::class, 'cancelAppointment'])->name('cancelAppointment');

Route::get('/', function () {
    return view('welcome');
});

// routes/web.php
Route::get('/welcome', function () {
    return view('welcome');
})->name('welcome');


Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified'
])->group(function () {
    Route::get('/dashboard',[DocsController::class, 'index'])->name('dashboard');
});

