<x-guest-layout>
    <x-authentication-card>
        <div style="padding: 10px; font-size: 25px">
            <h1 style="color: #3498db;">Login Here</h1>
        </div>
        <x-slot name="logo">
            {{-- <x-authentication-card-logo /> --}}
        </x-slot>

        <x-validation-errors class="mb-4" />

        @if (session('status'))
            <div class="mb-4 font-medium text-sm text-green-600">
                {{ session('status') }}
            </div>
        @endif

        <form method="POST" action="{{ route('login') }}">
            @csrf

            <div>
                <x-label for="email" value="{{ __('Email') }}" />
                <x-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
            </div>

            {{-- <div class="mt-4">
                <x-label for="password" value="{{ __('Password') }}" />
                <x-input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="current-password" />
            </div> --}}
            <div class="mt-4 relative">
                <x-label for="password" value="{{ __('Password') }}" />
                <x-input id="password" class="block mt-1 w-full pr-10" type="password" name="password" required autocomplete="current-password" />
                <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-500 cursor-pointer" onclick="togglePasswordVisibility('password')">
                    <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2 12s3 3 5 5a6.5 6.5 0 007 0c1.733-1.734 5-5 5-5s-3-3-5-5a6.5 6.5 0 00-7 0c-1.733 1.734-5 5-5 5z"/>
                    </svg>
                </div>
            </div>
            

            <div class="block mt-4">
                <label for="remember_me" class="flex items-center">
                    <x-checkbox id="remember_me" name="remember" />
                    <span class="ml-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
                </label>
            </div>

            <div class="flex items-center justify-end mt-4">

                <div class="flex items-center justify-between mt-4">
                    {{-- Link to Signup Page --}}
                    <a class="underline text-sm text-gray-600 hover:text-gray-900" href="{{ route('register') }}">
                        {{ __('Don\'t have an account? Sign up here') }}
                    </a>

                {{-- <x-button class="ml-4">
                    {{ __('Log in') }}
                </x-button> --}}

                <x-button class="ml-4 custom-login-button">
                    {{ __('Log in') }}
                </x-button>
                

                
            </div>
        </form>
    </x-authentication-card>
</x-guest-layout>
