import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String id;
  String name;
  String phone;
  String email;
  String bookedBike;

  UserData(this.id, this.name, this.phone, this.email, this.bookedBike);

  UserData.fromFirebase(DocumentSnapshot doc) {
    this.id = doc.id;
    this.name = (doc.data() as dynamic)["name"];
    this.phone = (doc.data() as dynamic)["phone"];
    this.email = (doc.data() as dynamic)["email"];
    this.bookedBike = (doc.data() as dynamic)["booked_bike"];
  }
}
