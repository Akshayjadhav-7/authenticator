import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signup_login2/Screens/Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('images/login.png'),
                Text(
                  'Login',
                  style: GoogleFonts.lato(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'UserName',
                        hintText: '👤  Enter Username',
                        hintStyle: GoogleFonts.lato(fontSize: 14.0, color: Colors.black38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: '🔑  Enter Password',
                        hintStyle: GoogleFonts.lato(fontSize: 14.0, color: Colors.black38),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 350,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()),);

                    },
                    child: Text(
                      'Login',
                      style:  GoogleFonts.lato(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
