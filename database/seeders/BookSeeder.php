<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Book;

class BookSeeder extends Seeder
{
    public function run()
    {
        // Menggunakan factory untuk membuat data buku
        Book::factory()->count(10)->create();
    }
}
