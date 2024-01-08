import 'package:cloud_firestore/cloud_firestore.dart';

class MeetingModel {
  final String address;
  final Map foodList;
  final String name;
  final String uid;
  final String status;
  final String total;

  MeetingModel({
    required this.address,
    required this.foodList,
    required this.name,
    required this.uid,
    required this.status,
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'foodList': foodList,
      'name': name,
      'uid': uid,
      'status': status,
      'total': total,
    };
  }

  // fromMap(Map<String, dynamic> map) {
  //   address = map['address'];
  //   foodList = map['foodList'];
  //   name = map['name'];
  //   uid = map['uid'];
  //   status = map['status'];
  //   total = map['total'];
  // }
}
