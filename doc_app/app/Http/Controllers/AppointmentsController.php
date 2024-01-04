<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Doctor;
use App\Models\Appointments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AppointmentsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //RETRIEVE ALL APPOINTMENTS FROM THE USER
        $appointment = Appointments::where('user_id', Auth::user()->id)->get();
        $doctor = User::where('type','doctor')->get();

        foreach($appointment as $data){
            foreach($doctor as $info){
                $details = $info->doctor;
                if($data['doc_id']==$info['id']){
                    $data['doctor_name'] = $info['name'];
                    $data['doctor_profile']=$info['profile_photo_url'];
                    $data['category'] = $details['category'];
                }
            }
        }
        return $appointment;
    }

    public function markCompleted(Appointments $appointment)
        {
            // ensuring that the appointment exists and is in 'upcoming' status
            if (!$appointment || $appointment->status !== 'upcoming') {
                return redirect()->route('dashboard')->with('error', 'Invalid appointment or it is not upcoming.');
            }
            // Mark the appointment as completed
            $appointment->status = 'complete';
            $appointment->save();
            return redirect()->route('dashboard')->with('success', 'Appointment marked as completed.');
        }

    public function cancelAppointment(Appointments $appointment)
            {
                // ensuring that the appointment exists and is in 'upcoming' status
                if (!$appointment || $appointment->status !== 'upcoming') {
                    return redirect()->route('dashboard')->with('error', 'Invalid appointment or it is not upcoming.');
                }
                // mark the appointment as canceled
                $appointment->status = 'cancel';
                $appointment->save();
                return redirect()->route('dashboard')->with('success', 'Appointment canceled successfully.');
            }




           

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
{
    // Retrieve the input values from the request
    $doctorId = $request->get('doctor_id');
    $date = $request->get('date');
    $time = $request->get('time');
    // Checking if an upcoming appointment already exists for the same doctor, date, and time
    $existingAppointment = Appointments::where('doc_id', $doctorId)
        ->where('date', $date)
        ->where('time', $time)
        ->where('status', 'upcoming')
        ->first();
    if ($existingAppointment) {
        // An upcoming appointment already exists for the same doctor, date, and time
        return response()->json([
            'error' => 'This time slot is already booked. Please choose another time slot.',
        ], 400); 
    }
    // Create a new appointment
    $appointment = new Appointments();
    $appointment->user_id = Auth::user()->id;
    $appointment->doc_id = $doctorId;
    $appointment->date = $date;
    $appointment->day = $request->get('day');
    $appointment->time = $time;
    $appointment->status = 'upcoming'; 
    $appointment->save();
      // to find the associated doctor and increment their "patients" attribute.
    $doctor = Doctor::where('doc_id', $doctorId)->first();
      if ($doctor) {
          $doctor->increment('patients');
      }
    return response()->json([
        'success' => 'Your appointment has been made successfully!',
    ], 200); 
}
    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */

    public function destroy(int $id)
{
    // Finding the appointment by id
    $appointment = Appointments::find($id);
    // Checking if the appointment exists
    if (!$appointment) {
        return response()->json(['error' => 'Appointment not found'], 404);
    }

    // Checking if the appointment belongs to the authenticated user
    if ($appointment->user_id !== Auth::user()->id) {
        return response()->json(['error' => 'Unauthorized'], 401);
    }

    // Checking if the appointment status is 'upcoming'
    if ($appointment->status !== 'upcoming') {
        return response()->json(['error' => 'Cannot cancel a completed or canceled appointment'], 400);
    }

    // Updating the appointment status to 'cancel'
    $appointment->status = 'cancel';
    $appointment->save();

    return response()->json(['message' => 'Appointment canceled successfully'], 200);
}

}
