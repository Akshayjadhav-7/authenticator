import 'dart:convert';
import 'dart:ffi';
import 'package:signup_login2/Screens/login_up.dart';
import 'package:flutter/material.dart';
import 'package:signup_login2/Screens/sign_up.dart';
import 'package:http/http.dart' as http;
import 'package:signup_login2/Widget/ListTile.dart';

var realData;
// List<User> data = [];

class Person {
  final String name;
  final String email;
  final int id;

  Person({
    required this.name,
    required this.email,
    required this.id,
  });
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }
}

class User {


  final List<Person> users;
  // final String name;
  // final String email;
  // final int id;

  User({required this.users});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // name: json['users']['name'],
      // email: json['users']['email'],
      // id: json['users']['id'],
      // required this.name, required this.email, required this.id,
      users: json['users'],
    );
  }
}

Future<void> displayData() async {
  print('Inside display dataaaaaaaaaa');

//   List<String> tags = tagsJson != null ? List.from(tagsJson) : null;
// List<Person> persons =

  var display = await http.get(
    Uri.parse('http://10.0.2.2:8888/list'),
  );
  print('displayyyyyyyyyyyyy $display');
  if (display.statusCode != 200) {
    throw Exception('Failed to load album');
  }
  print("display Data: ${display.body}");

  // data.add(
  //   User.fromJson(
  //     jsonDecode(display.body),
  //   ),
  // );
 var personJson =  jsonDecode(display.body)['users'];


 print("personJson:$personJson");

 if(personJson!= null){

   print("person jason in noyt null");
 }
  List<Person>? persons = List.from(personJson);
 print('\n\n\n\n\nprintinGGGGGGGGGGGG');
  print('\n\n\n\npersonsss:$persons');
  // return Person.fromJson(
  //
  // );

  //   User.fromJson(
  //   jsonDecode(display.body),
  // );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<void> futureData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // postSignupData(name:'akshay' ,email: 'akshay@gmail.com', password: 'akshayyyyy' ,);
    // postLoginData();
    futureData = displayData();
    print("futureData: $futureData");
  }

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
                child: FutureBuilder(
                    future: futureData,
                    builder: (context, i) {
                      // print("data>lenght:${data.length}");
                      print("data>futuredata:${futureData}");

                      if (!i.hasData) {
                        // return Center(child: CircularProgressIndicator());
                        print("iiiiiii: ${i.hasData}");
                      }
                      return Center(child: CircularProgressIndicator());
                      // return Column(
                      //   children: [
                      //     ListView.builder(
                      //         primary: false,
                      //         shrinkWrap: true,
                      //         itemCount: data.length,
                      //         itemBuilder: (context, i) {
                      //           // for (i = 0; i <= data.length; i++) {
                      //           //
                      //           // }
                      //           print("data 111: ${data.length}");
                      //           return  Container(
                      //             child: TileData(
                      //               name: "${data[i].name}",
                      //               email: "${data[i].email}",
                      //               id: data[i].id,
                      //             ),
                      //           );
                      //           //   TileData(
                      //           //   name: "${data[i].name}",
                      //           //   email: "${data[i].email}",
                      //           //   id: data[i].id,
                      //           // );
                      //         })
                      //   ],
                      // );
                    })),
          ),
        ),
      ),
    );
  }
}

// class ListTile{
//
//   final String name;
//   final String email;
//   final int id;
//
//   ListTile({
//     required this.name,
//     required this.email,
//     required this.id
// })
//
//
// }
