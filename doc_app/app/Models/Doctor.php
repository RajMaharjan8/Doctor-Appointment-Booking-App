<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    protected $fillable = [
        'doc_id',
        'category',
        'patients',
        'experience',
        'bio_data',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    // For automatically filling in patient number in the database of the doctor
    protected static function booted()
    {
        static::creating(function ($doctor) {
            $doctor->patients = 0; // Set patients to 0 when creating a new Doctor
            $doctor->experience = 0; // Set experience to 0 when creating a new Doctor
            $doctor->category = 'unknown'; // Set category to 'unknown' when creating a new Doctor
            $doctor->bio_data = 'unknown'; // Set bio_data to 'unknown' when creating a new Doctor
        });
    }
}
