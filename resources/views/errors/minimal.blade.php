<!DOCTYPE html>
<html lang="@yield('title'){{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

    <!-- Styles -->
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
</head>
<body class="antialiased">
<div class="w-screen h-screen">
    <div
        class=" flex w-full bg-white  items-center justify-between flex-wrap p-5 m-auto top-0 animated ustify-content-center justify-content-md-start pt-3">
        <div class="md:container md:mx-auto">
            <a href="/">
                <img src="{{asset('images/logo.png')}}" width="150px"/>
            </a>
        </div>
    </div>

    <div class="flex items-center justify-center">
        <div class="px-40 py-20 ">
            <div class="flex flex-col items-center">
                <h1 class="text-center font-sans text-6xl font-bold mb-0"
                    style="color: #E28925;">
                    @yield('code')
                </h1>
                <h6 class="mb-2 font-sans text-4xl font-bold text-center text-gray-800 md:text-6xl">
                    <span class="text-red-500">Oops!</span>
                    @yield('message')
                </h6>

                <a href="{{ url()->previous()}}"
                   style="background-color:#E28925 "
                   class="inline-flex items-center px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white  hover:bg-indigo-400 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                    <svg xmlns="http://www.w3.org/2000/svg" class="-ml-1 mr-2 h-5 w-5" viewBox="0 0 20 20"
                         fill="currentColor">
                        <path fill-rule="evenodd"
                              d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z"
                              clip-rule="evenodd"/>
                    </svg>
                    volver
                </a>
            </div>
        </div>
    </div>
    <div>
        <img class="w-screen" src="{{asset('images/errorcurva.png')}}"/>
    </div>
</div>
</body>
</html>
