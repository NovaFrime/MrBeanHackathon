import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future updateUserData(String fullname,String email,String phonenumber, num contributed, num earned, num premium) async {
    return await userCollection.doc(uid).set({
      'fullname': fullname,
      'email': email,
      'phonenumber': phonenumber,
      'contributed': contributed,
      'earned': earned,
      'premium': premium,
    });
  }
  // get user stream
  Stream<QuerySnapshot> get users {
    return userCollection.snapshots();
  }
}