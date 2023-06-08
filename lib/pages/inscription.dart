import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {

  late SharedPreferences prefs;

  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page Inscription'),
        ),
        body: Padding(
        padding: EdgeInsets.all(16.0),
         child: Column(
           children: [
             TextFormField(
              controller: _userName,
              decoration: InputDecoration(
              labelText: 'nom d\'utilisateur',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: Icon(Icons.person),
         ),
    ),
              SizedBox(height: 16.0),
              TextFormField(
                 controller: _passWord,
                 obscureText:true,
                 decoration: InputDecoration(
                 labelText: 'Mot de passe',
                 border: OutlineInputBorder(
                   borderSide: BorderSide(width: 1),
                   borderRadius: BorderRadius.circular(10),
                 ),
                 prefixIcon: Icon(Icons.lock),
    ),
    ),
             SizedBox(height: 16.0),
             ElevatedButton(
               onPressed: () {
                 _onInscrire(context);

               },
               child: Text('Inscription'),
             ),
             SizedBox(height: 16.0),
             TextButton(
               child:Text("J'ai déja un compte",
                   style: TextStyle(fontSize: 22)),
               onPressed: () {
                 Navigator.pop(context);
                 Navigator.pushNamed(context, '/authentification');

               },

             )

           ],
         ),
        ),
    );
  }

 Future<void> _onInscrire(BuildContext context) async {
   prefs=await SharedPreferences.getInstance();
   if(!_userName.text.isEmpty && !_passWord.text.isEmpty){
     prefs.setString("login", _userName.text);
     prefs.setString("password", _passWord.text);
     prefs.setBool('connect', true);
     Navigator.pop(context);
     Navigator.pushNamed(context, '/home');
   }
   else{
     const snackBar = SnackBar(content: Text('Id ou mot de passe vide'),
     );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);

   }

 }
}




