import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:signup_login2/config/config.dart';
import './sign_up.dart';
import './home.dart';


TextEditingController userController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginAlbum {
  final String email;
  final String password;

  LoginAlbum({required this.email, required this.password});

  factory LoginAlbum.fromJson(Map<String, dynamic> json) {
    return LoginAlbum(email: json['email'], password: json['password']);
  }
}

Future<LoginAlbum> postLoginData({required String email, required String password}) async {
  var response = await http.post(Uri.parse('$url/read'), body: {
    'email': email,
    'password': password,
  });
  print(response.body);
  return LoginAlbum.fromJson(
    jsonDecode(response.body),
  );
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Form(
                  key: _formKey,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.height * 0.4,
                          height: MediaQuery.of(context).size.height * 0.4,
                          child: Image.asset('images/login.png')),
                      Text(
                        'Login',
                        style: GoogleFonts.lato(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: TextFormField(
                          controller: userController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username can not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'UserName',
                              hintText: '👤  Enter Username',
                              hintStyle: GoogleFonts.lato(
                                  fontSize: 14.0, color: Colors.black38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.4,
                        child: TextFormField(
                          controller: passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "password can not be empty";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: '🔑  Enter Password',
                              hintStyle: GoogleFonts.lato(
                                  fontSize: 14.0, color: Colors.black38),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.height * 0.4,
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () {
                              postLoginData(
                                  email: emailController.text,
                                  password: passwordController.text);
                              var abcd = _formKey.currentState!.validate();
                              print('aaaaaaaaaa$abcd');
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostDirect()),
                                );

                                print('999999999999999');
                              } else {
                                print('22222222222222');
                              }
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.lato(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
