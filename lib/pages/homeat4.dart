import 'package:connexion/menu/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Page Home'),
      ),
      drawer:MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    CircleIcon(icon: Icons.cloudy_snowing),
                    SizedBox(width: 20),
                    CircleIcon(icon: Icons.photo_camera),
                  ]
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleIcon(icon: Icons.public),
                  SizedBox(width: 20),
                  CircleIcon(icon: Icons.person),
                ],
              ),
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleIcon(icon: Icons.settings),
                    SizedBox(width: 20),
                    CircleIcon(icon: Icons.logout),
                  ]
              ),
            ]
        ),
      ),

    );

  }

}
class CircleIcon extends StatelessWidget {
  final IconData icon;


  const CircleIcon({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blueAccent,
          ),
          child: Icon(
            icon,
            size: 80,
            color: Colors.black54,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}