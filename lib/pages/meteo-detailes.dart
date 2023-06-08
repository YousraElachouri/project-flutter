import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class MeteoDetailsPage extends StatefulWidget {
  String city;
  MeteoDetailsPage(this.city);
@override
_MeteoDetailsPageState createState() => _MeteoDetailsPageState();
}
class _MeteoDetailsPageState extends State<MeteoDetailsPage> {
  late List<dynamic> meteodata;
  getData(url){
    http.get(
        Uri.parse(url)).then((resp){
         setState((){
         meteodata=json.decode(resp.body)['list'];
      });
    }).catchError((err){
      print(err);
    });}
  @override
  void initState() {
    super.initState();
    String
    url='http://openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=e1eaa3672347b381e3abb1e05c5b1b24';
    print(url);
    this.getData(url);
  }

  @override
  Widget build(BuildContext context) {
    String url='http://openweathermap.org/data/2.5/forecast?q=${this.widget.city}&appid=e1eaa3672347b381e3abb1e05c5b1b24';
    List<String> listData = getData(url);
    return Scaffold(
        appBar: AppBar(title: Text('${widget.city}'),
          backgroundColor: Colors.orange,),
        body:
        (meteodata==null)?
        Center(
            child: CircularProgressIndicator()):
        ListView.builder(
            itemCount: meteodata==null?0:meteodata.length,
            itemBuilder: (context,index){
          return Card(
              color: Colors.deepOrangeAccent,
              child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Row(
                         children: <Widget>[ CircleAvatar(
                         backgroundImage: AssetImage('images/${meteodata[index]['weather'][0]['main'].toLowerCase()}.png'),
                         ),
                         Padding(
                          padding: const EdgeInsets.only(left: 10), child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${DateFormat('E dd/MM/yyyy').
                                 format(DateTime.fromMicrosecondsSinceEpoch(
                                   meteodata[index]['dt']*1000000))}",
                                   style: TextStyle(fontSize: 16,color: Colors.white,fontWeight:FontWeight.bold)),
                            Text("${new DateFormat('HH:mm').
                              format(DateTime.fromMicrosecondsSinceEpoch(
                                   meteodata[index]['dt']*1000000))} ${meteodata[index]['weather'][0]['main']}",
                                   style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold)),
          ],
          ),
          ),
          ],
          ),
                    Text("${meteodata[index]['main']['temp'].round()} °C", style: TextStyle(fontSize: 20,color: Colors.white,fontWeight:FontWeight.bold),),
          ],
          ),
          ),
          );
      })
    );
  }

}



