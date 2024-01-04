<?php
namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Doctor;
use App\Models\UserDetails;
use App\Models\Appointments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return \Illuminate\Http\Response 
     */
    public function index()
    {
        //return a set of user and doctor data
        $user = array(); 
        $user = Auth::user();
        $doctor = User::where('type','doctor')->get();

        $details = $user->user_details;
        $doctorData = Doctor::all();

        //return todays appointment if any
        $date = now()->format('n/j/Y');
        $appointment = Appointments::where('status','upcoming')->where('date',$date)->first();

        //collect all user data and all doctor's details
        foreach($doctorData as $data){
            //sorting doctor name and details from user table
            foreach($doctor as $info){
                if($data['doc_id'] == $info['id']){
                    $data['doctor_name'] = $info['name'];
                    $data['doctor_profile'] = $info['profile_photo_url'];

                    if(isset($appointment) && $appointment['doc_id']==$info['id']){
                        $data['appointments'] = $appointment;
                    }
                }
            }
        }
        $user['doctor']=$doctorData;
        $user['details'] = $details; //this returns user details together with doctor list

         return $user; // This returns all the data
    }
    
    /**
     *LOGIN
     * @return \Illuminate\Http\Response 
     */
    public function login(Request $request)
    {
        $request->validate([
            'email'=>'required|email',
            'password'=>'required',
        ]);

        //Check for matching user
        $user = User::where('email',$request->email)->first();

        //Check if password is correct or not
        if (! $user || ! Hash::check($request->password, $user->password)) {
            throw ValidationException::withMessages([
                'email' => ['The provided credentials are incorrect.'],
            ]);
        }

        //token generation
        return $user->createToken($request->email)->plainTextToken;
    }

     /**
     *REGISTERING A NEW USER 
     * @return \Illuminate\Http\Response 
     */
    public function register(Request $request)
    {
       //Validate incoming request
        $request->validate([
            'name'=>'required|string',
            'email'=>'required|email',
            'password'=>'required',
        ]);
        $user = User::create([
            'name'=>$request->name,
            'email'=>$request->email,
            'type'=>'user',
            'password'=> Hash::make($request->password),
        ]);

        $userInfo = UserDetails::create([
            'user_id'=>$user->id,
            'status'=>'active',

        ]);

        return $user;


    }

     /**
     * Update favourite doctor list
     * 
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function storeFavDoc(Request $request)
    {
        $saveFav = UserDetails::where('user_id',Auth::user()->id)->first();

        $docList = json_encode($request->get('favList'));


        //update favorite list into database
        $saveFav->fav = $docList;
        $saveFav->save();

        return response()->json([
            'success'=>'The Favotite List is updated',
        ], 200);
    }

     /**
     *LOGOUT
     * @return \Illuminate\Http\Response 
     */
    public function logout(){
        $user = Auth::user();
        $user->currentAccessToken()->delete();

        return response()->json([
            'success' => 'Logout successfully!',
        ],200);
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
     */
    public function store(Request $request)
    {
        //
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
    public function destroy(string $id)
    {
        //
    }
}
