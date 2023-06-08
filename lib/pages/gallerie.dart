import 'package:flutter/material.dart';
class GalleriePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallerie'),backgroundColor: Colors.amberAccent,),
      body: Center(child: Text('Gallerie d\'images',style: TextStyle(fontSize: 22),)),
    );
  }
}