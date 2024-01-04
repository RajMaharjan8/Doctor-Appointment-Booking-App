import "package:doctor/components/doctorsCard.dart";
import "package:doctor/models/auth_model.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class FavPage extends StatefulWidget {
  FavPage({Key? key}) : super(key: key);

  @override
  State<FavPage> createState() => _FavPage();
}

class _FavPage extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
      child: Column(children: [
        const Text(
          'Favorite Doctors',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(child: Consumer<AuthModel>(
          builder: (context, auth, child) {
            return ListView.builder(
                itemCount: auth.getFavDoc.length,
                itemBuilder: (context, index) {
                  return DoctorCard(
                    doctor: auth.getFavDoc[index],

                    //Show favorite icon
                    isFav: true,
                  );
                });
          },
        ))
      ]),
    ));
  }
}
