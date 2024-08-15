<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AuthController extends Controller
{
    //

    public function register(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
        ]);

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);


        // Susun array agar 'id' muncul paling atas
        $userData = [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
        ];

        return response()->json(['message' => 'User Created', 'user' => $userData], 200);
    }

    public function login(Request $request)
    {
        // Validasi input request
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string',
        ]);

        // Jika validasi gagal, kembalikan respon 422
        if ($validator->fails()) {
            return response()->json([
                'message' => 'Validation Error',
                'errors' => $validator->errors(),
            ], 422);
        }

        // Cek kredensial pengguna
        $credentials = $request->only('email', 'password');

        if (!Auth::attempt($credentials)) {
            // Jika kredensial tidak cocok, kembalikan respon 401
            return response()->json([
                'message' => 'Invalid credentials',
            ], 401);
        }

        // Ambil pengguna dari database
        $user = User::where('email', $request->email)->first();

        // Buat token menggunakan Sanctum
        $token = $user->createToken('api-token')->plainTextToken;

        // Kembalikan respon sukses dengan token dan data pengguna
        return response()->json([
            'message' => 'User Created',
            'token' => $token,
        ], 200);
    }
}
