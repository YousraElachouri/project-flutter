import 'package:flutter/material.dart';
class ParametrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres'),backgroundColor: Colors.amberAccent,),
      body: Center(child: Text('Paramètres',style: TextStyle(fontSize: 22),)),
    );
  }
}