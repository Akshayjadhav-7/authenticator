import 'package:flutter/material.dart';
import 'package:signup_login2/Screens/Home.dart';
import 'package:signup_login2/Screens/login_up.dart';
import 'package:google_fonts/google_fonts.dart';

final _formKey = GlobalKey<FormState>();
class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
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
            child: Form(
              key: _formKey,
              autovalidate: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'images/signup2.png',
                      width: 300,
                      height: 300,
                    ),
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
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
                        hintStyle: GoogleFonts.lato(fontSize: 14.0, color: Colors.black38),
                            // TextStyle(fontSize: 14.0, color: Colors.black38),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 350,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name can not be empty";
                        }
                        return null;
                      },

                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: '@  akshay@gmail.com',

                          hintStyle: GoogleFonts.lato(fontSize: 14.0, color: Colors.black38),
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
                    width: 350,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "Name can not be empty";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: '🔑   Choose strong password',
                          hintStyle: GoogleFonts.lato(fontSize: 14.0, color: Colors.black38),
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
                    height: 55,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          print('success');
                        }else{
                          print('error');
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.lato(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
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
    );
  }
}
