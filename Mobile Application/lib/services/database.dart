import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:green_pedals/models/user.dart';
import 'package:oktoast/oktoast.dart';

class DatabaseService {
  final String uid;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseService({this.uid});
  //collection ref
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user_details');

  final CollectionReference docksCollection =
      FirebaseFirestore.instance.collection('docks');

  final CollectionReference bikesCollection =
      FirebaseFirestore.instance.collection('bikes');

  Future updateUserData(
      String id, String name, String email, String phone) async {
    return await userCollection.doc(uid).set({
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
    });
  }

  Future getBikeIdFromSlot(String dockId, String slotId) async {
    DocumentSnapshot currentSlot =
        await docksCollection.doc(dockId).collection("slots").doc(slotId).get();

    return (currentSlot.data() as dynamic)["current_bike_id"];
  }

  Future getSlotStatus(String dockId, String slotId) async {
    DocumentSnapshot currentSlot =
        await docksCollection.doc(dockId).collection("slots").doc(slotId).get();

    return (currentSlot.data() as dynamic)["status"];
  }

  Future removeBikeFromSlot(String dockId, String slotId) async {
    await docksCollection
        .doc(dockId)
        .collection("slots")
        .doc(slotId)
        .update({"current_bike_id": null, "status": "empty"});
  }

  Future addBikeToSlot(String dockId, String slotId, String bikeId) async {
    await docksCollection
        .doc(dockId)
        .collection("slots")
        .doc(slotId)
        .update({"current_bike_id": bikeId, "status": "available"});
  }

  Future removeBikeFromUserData() async {
    await userCollection
        .doc(_auth.currentUser.uid)
        .update({"booked_bike": null});
  }

  Future addBikeToUserData(String bikeId) async {
    await userCollection
        .doc(_auth.currentUser.uid)
        .update({"booked_bike": bikeId});
  }

  Future updateBikeRentData(String dockId, String slotId) async {
    DocumentSnapshot userData =
        await userCollection.doc(_auth.currentUser.uid).get();

    String bikeId = (userData.data() as dynamic)["booked_bike"];

    if (bikeId != null) {
      // if user has a bike currently
      await removeBikeFromUserData();
      await addBikeToSlot(dockId, slotId, bikeId);
      showToast("Bike returned successfuly!", position: ToastPosition.bottom);
    } else {
      //if user dont have one currently
      String bikeIdFromSlot = await getBikeIdFromSlot(dockId, slotId);
      if (bikeIdFromSlot != null) {
        await addBikeToUserData(bikeIdFromSlot);
        await removeBikeFromSlot(dockId, slotId);
        showToast("Bike rented successfuly!", position: ToastPosition.bottom);
      }
    }
  }

  //get user Stream
  Stream<UserData> userDetails() {
    return userCollection
        .doc(_auth.currentUser.uid)
        .snapshots()
        .map((event) => UserData.fromFirebase(event));
  }
}
