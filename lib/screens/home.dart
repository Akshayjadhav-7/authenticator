import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:signup_login2/config/config.dart';
import 'package:signup_login2/widget/listTile.dart';

class Person {
  final int id;
  final String name;
  final String email;

  Person({required this.id, required this.name, required this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
List<Person> personList = [];
Future<List<Person>> apiCall() async {
  print('api call function called');

  var display = await http.get(
    Uri.parse('$url/list'),
  );
  // below line is basically your response.body
  // String response = '{"users": [{"id": 0,"name":"parikshit","email":"parikshit@gmail.com",'
  //     '"password":"1234"},{"id": 1,"name": "Akshay","email": "akshay@gmail.com","password": "1234"}]}';

  // below 2 lines 28 and 29 are the main thing here...
  var usersJson = jsonDecode(display.body)['users'] as List;
  print("usersJson: $usersJson");
   personList =
      usersJson.map((personJson) => Person.fromJson(personJson)).toList();

  print("persons:$personList");
  print("persons:${personList.length}");

  return personList;
}

class PostDirect extends StatefulWidget {
  const PostDirect({Key? key}) : super(key: key);

  @override
  _PostDirectState createState() => _PostDirectState();
}

class _PostDirectState extends State<PostDirect> {
   late Future<List<Person>> peoples;

  @override
  void initState() {
    super.initState();
    peoples = apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('POST'),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<List<Person>>(
            future: peoples,
            builder: (context, i) {
              print("iiiiiii 71:$i");

              if (!i.hasData) {
                // print("data>lenght:${persons.length}");
                return Center(child: CircularProgressIndicator());
              }
             print("persons 76 :${peoples.toString()}");
             return ListView.builder(
                      primary: false,
                      itemCount: personList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, j) {
                        print(personList.toString());
                        print(personList[j].name);
                        return TileData(name: personList[j].name, email: personList[j].email, id: personList[j].id);
                      });

            },
          ),
        ),
      ),
    );
  }
}
