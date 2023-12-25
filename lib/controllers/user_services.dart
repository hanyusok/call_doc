import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  User? user = FirebaseAuth.instance.currentUser;

  // Future addNewUser(String name, String phone, String birhtdate) async {
  //   Map<String, dynamic> data = {
  //     "name": name,
  //     "phone": phone,
  //     "birthdate": birhtdate
  //   };
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user!.uid)
  //         .collection("Users")
  //         .add(data);
  //     log("Document added");
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  Stream<QuerySnapshot> getUsers() async* {
    var users = FirebaseFirestore.instance.collection("users").snapshots();
    yield* users;
  }

  Future updateUser(
      String name, String address, String phone, String birthdate) async {
    Map<String, dynamic> data = {
      "name": name,
      "address": address,
      "phone": phone,
      "birthdate": birthdate
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .update(data);
      log("Document(User) Updated");
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteUser(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .delete();
      log("User deleted");
    } catch (e) {
      log(e.toString());
    }
  }
}
