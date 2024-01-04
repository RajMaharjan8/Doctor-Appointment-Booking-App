import 'package:doctor/components/button.dart';
import 'package:doctor/components/custom_appBar.dart';
import 'package:doctor/main.dart';
import 'package:doctor/models/booking_dateTime_conversion.dart';
import 'package:doctor/providers/dio_provider.dart';
import 'package:doctor/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookignPage extends StatefulWidget {
  const BookignPage({super.key});

  @override
  State<BookignPage> createState() => _BookignPageState();
}

class _BookignPageState extends State<BookignPage> {
  //Declaration
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

//get token for inserting booking date and time in database
  String? token;
  Future<void> getToken() async {
    //get token from sharedpreferences as sharedpreferences stores the token (code in dioprovider)
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: 'Book your Appointment',
        icon: const FaIcon(Icons.arrow_back),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                _tableCalendar(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
                  child: Center(
                    child: Text('Choose a Consultation Time',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )),
                  ),
                )
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Weekend is not avaiable. Please choose another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          //when selected, update current index and set time selected to true
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? Config.primaryColor
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 80),
              child: Button(
                width: double.infinity,
                title: "Make an Appointment",
                onPressed: () async {
                  //converting date/day/time to string
                  final getDate = DateConverter.getDate(_currentDay);
                  final getDay = DateConverter.getDay(_currentDay.weekday);
                  final getTime = DateConverter.getTime(_currentIndex!);
                  //posting the data using http
                  final url = Config.localHost + '/api/book/';
                  final headers = {'Authorization': 'Bearer $token'};
                  final body = {
                    'date': getDate,
                    'day': getDay,
                    'time': getTime,
                    'doctor_id': doctor['doctor_id'].toString(),
                  };
                  final response = await http.post(Uri.parse(url),
                      headers: headers, body: body);
                  if (response.statusCode == 200) {
                    // Successful booking
                    MyApp.navigatorKey.currentState!
                        .pushNamed('success_booking');
                  } else if (response.statusCode == 400) {
                    // if the time slot already booked
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Sorry!'),
                        content: const Text(
                            'This time slot is already booked. Please choose another time slot.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text(
                            'An error occurred while making the appointment. Please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                disable: _timeSelected && _dateSelected ? false : true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
          todayDecoration: BoxDecoration(
              color: Config.primaryColor, shape: BoxShape.circle)),
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onFormatChanged: (format) => {
        setState(() {
          _format = format;
        })
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;

//  for making saturday as day off
//           if (selectedDay.weekday == 6) {
//             _isWeekend = true;
//             _timeSelected = false;
//             _currentIndex = null;
//           } else {
//             _isWeekend = false;
//           }
//         });
//       }),
//     );
//   }
// }
        });
      }),
    );
  }
}
