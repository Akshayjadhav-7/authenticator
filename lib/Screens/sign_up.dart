import 'package:flutter/material.dart';
import 'package:signup_login2/Screens/Home.dart';
import 'package:signup_login2/Screens/login_up.dart';
import 'package:google_fonts/google_fonts.dart';

// final _formKey = GlobalKey<FormState>();
class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  var _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
            },
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 20,
            ),
          ),
          title: Text(
            'Sign up',
            style: GoogleFonts.lato(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              child: Form(
                key: _formkey2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'images/signup2.png',
                        width: MediaQuery.of(context).size.height * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name can not be empty";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          // prefix: Icon(Icons.account_circle,size: 20,),
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  // color: Colors.deepPurple,width: 5,
                                  )),
                          hintText: '👤   Akshay',
                          hintStyle: GoogleFonts.lato(
                              fontSize: 14.0, color: Colors.black38),
                          // TextStyle(fontSize: 14.0, color: Colors.black38),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          String pattern = r'\w+@\w+\.\w+';
                          RegExp regexp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return "Emial can not be empty";
                          } else if (!regexp.hasMatch(value)) {
                            return "Email format is not valid try, Ex- abcd@gmail.com";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: '@  akshay@gmail.com',
                            hintStyle: GoogleFonts.lato(
                                fontSize: 14.0, color: Colors.black38),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    // color: Colors.orangeAccent,width: 5
                                    ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.height * 0.4,
                      child: TextFormField(
                        validator: (value) {
                          String pattern1 = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          RegExp regexp =  RegExp(pattern1);

                          if (value!.isEmpty) {
                            return "Password can not be empty";
                          } else if (!regexp.hasMatch(pattern1)) {
                            return "Try atlease 1 Uppercase, 1 Lowercase, 1 number, 1 Special character, ";
                          }
                            return null;

                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: '🔑   Choose strong password',
                            hintStyle: GoogleFonts.lato(
                                fontSize: 14.0, color: Colors.black38),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    // color: Colors.orangeAccent,width: 5
                                    ))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.4,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey2.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          } else {
                            print('falseeeeee');
                          }
                        },
                        child: Text(
                          'Create Account',
                          style: GoogleFonts.lato(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Already have an Account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: Text('Login'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
