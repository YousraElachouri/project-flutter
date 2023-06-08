import 'package:connexion/pages/meteo-detailes.dart';
import 'package:flutter/material.dart';
class MeteoPage extends StatelessWidget {

  String ? city;
  TextEditingController txt_ville = new TextEditingController();

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
                  controller: txt_ville,

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


  void _onGetMeteoDetails(BuildContext context) {
    String v=txt_ville.text;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MeteoDetailsPage(v)));
    txt_ville.text = "";
  }

}