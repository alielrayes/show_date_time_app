// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import "dart:async";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DateApp(),
    );
  }
}

class DateApp extends StatefulWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  State<DateApp> createState() => _DateAppState();
}

class _DateAppState extends State<DateApp> {
  // Time
  int hour = 0;
  String min = "";
  String sec = "";
  // Dates
  String year = "";
  String month = "";
  String dayNumber = "";
  String dayweek = "";

  changeEverySec() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        // Time
        hour = DateTime.now().hour;
        if (hour > 12) {
          hour = hour - 12;
        }
        min = DateTime.now().minute.toString();
        sec = DateTime.now().second.toString();

        // Dates
        year = DateTime.now().year.toString();
        month = DateTime.now().month.toString();
        switch (month) {
          case "1":
            month = "January";
            break;

          case "2":
            month = "Feb";
            break;

          case "3":
            month = "March";
            break;
        }

        dayNumber = DateTime.now().day.toString();
        dayweek = DateTime.now().weekday.toString();
        switch (dayweek) {
          case "1":
            dayweek = "monday";
            break;

          case "2":
            dayweek = "thursday";
            break;

          case "3":
            dayweek = "wednesday";
            break;
        }
      });
    });
  }

  String qqq = "";
  calledOnlyOneTimeAfter7Sec() {
    Timer(Duration(seconds: 10), () {
      setState(() {
        qqq = "😍😍😍😍";
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeEverySec();
    calledOnlyOneTimeAfter7Sec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Time & Date App",
          style: TextStyle(
            fontSize: 27,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      backgroundColor: Color.fromARGB(255, 33, 40, 43),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $dayweek   ",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "$month $dayNumber, $year",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              "${hour.toString().padLeft(2, "0")} : ${min.padLeft(2, "0")} : ${sec.padLeft(2, "0")}",
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
            SizedBox(
              height: 22,
            ),
            Text(
              qqq,
              style: TextStyle(fontSize: 27, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
