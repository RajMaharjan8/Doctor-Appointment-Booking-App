<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

        <!-- Scripts -->
        @vite(['resources/css/app.css', 'resources/js/app.js'])

        <style>
            .custom-register-button {
                background-color: #4CAF50;
                color: white;
                transition: background-color 0.3s;
            }
        
            .custom-register-button:hover {
                background-color: #337336; /* Darker shade for hover for register */
            }
            

            .custom-login-button {
                background-color: #3498db;
                color: #ffffff;
                transition: background-color 0.3s ease;
            }

            .custom-login-button:hover {
                background-color: #2980b9;
            }
        </style>


        <script>
        function togglePasswordVisibility(inputId) {
            var passwordInput = document.getElementById(inputId);
            passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
        }
        </script>

    </head>
    <body>

        <a href="{{ route('welcome') }}" style="text-decoration: none; color: inherit;">
            <div style="background-color: #3498db; padding: 10px; text-align: center;">
                <h1 style="color: white;">Doctor's Dashboard</h1>
            </div>
        </a>
        
        <div class="font-sans text-gray-900 antialiased">
            {{ $slot }}
        </div>

         <!-- Footer -->
         <div style="text-align: center; color: #888888; background-color: #000; padding: 10px;">
            &copy; 2023 
        </div>
    </body>
</html>
