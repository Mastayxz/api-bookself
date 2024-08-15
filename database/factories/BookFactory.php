<?php

namespace Database\Factories;

use App\Models\Book;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class BookFactory extends Factory
{
    protected $model = Book::class;

    public function definition()
    {
        return [
            'isbn' => $this->faker->isbn13,
            'title' => $this->faker->sentence,
            'subtitle' => $this->faker->sentence,
            'author' => $this->faker->name,
            'published' => $this->faker->date,
            'publisher' => $this->faker->company,
            'pages' => $this->faker->numberBetween(100, 1000),
            'description' => $this->faker->paragraph,
            'website' => $this->faker->url,
            'user_id' => User::factory(), // Asumsi Anda memiliki factory untuk User
        ];
    }
}
