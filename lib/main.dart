import 'package:flutter/material.dart';

import 'package:signup_login2/screens/sign_up.dart';
import 'package:signup_login2/screens/login_up.dart';

import 'screens/home.dart';


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
      home: SignUP(),
    );
  }
}

