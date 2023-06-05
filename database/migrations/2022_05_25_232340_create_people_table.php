<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('surname')->nullable();
            $table->string('gender');
            $table->string('identification_type')->nullable();
            $table->string('identification_number')->nullable();
            $table->string('birthday_date')->nullable();
            $table->string('ethnic_group')->nullable();
            $table->string('email')->unique();
            $table->string('phone')->nullable();
            $table->string('blood_type')->nullable();
            $table->string('person_type');
            $table->string('department')->nullable();
            $table->string('municipality')->nullable();
            $table->string('direction')->nullable();
            $table->text('profile_photo_path')->nullable();
            $table->foreignId('establishment_id')->constrained('establishments');
            $table->foreignId('headquarter_id')->constrained('headquarters');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('people');
    }
};
