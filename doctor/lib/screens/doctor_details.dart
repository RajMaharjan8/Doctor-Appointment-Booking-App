import 'package:doctor/components/button.dart';
import 'package:doctor/models/auth_model.dart';
import 'package:doctor/providers/dio_provider.dart';
import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/custom_appBar.dart';
import '../components/button.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, required this.doctor, required this.isFav})
      : super(key: key);
  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}
class _DoctorDetailsState extends State<DoctorDetails> {
  Map<String, dynamic> doctor = {};
  bool isFav = false;
  @override
  void initState() {
    doctor = widget.doctor;
    isFav = widget.isFav;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //Gets the arguments passed from doctor card
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Doctor Details',
        icon: FaIcon(Icons.arrow_back),
        actions: [
          // Favorite button
          IconButton(
            onPressed: () async {
              //AUTHMODEL: contains all the info about the users
              final list =
                  Provider.of<AuthModel>(context, listen: false).getFav;
              //if doctor id already exists, remove the doc id when pressed 2nd time
              if (list.contains(doctor['doc_id'])) {
                list.removeWhere((id) => id == doctor['doc_id']);
              } else {
                //else add new doctor to favorites
                list.add(doctor['doc_id']);
              }
              //update the list into the authmodel and notify all the widgets
              Provider.of<AuthModel>(context, listen: false).setFavList(list);
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              final token = prefs.getString('token') ?? '';
              if (token.isNotEmpty && token != '') {
                //updating favorite page in database
                final response = await DioProvider().storeFavDoc(token, list);
                // if insert successfull then change the favorite status
                if (response == 200) {
                  setState(() {
                    isFav = !isFav;
                  });
                }
              }
            },
            icon: FaIcon(
              isFav ? Icons.favorite_rounded : Icons.favorite_outline,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              //passing doctor deatils here
              AboutDoctor(
                doctor: doctor,
              ),
              DetailBody(
                doctor: doctor,
              ),
              // const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Button(
                  width: double.infinity,
                  title: 'Book Appointment',
                  onPressed: () {
                    //navigate route to booking page
                    //pass doctor id to booking page
                    Navigator.of(context).pushNamed('booking_page',
                        arguments: {"doctor_id": doctor['doc_id']});
                  },
                  disable: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key, required this.doctor});

  final Map<dynamic, dynamic> doctor;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 55.0,
              backgroundImage: NetworkImage(
                  Config.localHost + "${doctor['doctor_profile']}"),
              backgroundColor: Colors.white,
            ),
            Config.spaceSmall,
            Text(
              "Dr ${doctor['doctor_name']}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.55,
              child: Text(
                "${doctor['bio_data']}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Config.spaceSmall,
          ],
        ));
  }
}
class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.doctor});
  final Map<dynamic, dynamic> doctor;
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          DoctorInfo(
            patients: doctor['patients'],
            exp: doctor['experience'],
          ),
          Config.spaceSmall,
          const Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          Config.spaceSmall,
          Text(
            "Dr ${doctor['doctor_name']} is an experiance ${doctor['category']} specialist.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key, required this.patients, required this.exp});

  final int patients;
  final int exp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        InfoCard(label: 'Patients', value: '$patients'),
        const SizedBox(
          width: 15,
        ),
        InfoCard(label: 'Experience', value: '$exp years'),
        const SizedBox(
          width: 15,
        ),
        // const InfoCard(label: 'Rating', value: '5')
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value})
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 15,
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
