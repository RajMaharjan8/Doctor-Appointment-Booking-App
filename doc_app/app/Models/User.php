<?php

namespace App\Models;

use App\Models\Doctor;
use App\Models\Reviews;
use App\Models\UserDetails;
use App\Models\Appointments;
use Laravel\Sanctum\HasApiTokens;
use Laravel\Jetstream\HasProfilePhoto;
use Illuminate\Notifications\Notifiable;
use Laravel\Fortify\TwoFactorAuthenticatable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use HasProfilePhoto;
    use Notifiable;
    use TwoFactorAuthenticatable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'type', //type is for differentiating which user is a doctor and which one is a patient
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'two_factor_recovery_codes',
        'two_factor_secret',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    /**
     * The accessors to append to the model's array form.
     *
     * @var array<int, string>
     */
    protected $appends = [
        'profile_photo_url',
    ];
    
    //This shows that patients has one relationship with doctor
    //each user id refers to one docor
    public function doctor(){
        return $this->hasOne(Doctor::class, 'doc_id');

    }
    public function user_details(){
        return $this->hasOne(UserDetails::class, 'user_id');

    }
    //a user may have many appointments
    public function appointments(){
        return $this->hasMany(Appointments::class, 'user_id');

    }
    // a user can have many reveiws
    public function reviews(){
        return $this->hasMany(Reviews::class, 'user_id');

    }
}
