import 'dart:ffi';

import 'package:doctor/models/auth_model.dart';
import 'package:doctor/screens/authentication.dart';
import 'package:doctor/screens/bookingPage.dart';
import 'package:doctor/screens/doctor_details.dart';
import 'package:doctor/screens/successBookingPage.dart';
import 'package:doctor/utils/config.dart';
import 'package:doctor/utils/mainLayout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    //theme data
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // removes the debug watermark
        navigatorKey: navigatorKey,
        title: 'Clinic',
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              focusColor: Config.primaryColor,
              border: Config.outLinedBorder,
              enabledBorder: Config.outLinedBorder,
              focusedBorder: Config.focusBorder,
              errorBorder: Config.errorBorder,
              floatingLabelStyle: TextStyle(color: Config.primaryColor),
              prefixIconColor: Colors.black87,
            ),
            scaffoldBackgroundColor: Colors.white,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Config.primaryColor,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey.shade600,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
            )),
        initialRoute: '/',
        routes: {
          //authentication page
          '/': (context) => const AuthPage(),
          //main layoout of the app
          'main': (context) => const MainLayout(),
          //'doc_details': (context) => const DoctorDetails(),
          'booking_page': (context) => BookignPage(),
          'success_booking': (context) => const AppointmentBooked(),
        },
      ),
    );
  }
}
