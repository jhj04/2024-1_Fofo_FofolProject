import 'package:flutter/material.dart';
import 'package:fofo_app/screens/setting.dart';
import 'screens/signup.dart';
import 'screens/signin.dart';

void main() {
  //initializeDateFormatting().then((_) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fofol',
      // home : Signup(),
      home: LoginScreen(),
    );
  }
}
