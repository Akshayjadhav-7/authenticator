import 'package:flutter/material.dart';
import 'package:signup_login2/Screens/Home.dart';
import 'package:signup_login2/Screens/sign_up.dart';
import 'package:signup_login2/Screens/login_up.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      primaryColor: Colors.black,
      ),
      home: Home(),
    );
  }
}

