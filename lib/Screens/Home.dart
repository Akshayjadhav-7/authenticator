import 'package:flutter/material.dart';
import 'package:signup_login2/Screens/sign_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Authenticator'),
          actions: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Text('Hi Akshay'),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.account_circle,
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('User Name 1'),
                    subtitle: Text("Emial akshay@gmail.com"),
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('User Name 2'),
                    subtitle: Text("Emial akshay@gmail.com"),
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('User Name 3'),
                    subtitle: Text("Emial akshay@gmail.com"),
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('User Name 4'),
                    subtitle: Text("Emial akshay@gmail.com"),
                  ),
                  Divider(
                    height: 1,
                    indent: 20,
                    endIndent: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUP()),
                          );
                        },
                        child: Text('SignUp'),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
