<?php


namespace App\Providers;

use App\Actions\Jetstream\DeleteUser;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\ServiceProvider;
use Laravel\Fortify\Fortify;
use Laravel\Jetstream\Jetstream;

// namespace App\Providers;
// use App\Models\User;
// use Laravel\Fortify\Fortify;
// use Laravel\Jetstream\Jetstream;
// use App\Actions\Jetstream\DeleteUser;
// use Illuminate\Support\ServiceProvider;

class JetstreamServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //CHECKS USER EMAIL, PASSWORD AND ALLOW ONLY DOCTORS TO LOG IN
        // Fortify::authenticateUsing(function(Request $request){
        //     $user = User::where('email', $request->email)->first();
        //     if($user && Hash::check($request->password, $user->password) && $user->type =='doctor'){
        //         return $user;
        //     }
        // }

        Fortify::authenticateUsing(function(Request $request){
            $user = User::where('email', $request->email)->first();
            if($user && Hash::check($request->password, $user->password) && $user->type == 'doctor'){
                return $user;
            }
        }
    
    );
        $this->configurePermissions();

        Jetstream::deleteUsersUsing(DeleteUser::class);
    }

    /**
     * Configure the permissions that are available within the application.
     */
    protected function configurePermissions(): void
    {
        Jetstream::defaultApiTokenPermissions(['read']);

        Jetstream::permissions([
            'create',
            'read',
            'update',
            'delete',
        ]);
    }
}
