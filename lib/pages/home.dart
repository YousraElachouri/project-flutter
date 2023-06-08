import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/drawer.dart';
class HomePage extends StatelessWidget {
  late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Page Home')),
    drawer: MyDrawer(),
    body: Center(
    child: Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
    children: [
    ...(MyDrawer.accueil as List).map((item) {
      return InkWell(
        child: Ink.image(
          height: 150,
          width: 150,
          image: item['image'],
    ),
      onTap: () {
        if ('${item['image']}' !=
            AssetImage("images/deconnexion.png"))
          Navigator.pushNamed(context, "${item['route']}");
        else
          _Deconnexion(context);
      },
    );
    }),
    ],
    ),
    )
    );
  }
  Future<void> _Deconnexion(context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool("connecte", false);
    Navigator.of(context).pushNamedAndRemoveUntil('/authentification',
            (Route<dynamic> route) => false);
  }
}