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
        Schema::create('qr_codes', function (Blueprint $table) {
            $table->id();
            $table->string('consecutive')->unique();
            $table->string('status')->default('inactive');
            $table->string('description')->nullable();
            $table->text('photo_path')->nullable();

            $table->string('municipality')->nullable();
            $table->string('department')->nullable();

            $table->foreignId('establishments_id')->nullable()->constrained('establishments');
            $table->foreignId('headquarters_id')->nullable()->constrained('headquarters');

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
        Schema::dropIfExists('qr_codes');
    }
};
