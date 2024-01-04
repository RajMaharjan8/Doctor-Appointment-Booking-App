//dio provider = connect the database and get token
import 'dart:convert';
//dart convert is used here to convert fetched data to json data
import 'package:dio/dio.dart';
import 'package:doctor/utils/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioProvider {
  Future<dynamic> getToken(String email, String password) async {
    try {
      var response = await Dio().post(Config.localHost + '/api/login/',
          data: {'email': email, 'password': password});

//IF REQUEST SUCCESSFULL, TOKEN IS RETURNED
      if (response.statusCode == 200 && response.data != '') {
//----------STORES THE RETURNED TOKEN INTO SHAHREDPREFERENCES PRFFS

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print(error);
      return error;
    }
  }

  //GETTING USER DATA

  Future<dynamic> getUser(String token) async {
    try {
      var user = await Dio().get(Config.localHost + '/api/user/',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      //IF REQUEST SUCCESSFULL, DATA OF USER IS RETURNED
      if (user.statusCode == 200 && user.data != '') {
        return json.encode(user.data);
      }
    } catch (error) {
      return error;
    }
  }

//REGISTERING A NEW USER
  Future<dynamic> registerUser(
      String username, String email, String password) async {
    try {
      var user = await Dio().post(Config.localHost + '/api/register/',
          data: {'name': username, 'email': email, 'password': password});

      //IF REQUEST SUCCESSFULL, RETURNED TRUE TO LOGGED IN ELSE RETURN FALSE
      if (user.statusCode == 200 && user.data != '') {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return error;
    }
  }

//STORES BOOKING DETAILS
  Future<dynamic> bookAppointment(
      String date, String day, String time, int doctor, String token) async {
    try {
      var response = await Dio().post(Config.localHost + '/api/book/',
          data: {'date': date, 'day': day, 'time': time, 'doctor_id': doctor},
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'ERROR';
      }
    } catch (error) {
      return error;
    }
  }

//RETRIEVING APPOINTMENTS
  Future<dynamic> getAppointments(String token) async {
    try {
      var response = await Dio().get(Config.localHost + '/api/appointments/',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

//200 REFERS TO SUCCESS
      if (response.statusCode == 200 && response.data != '') {
        return json.encode(response.data);
      }
    } catch (error) {
      return error;
    }
  }

  Future<int> cancelAppointment(int appointmentId, String token) async {
    try {
      var response = await Dio().delete(
        Config.localHost + '/api/appointments/$appointmentId',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      // Extract the status code from the response and check for null
      int statusCode = response.statusCode ?? -1;

      // 200 refers to success
      if (statusCode == 200) {
        return statusCode;
      } else {
        return -1; // return -1 to indicate an error or unsuccessful cancellation
      }
    } catch (error) {
      return -1; // return -1 to indicate an error or unsuccessful cancellation
    }
  }

//STORE RATING DETAILS
  Future<dynamic> storeReviews(
      String reviews, double ratings, int id, int doctor, String token) async {
    try {
      var response = await Dio().post(Config.localHost + '/api/reviews/',
          data: {
            'ratings': ratings,
            'reviews': reviews,
            'appointment_id': id,
            'doctor_id': doctor
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));

//200 REFERS TO SUCCESS
      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'ERROR';
      }
    } catch (error) {
      return error;
    }
  }

//store fav doctors
//update the fav list into database
  Future<dynamic> storeFavDoc(String token, List<dynamic> favList) async {
    try {
      var response = await Dio().post(Config.localHost + '/api/fav/',
          data: {
            'favList': favList,
          },
          options: Options(headers: {'Authorization': 'Bearer $token'}));

//200 REFERS TO SUCCESS
      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'ERROR';
      }
    } catch (error) {
      return error;
    }
  }

//LOGOUT
  Future<dynamic> logout(String token) async {
    try {
      var response = await Dio().post(Config.localHost + '/api/logout/',
          options: Options(headers: {'Authorization': 'Bearer $token'}));

//200 REFERS TO SUCCESS
      if (response.statusCode == 200 && response.data != '') {
        return response.statusCode;
      } else {
        return 'ERROR';
      }
    } catch (error) {
      return error;
    }
  }
}
