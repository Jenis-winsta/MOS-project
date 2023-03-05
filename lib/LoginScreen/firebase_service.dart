import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

   Future<String> getName(String email) async {
    String name = '';

    try {
      DocumentSnapshot documentSnapshot = await firestore.collection('user').doc(email).get();
      if (documentSnapshot.exists) {
        name = documentSnapshot.get('name');
      }
    } catch (e) {
      print('Error retrieving name: $e');
    }

    return name;
  }
}
