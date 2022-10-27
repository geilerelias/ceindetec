<?php

namespace App\Http\Controllers;

use App\Mail\MessageReceived;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class SendMailController extends Controller
{
    public function send(Request $request)
    {
        $message = request()->validate([
            'name' => 'required',
            'email' => 'required|email',
            'subject' => '',
            'content' => 'required|min:3'
        ], [
            'name.required' => __('I need your name')
        ]);

        Mail::to('atencionciudadana@ceindetecguajira.com')->queue(new MessageReceived($message));
        // return new MessageReceived($message);
        return 'Mensaje enviado';
    }
}
