import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

Future<List<Person>> apiCall() async {
  print('api call function called');

  var display = await http.get(
    Uri.parse('http://10.0.2.2:8888/list'),
  );
  // below line is basically your response.body
  // String response = '{"users": [{"id": 0,"name":"parikshit","email":"parikshit@gmail.com",'
  //     '"password":"1234"},{"id": 1,"name": "Akshay","email": "akshay@gmail.com","password": "1234"}]}';

  // below 2 lines 28 and 29 are the main thing here...
  var usersJson = jsonDecode(display.body)['users'] as List;
  print("usersJson: $usersJson");
  List<Person> persons =
      usersJson.map((personJson) => Person.fromJson(personJson)).toList();

  print("persons:$persons");

  return persons;
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
          child: FutureBuilder(
            future: peoples,
            builder: (context, i) {


              if (!i.hasData) {
                // print("data>lenght:${persons.length}");
                return Center(child: CircularProgressIndicator());
              }
             print("persons 76 :${peoples.toString()}");
             return ListView.builder(
                      primary: false,
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, j) {
                        print(peoples.toString());
                        // print(peoples['email']);
                        return ListTile();
                      });

            },
          ),
        ),
      ),
    );
  }
}
