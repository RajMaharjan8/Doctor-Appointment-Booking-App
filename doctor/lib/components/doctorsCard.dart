import 'package:doctor/main.dart';
import 'package:doctor/screens/doctor_details.dart';
import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  DoctorCard({Key? key, required this.doctor, required this.isFav})
      : super(key: key);
  // final String route;
  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(children: [
            SizedBox(
              width: Config.widthSize * 0.33,
              child: Image.network(
                Config.localHost + "${doctor['doctor_profile']}",
                fit: BoxFit.fill,
              ),
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Dr ${doctor['doctor_name']}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "${doctor['category']}",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const <Widget>[
                      
                    ],
                  ),
                ],
              ),
            ))
          ]),
        ),
        onTap: () {
          //SEND DETAILS TO DETAILS PAGE
          MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => DoctorDetails(
                    doctor: doctor,
                    isFav: isFav,
                  )));
        },
      ),
    );
  }
}
