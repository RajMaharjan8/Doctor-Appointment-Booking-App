<x-app-layout>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-        9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
    
{{-- {{$reviews}} --}}
    <div class="min-h-screen py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            {{-- DASHBOARD CONTAINER --}}
            <div class="flex justify-center bg-grey-100 py-10 p-14"> 

                {{-- FIRST COMMENT --}}
                <div class="container mx-auto pr-4">
                    <div class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between" style="background-color: #3498db; justify-content: center">
                            <p class="mr-0 text-lg pl-5" style="color: white">Upcoming Appointments</p>
                        </div>

                        
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600 ">
                            <p class="text-center">Total</p>
                        </div>
                        <p class="py-4 text-3xl ml-5 text-center" >{{count($appointments)}}</p>
                    </div>
                </div>

                {{-- SECOND COMMENT --}}
                <div class="container mx-auto pr-4">
                    <div class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between" style="background-color: #3498db; justify-content: center">
                            <p class="mr-0 text-lg pl-5" style="color: white">Patients</p>
                        </div>
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600 ">
                            <p class="text-center">Total</p>
                        </div>
                        <p class="py-4 text-3xl ml-5 text-center" >{{$doctor->doctor['patients']??0}}</p>
                    </div>
                </div>

                 {{-- THIRD COMMENT --}}
                 <div class="container mx-auto pr-4">
                    <div class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between" style="background-color: #3498db; justify-content: center">
                            <p class="mr-0 text-lg pl-5" style="color: white">Rating</p>
                        </div>                       
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600 ">
                            <p class="text-center">Total</p>
                        </div>
                        <p class="py-4 text-3xl ml-5 text-center" >
                            {{-- average of all ratings --}}
                            @if (isset($reviews))
                                @php
                                //getting total reviews count
                                    $count = count($reviews);
                                    $rating = 0;
                                    $total = 0;                                    
                                    if($count !=0){
                                        foreach ($reviews as $review) {
                                            //getting total ratings from review table
                                            $total += $review['ratings'];
                                        }
                                        $rating = $total / $count;
                                    }else {
                                        $rating =0;
                                    }
                                @endphp                                
                           @endif
                            {{$rating}}
                        </p>
                    </div>
                </div>

                 {{-- Fourth COMMENT --}}
                 <div class="container mx-auto pr-4">
                    <div class="w-72 bg-white max-w-xs mx-auto rounded-sm overflow-hidden shadow-lg hover:shadow-2xl transition duration-500 transform hover:scale-100 cursor-pointer">
                        <div class="h-20 bg-blue-500 flex items-center justify-between" style="background-color:#3498db; justify-content: center">
                            <p class="mr-0 text-lg pl-5" style="color: white">Reviews</p>
                        </div>                        
                        <div class="flex justify-between px-5 pt-6 mb-2 text-sm text-gray-600 ">
                            <p class="text-center">Total</p>
                        </div>
                        <p class="py-4 text-3xl ml-5 text-center" >{{count($reviews)}}</p>
                    </div>
                </div>
            </div>

        <div><h5>Upcoming Appointments</h5></div>
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Date</th>
                        <th scope="col">Time</th>
                        <th scope="col">Status</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($appointments as $appointment)
                        <tr>
                            <td>{{$appointment->user_name}}</td>
                            <td>{{$appointment->date}}</td>
                            <td>{{$appointment->time}}</td>
                            <td>{{$appointment->status}}</td>
                            <td>
                                <div class="d-flex">
                                @if ($appointment->status === 'upcoming')
                                    <form method="POST" action="{{ route('cancelAppointment', $appointment) }}">
                                        @csrf
                                        @method('PUT')
                                        <button type="submit" class="btn btn-danger">Cancel</button>
                                    </form>
                                    
                                    <form method="POST" action="{{ route('markCompleted', $appointment) }}">
                                        @csrf
                                        @method('PUT')
                                        <button type="submit" class="btn btn-success">Completed</button>
                                    </form>
                                @endif
                            </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <br><br><br>
        <div><h5>All Appointments</h5></div>
        <table class="table mt-4">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Date</th>
                    <th scope="col">Time</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                @foreach($allAppointments as $appointment)
                <tr>
                    <td>{{$appointment->user_name}}</td>
                    <td>{{$appointment->date}}</td>
                    <td>{{$appointment->time}}</td>
                    <td>{{$appointment->status}}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

            <div class="card">
                <h5 class="card-header">Latest Reviews</h5>
                <div class="card-body">

                    @if(isset($reviews) && !$reviews->isEmpty())
                    <ul class="list-group">
                        @foreach ($reviews as $review)
                            @if(@isset($review->reviews) && $review->reviews != '')
                                <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                                    <div class="d-flex flex-column">
                                        
                                        <div class="card-body">
                                            <h6 class="card-title bold">{{$review->reviewed_by}}</h6>
                                            <p class="card-text">{{$review->reviews ?? '-'}}</p>

                                            <blockquote class="blockquote mb-0">
                                                <footer class="blockquote-footer">
                                                    <p class="card-text">
                                                        {{$review->created_at ?? '-'}}
                                                    </p></footer>
                                              </blockquote>
                                            
                                        </div>
                                        
                                    </div>
                                </li> 

                            @endif
                        @endforeach
                    </ul>
                    @else
                    <div class="card-body">
                        <h6 class="card-title ">No Reviews</h6>             
                    </div>
                    
                @endif
                </div>
              </div>
            
        </div>
    </div>
    
</x-app-layout>
