import 'package:connexion/pages/authentication.dart';
import 'package:connexion/pages/contact.dart';
import 'package:connexion/pages/gallerie.dart';
import 'package:connexion/pages/home.dart';
import 'package:connexion/pages/inscription.dart';
import 'package:connexion/pages/meteo.dart';
import 'package:connexion/pages/parametre.dart';
import 'package:connexion/pages/pays.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() =>  runApp(MyApp());


class MyApp extends StatelessWidget {
  final  root = {
  '/home':(contex)=> HomePage(),
  '/inscription':(contex)=> InscriptionPage(),
  '/authentification':(context)=>AuthenticationPage(),
  '/meteo':(context)=>MeteoPage(),
  '/gallerie':(context)=>GalleriePage(),
  '/contact':(context)=>ContactPage(),
  '/pays':(context)=>PaysPage(),
  '/parametres':(context)=>ParametrePage(),
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var x=prefs.data;
          if(prefs.hasData){
            bool conn=x?.getBool("connect")?? false;
            if (conn){
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                routes:root,
                home:HomePage(),);
            }}

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes:root,
            home:AuthenticationPage(),
          );
        });

  }
}


