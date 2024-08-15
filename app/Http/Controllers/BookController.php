<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class BookController extends Controller
{
    /**
     * Menyimpan buku baru.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */

    public function index()
    {
        // Ambil data buku dengan pagination, misalnya 10 buku per halaman
        $books = Book::paginate(10);

        // Kembalikan respons sukses dengan data buku
        return response()->json([
            'books' => $books
        ], 200);
    }
    public function store(Request $request)
    {
        // Validasi request body
        $validator = Validator::make($request->all(), [
            'isbn' => 'required|string|max:255|unique:books,isbn',
            'title' => 'required|string|max:255',
            'subtitle' => 'nullable|string|max:255',
            'author' => 'nullable|string|max:255',
            'published' => 'nullable|date',
            'publisher' => 'nullable|string|max:255',
            'pages' => 'nullable|integer',
            'description' => 'nullable|string',
            'website' => 'nullable|string|max:255|url',
        ]);

        // Jika validasi gagal
        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation Error',
                'messages' => $validator->errors(),
            ], 422);
        }

        // Tambahkan user_id dari pengguna yang sedang login
        $data = $request->all();
        $data['user_id'] = Auth::id();

        // Simpan buku ke dalam database
        $book = Book::create($data);

        // Jika berhasil, kembalikan respons sukses
        return response()->json([
            'message' => 'Book created successfully',
            'book_id' => $book->id,
            'user_id' => $book->user_id,
            'isbn' => $book->isbn,
            'title' => $book->title,
            'subtitle' => $book->subtitle,
            'author' => $book->author,
            'published' => $book->published,
            'publisher' => $book->publisher,
            'pages' => $book->pages,
            'description' => $book->description,
            'website' => $book->website,
        ], 201);
    }

    public function show($book_id)
    {
        // Cari buku berdasarkan ID
        $book = Book::find($book_id);

        // Jika buku tidak ditemukan
        if (!$book) {
            return response()->json([
                'message' => 'no query results for model [App\\Models\\Book] 999'
            ], 404);
        }

        // Periksa apakah buku dimiliki oleh pengguna yang sedang terautentikasi
        if ($book->user_id !== Auth::id()) {
            return response()->json([
                'error' => 'This action is unauthorized'
            ], 403);
        }

        // Jika ditemukan, kembalikan data buku
        return response()->json([
            'book' => $book
        ], 200);
    }



    public function update(Request $request, $book_id)
    {
        // Validasi request body
        $validator = Validator::make($request->all(), [
            'isbn' => 'required|string|max:255|unique:books,isbn,' . $book_id,
            'title' => 'required|string|max:255',
            'subtitle' => 'nullable|string|max:255',
            'author' => 'nullable|string|max:255',
            'published' => 'nullable|date',
            'publisher' => 'nullable|string|max:255',
            'pages' => 'nullable|integer',
            'description' => 'nullable|string',
            'website' => 'nullable|string|max:255|url',
        ]);

        // Jika validasi gagal
        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation Error',
                'messages' => $validator->errors(),
            ], 422);
        }

        // Temukan buku berdasarkan ID
        $book = Book::find($book_id);

        // Jika buku tidak ditemukan
        if (!$book) {
            return response()->json([
                'message' => 'no query results for model [App\\Models\\Book] 999'
            ], 404);
        }

        // Periksa apakah pengguna yang melakukan request adalah pemilik buku
        if ($book->user_id !== auth()->id()) {
            return response()->json([
                'message' => 'This action is unauthorized',
            ], 403);
        }

        // Perbarui data buku
        $book->update($request->all());

        // Kembalikan respons 
        return response()->json([
            'message' => 'Book updated ',
            'book_id' => $book->id,
            'user_id' => $book->user_id,
            'isbn' => $book->isbn,
            'title' => $book->title,
            'subtitle' => $book->subtitle,
            'author' => $book->author,
            'published' => $book->published,
            'publisher' => $book->publisher,
            'pages' => $book->pages,
            'description' => $book->description,
            'website' => $book->website,
        ], 200);
    }

    public function destroy($book_id)
    {
        // Temukan buku berdasarkan ID
        $book = Book::find($book_id);

        // Jika buku tidak ditemukan
        if (!$book) {
            return response()->json([
                'message' => 'no query results for model [App\\Models\\Book] 999'
            ], 404);
        }

        // Periksa apakah pengguna yang melakukan request adalah pemilik buku
        if ($book->user_id !== auth()->id()) {
            return response()->json([
                'message' => 'This action is unauthorized',
            ], 403);
        }

        // Perbarui data buku
        $book->delete();

        // Kembalikan respons 
        return response()->json([
            'message' => 'Book deleted',
            'book' => $book
        ], 200);
    }
}
