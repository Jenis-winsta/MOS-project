import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({super.key});

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  late String name;
  Future getName(String email) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;

    await firestore
        .collection('user')
        .doc(email)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot.get('Name');
        print('Name: $name');
      } else {
        print('Document does not exist!');
      }
    }).catchError((error) {
      print('Error getting document: $error');
    });
    // return name;
  }

  /*final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  Future<String?> getName(String email) async {
    try {
      await _userCollection.doc(email).get().then((value) {
        name = value.data().get('Name').toString();
      });
      return name; // return the nullable variable
    } catch (e) {
      print(e);
      return null; // return null if there's an error
    }
  }*/

  

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // getName(user!.email!);
    return Container(
      color: Colors.purple[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 70,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: const DecorationImage(
                  // image: AssetImage('assets/girl.png'),
                  image: AssetImage('assets/user.png'),
                  // image: AssetImage('assets/male.jpg'),
                  fit: BoxFit.scaleDown)),
        ),
        /*
        FutureBuilder(
          future: getName(user!.email!),
          builder: (context,snapshot){
            return Text(name,style: TextStyle(color: Colors.grey[200], fontSize: 14));
          }
        ),*/
        
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            return FutureBuilder(
              future: getName(user!.email!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('Loading...',style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14,
                    ));
                  } else {
                    return Text(name,style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 16,
                    ));
                  }
                /*if (snapshot.hasData && snapshot.data != '') {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14,
                    ),
                  );
                } else {
                  return Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 14,
                    ),
                  );
                }*/
              },
            );
          }
        ),
        Text(user!.email!,
            style: TextStyle(color: Colors.grey[200], fontSize: 14)),
      ]),
    );
  }
}
