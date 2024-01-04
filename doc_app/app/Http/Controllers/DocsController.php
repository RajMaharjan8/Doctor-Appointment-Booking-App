<?php
namespace App\Http\Controllers;

use App\Models\Reviews;
use App\Models\Appointments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DocsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $doctor = Auth::user();

        // Fetch upcoming appointments
        $appointments = Appointments::join('users', 'appointments.user_id', '=', 'users.id')
            ->where('appointments.doc_id', $doctor->id)
            ->where('appointments.status', 'upcoming')
            ->select('appointments.*', 'users.name as user_name')
            ->get();

        // Fetch all appointments (remove the status condition)
        $allAppointments = Appointments::join('users', 'appointments.user_id', '=', 'users.id')
            ->where('appointments.doc_id', $doctor->id)
            ->select('appointments.*', 'users.name as user_name')
            ->get();

        // Fetch reviews
        $reviews = Reviews::where('doc_id', $doctor->id)->where('status', 'active')->get();
        return view('dashboard')->with(['doctor' => $doctor, 'appointments' => $appointments, 'allAppointments' => $allAppointments, 'reviews' => $reviews]);
    }

    public function store(Request $request)
    {
        //to store booking details post from mobile app
        $reviews = new Reviews();
        // this is to update the appointment status from 'upcoming' to completed
        $appointment = Appointments::where('id',$request->get('appointment_id'))->first();

        //save the ratings and reviews from user
        $reviews->user_id = Auth::user()->id;
        $reviews->doc_id = $request->get('doctor_id');
        $reviews->ratings = $request->get('ratings');
        $reviews->reviews = $request->get('reviews');
        $reviews->reviewed_by = Auth::user()->name;
        $reviews->status = 'active';
        $reviews->save();
        //change appointment status
        $appointment->status = 'complete';
        $appointment->save();
        return response()->json([
            'success'=>'The appointment has been completed and reviewed successfully!',
        ], 200);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    public function getRatingsAndReviews($doctorId)
        {
            // Retrieve ratings and reviews for the specified doctor from our database for dashboard
            $ratingsAndReviews = Reviews::where('doc_id', $doctorId)->get();

            // format the data as needed and return it as JSON
            return response()->json($ratingsAndReviews);
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
    public function destroy(string $id)
    {
        //
    }
}
