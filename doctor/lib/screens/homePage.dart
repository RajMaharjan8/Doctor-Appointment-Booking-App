import "package:dio/dio.dart";
import 'package:doctor/components/appointmentCards.dart';
import "package:doctor/components/doctorsCard.dart";
import "package:doctor/models/auth_model.dart";
import "package:doctor/providers/dio_provider.dart";
import "package:doctor/utils/config.dart";
import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:provider/provider.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  List<dynamic> favList = [];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    user = Provider.of<AuthModel>(context, listen: false).getUser;
    doctor = Provider.of<AuthModel>(context, listen: false).getAppointment;
    favList = Provider.of<AuthModel>(context, listen: false).getFav;
    return Scaffold(
        //If user is empty, return progress indicator
        body: user.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 15,
                ),
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              user['name'],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    AssetImage("assets/profile1.jpg"),
                              ),
                            )
                          ],
                        ),
                        Config.spaceMedium,
                        Config.spaceSmall,
                        const Text(
                          'Appointments',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Config.spaceSmall,
                        doctor.isNotEmpty
                            ? AppointmentCard(
                                doctor: doctor,
                                color: Config.primaryColor,
                              )
                            : Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade700,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Text(
                                      'No Appointments Today',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ), //Passing appointment details here
                        Config.spaceSmall,
                        const Text(
                          'Doctors',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Config.spaceSmall,
                        Column(
                          children:
                              List.generate(user['doctor'].length, (index) {
                            return DoctorCard(
                              doctor: user['doctor'][index],
                              //if a particular doctor id already contains in favlist, then show fav icon
                              isFav: favList
                                      .contains(user['doctor'][index]['doc_id'])
                                  ? true
                                  : false,
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
              ));
  }
}

