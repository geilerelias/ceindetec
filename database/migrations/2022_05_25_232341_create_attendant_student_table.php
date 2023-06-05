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
        Schema::create('attendant_student', function (Blueprint $table) {
            $table->id();
            $table->string('relationship');
            $table->foreignId('attendant_id')->constrained('people')->onDelete('cascade');
            $table->foreignId('student_id')->constrained('people')->onDelete('cascade');

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
        Schema::dropIfExists('attendant_student');
    }
};
