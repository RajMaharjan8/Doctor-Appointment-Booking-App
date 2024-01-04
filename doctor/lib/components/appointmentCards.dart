import 'package:doctor/main.dart';
import 'package:doctor/providers/dio_provider.dart';
import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentCard extends StatefulWidget {
  AppointmentCard({Key? key, required this.doctor, required this.color})
      : super(key: key);

  final Map<String, dynamic> doctor;
  final Color color;

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: widget.color),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            //----------------inserting row here------------------------

            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      Config.localHost + "${widget.doctor['doctor_profile']}"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Dr ${widget.doctor['doctor_name']}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${widget.doctor['category']}",
                      style: const TextStyle(color: Colors.white),

                      ///black or primary
                    ),
                  ],
                ),
              ],
            ),

            Config.spaceSmall,

            //----------------information about scheduling--------------------
            ScheduleCard(
              appointment: widget.doctor['appointments'],
            ),
            Config.spaceSmall,

            // action button

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Completed',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return RatingDialog(
                                initialRating: 1.0,
                                title: const Text(
                                  'Rate the Doctor',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                message: const Text(
                                    'Please help us to rate our Doctors',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                    )),
                                image: const FlutterLogo(size: 100),
                                submitButtonText: 'Submit',
                                commentHint: 'Your Reviews',
                                onSubmitted: (response) async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  final token = prefs.getString('token') ?? '';

                                  final rating = await DioProvider()
                                      .storeReviews(
                                          response.comment,
                                          response.rating,
                                          widget.doctor['appointments']['id'],
                                          widget.doctor['doc_id'],
                                          token);

                                  //IF SUCCESSFUL THEN REFRESH
                                  if (rating == 200 && rating != '') {
                                    MyApp.navigatorKey.currentState!
                                        .pushNamed('main');
                                  }
                                });
                          });
                    },
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard({Key? key, required this.appointment}) : super(key: key);
  final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.black,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '${appointment['day']}, ${appointment['date']}',
            style: const TextStyle(color: Colors.black),
          ),
//----------------------------------------------
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Colors.black,
            size: 17,
          ),
//--------------------------------------
          const SizedBox(
            width: 5,
          ),

          Flexible(
              child: Text(
            appointment['time'],
            style: const TextStyle(color: Colors.black),
          ))
        ],
      ),
    );
  }
}
