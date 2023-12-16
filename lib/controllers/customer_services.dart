import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerService {
  User? user = FirebaseAuth.instance.currentUser;

  Future addNewCustomer(String name, String phone, String birhtdate) async {
    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "birthdate": birhtdate
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("customers")
          .add(data);
      log("Document added");
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<QuerySnapshot> getCustomers({String? searchQuery}) async* {
    var customerQuery = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("customers")
        .orderBy("name");
    if (searchQuery != null && searchQuery.isNotEmpty) {
      String searchEnd = "$searchQuery\uf8ff";
      customerQuery = customerQuery.where("name",
          isGreaterThanOrEqualTo: searchQuery, isEqualTo: searchEnd);
    }
    final customers = customerQuery.snapshots();
    yield* customers;
  }

  Future updateCustomer(
      String name, String phone, String birthdate, String docID) async {
    Map<String, dynamic> data = {
      "name": name,
      "phone": phone,
      "birthdate": birthdate
    };
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("customers")
          .doc(docID)
          .update(data);
      log("Document Updated");
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteCustomer(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("customers")
          .doc(docID)
          .delete();
      log("Customer deleted");
    } catch (e) {
      log(e.toString());
    }
  }
}
