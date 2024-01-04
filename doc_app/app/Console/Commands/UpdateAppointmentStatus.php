<?php

use Carbon\Carbon;
use Illuminate\Console\Command;
use App\Models\Appointments;

class UpdateAppointmentStatus extends Command
{
    protected $signature = 'appointments:update-status';
    protected $description = 'Update appointment statuses';

    public function handle()
    {
        $now = Carbon::now();
//Carbon::Now is used to get the current date and time

        
        Appointments::where('status', 'upcoming')
            ->where('date', '<', $now->format('Y-m-d'))
            ->where('time', '<', $now->format('H:i:s'))
            ->update(['status' => 'complete']);

        $this->info('Appointment statuses updated.');
    }
}
