import 'package:connexion/config/globalparams.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyDrawer extends StatelessWidget {
  static List<Map<String,dynamic>> accueil=[
  {"image":AssetImage("images/meteo.jpg"),"route":"/meteo"},
  {"image":AssetImage("images/gallerie.jpg"),"route":"/gallerie"},
  {"image":AssetImage("images/pays.jpg"),"route":"/pays"},
  {"image":AssetImage("images/contact.jpg"),"route":"/contact"},
  {"image":AssetImage("images/parametre.jpg"),"route":"/parametres"},
  {"image":AssetImage("images/deconnexion.png"),"route":"/authentication"},
];

late SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(
              gradient:LinearGradient(colors:[Colors.white,Colors.blue])
           ),
            child: Center(
              child: CircleAvatar(
            backgroundImage: AssetImage('images/av2.jpg'),
            radius: 80,
            )
    ),
    ),
    ...(GlobalParams.menus as List).map((item){
    return ListTile(
    title: Text('${item['title']}', style: TextStyle(fontSize:
    22),),
    leading: item['icon'],
    trailing: Icon(Icons.arrow_right,color:Colors.blue,),
    onTap: () async{
    if('${item['title']}'!="Déconnexion") {
    Navigator.of(context).pop();
    Navigator.pushNamed(context, "${item['route']}");
    }
    else
    {
      prefs = await SharedPreferences.getInstance();
      prefs.setBool("connecte", false);

      Navigator.of(context).pushNamedAndRemoveUntil('/authentification',
              (Route<dynamic> route) => false);
    }
    },
    );
    })
        ],
      ));
  }
}

