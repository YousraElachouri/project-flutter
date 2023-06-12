import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/db_serviceFB.dart';

class ContactPageFB extends StatefulWidget {
  const ContactPageFB({Key? key}) : super(key: key);

  @override
  State<ContactPageFB> createState() => _ContactPageFBState();
}

class _ContactPageFBState extends State<ContactPageFB> {
  DBServiceFB dbService = DBServiceFB();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CRUD Contact"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child:FormHelper.submitButton(
                "Ajout",
                () {

                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/addeditcontact');
                },
                borderRadius: 10,
                btnColor: Colors.lightBlue,
                borderColor: Colors.lightBlue,
              ),
              ),
              const SizedBox(
                height: 10,
              ),
              _fetchData(),
            ],
          ),
        ));
  }

   _fetchData() {

      WidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp();
   // await Firebase.initializeApp();
     return StreamBuilder<QuerySnapshot>(
       stream: FirebaseFirestore.instance.collection('contact').snapshots(),
       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         if (snapshot.hasError) {
           return const Text('Something went wrong');
         }

         if (snapshot.connectionState == ConnectionState.waiting) {
           return const Center(
             child: Text("Loading"),
           );
         }

         return Column(
           children: snapshot.data!.docs.map((DocumentSnapshot document) {
             Map<String, dynamic> contact =
             document.data()! as Map<String, dynamic>;
             return Padding(
               padding: const EdgeInsets.all(10),
               child: Row(
                 children: [

                   SizedBox(
                     height: 50,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             contact['nom'],
                             style: const TextStyle(
                                 fontSize: 18, fontWeight: FontWeight.bold),
                           ),

                           Text(contact['tel']),



                         ],

                       ),

                     ),
                   ),
                 ],
               ),
             );
           }).toList(),
         );
       },
     );
   }

}
