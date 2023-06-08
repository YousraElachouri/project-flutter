import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthenticationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController _userName = TextEditingController();
  TextEditingController _passWord = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Authentification'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userName,
              decoration: InputDecoration(
                labelText: 'nom d\'utilisateur',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passWord,
              decoration: InputDecoration(
                 labelText: 'Mot de passe',
                 prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _onAuthentifier(context);
              },
              child: Text('Connexion'),
            ),
            SizedBox(height: 10.0),
            TextButton(
              child:Text("Nouvel utilisateur",
                  style: TextStyle(fontSize: 22)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/inscription');

              },

            )
          ],
        ),
      ),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async{
    prefs = await SharedPreferences.getInstance();

    String? log = prefs.getString("login");
    String pws = prefs.getString("password") ?? '';
    if (_userName.text == log && _passWord.text == pws) {
      prefs.setBool('connect', true);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');

    }
    else {
      const snackBar = SnackBar(content: Text('Id ou mot de passe incorrectes'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}


