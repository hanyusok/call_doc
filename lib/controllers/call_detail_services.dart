import 'dart:developer';

import 'package:call_doc/models/call_detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CallDetailService {
  User? user = FirebaseAuth.instance.currentUser;
  late CallDetail _callDetail;

  Future addNewCallDetail(callDetail) async {
    final data = _callDetail.toMap();

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("calldetails")
          .add(data);
      log("Document added");
    } catch (e) {
      log(e.toString());
    }
  }

  Stream<QuerySnapshot> getCallDetails() async* {
    var callDetailQuery = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("calldetails")
        .orderBy("name");

    // if (searchQuery != null && searchQuery.isNotEmpty) {
    //   String searchEnd = '$searchQuery\uf8ff';
    //   customerQuery = customerQuery.where("name",
    //       isGreaterThanOrEqualTo: searchQuery, isEqualTo: searchEnd);
    // }
    var callDetails = callDetailQuery.snapshots();
    yield* callDetails;
  }

  // Future updateCallDetail(
  //     String name, String phone, String birthdate, String docID) async {
  //    final data = _callDetail.toMap();
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user!.uid)
  //         .collection("calldetails")
  //         .doc(docID)
  //         .update(data);
  //     log("Document Updated");
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // Future deleteCallDetail(String docID) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection("users")
  //         .doc(user!.uid)
  //         .collection("calldetails")
  //         .doc(docID)
  //         .delete();
  //     log("Customer deleted");
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}
