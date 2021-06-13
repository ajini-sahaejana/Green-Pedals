import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection ref
  final CollectionReference user_collection =
      FirebaseFirestore.instance.collection('user_details');

  Future updateUserData(
      String id, String name, String email, String phone) async {
    return await user_collection.doc(uid).set({
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  //get user Stream
  Stream<QuerySnapshot> get user_details {}
}
