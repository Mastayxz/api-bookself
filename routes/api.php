<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|

| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return response()->json([
        'message' => 'Unautorizhed'
    ], 401);
})->name('login');

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::post('/books', [BookController::class, 'store'])->middleware('auth:sanctum');
Route::get('/books', [BookController::class, 'index'])->middleware('auth:sanctum');
Route::get('/books/{book_id}', [BookController::class, 'show'])->middleware('auth:sanctum');
Route::put('/books/{book_id}', [BookController::class, 'update'])->middleware('auth:sanctum');
Route::delete('/books/{book_id}', [BookController::class, 'destroy'])->middleware('auth:sanctum');
