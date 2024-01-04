import "package:doctor/main.dart";
import "package:doctor/providers/dio_provider.dart";
import "package:doctor/utils/config.dart";
import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            color: Config.primaryColor,
            child: Column(
              children: const <Widget>[
                SizedBox(
                  height: 100,
                ),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/profile1.jpg'),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
              color: Colors.grey[200],
              child: Card(
                margin: const EdgeInsets.fromLTRB(0, 45, 0, 0),
                child: Container(
                  width: 300,
                  height: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Divider(
                          color: Colors.grey[300],
                        ),
                        Config.spaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.redAccent[400],
                              size: 35,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                                onPressed: () async {
                                  // TOKEN IS STORED IN SHAREDPREFERENCES AND TO LOGOUT WE MUST DELETE IT
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  final token = prefs.getString('token') ?? '';

                                  if (token.isNotEmpty && token != '') {
                                    //logout here
                                    final response =
                                        await DioProvider().logout(token);

                                    if (response == 200) {
                                      await prefs.remove('token');

                                      setState(() {
                                        //redirect to login page
                                        MyApp.navigatorKey.currentState!
                                            .pushReplacementNamed('/');
                                      });
                                    }
                                  }
                                },
                                child: const Text(
                                  "Logout",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ))
      ],
    );
  }
}
