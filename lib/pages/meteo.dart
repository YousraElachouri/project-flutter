import 'package:connexion/pages/meteo-detailes.dart';
import 'package:flutter/material.dart';
class MeteoPage extends StatelessWidget {

  String ? city;
  TextEditingController cityController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'), backgroundColor: Colors.deepOrangeAccent,),
      body: Column(
        children: <Widget>[ Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Ville',
                  prefixIcon: Icon(Icons.location_city),
              ),
                  controller: cityController,

            ),
          ),
        ),
          Container(
            width: double.infinity, padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Météo'),

              onPressed: () {
                _onGetMeteoDetails(context);
              },

            ),
          )
        ],
      ),
    );
  }

  Future<void> _onGetMeteoDetails(BuildContext context) async {
    if (!cityController.text.isEmpty) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => MeteoDetailsPage(cityController.text),
    ));
    }
    else {
      const snackBar = SnackBar(content: Text('Id ou mot de passe vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}