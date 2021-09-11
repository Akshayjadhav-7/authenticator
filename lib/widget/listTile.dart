import 'package:flutter/material.dart';


class TileData extends StatelessWidget {
  final String name;
  final String email;
  final int id;
  
  TileData({
    
    required this.name,
    required this.email,
    required this.id,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(name),
        subtitle: Text(email),
        trailing: Text("ID: ${id.toString()}"),
      ),
    );
  }
}
