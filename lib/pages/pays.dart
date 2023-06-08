import 'package:flutter/material.dart';
class PaysPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pays'),backgroundColor: Colors.amberAccent,),
      body: Center(child: Text('Pays',style: TextStyle(fontSize: 22),)),
    );
  }
}