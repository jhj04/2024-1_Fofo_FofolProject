import 'package:flutter/material.dart';
import 'package:fofo_app/setting.dart';
import 'package:fofo_app/mainpage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:fofo_app/activity_list.dart';


void main() {
  initializeDateFormatting().then((_) => runApp(const MyApp()));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fofol',
      // home : SignUp(),
      // home: LoginScreen(),
      // home: MainPage(),
      home : ActivityList(),
    );
  }
}
