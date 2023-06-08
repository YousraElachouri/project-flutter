import 'package:flutter/material.dart';
class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact'),backgroundColor: Colors.amberAccent,),
      body: Center(child: Text('Contactez-Nous',style: TextStyle(fontSize: 22),)),
    );
  }
}