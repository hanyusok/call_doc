import 'package:cloud_firestore/cloud_firestore.dart';

class CallDetail {
  late String id;
  late String sender;
  late String memo;
  late String startTime;
  late String isRegistered;
  late String hasPayed;
  late String notifiedCost;
  late String phone;
  late String isPending;
  late String hasFinished;
  late String endTime;

  CallDetail({
    required this.id,
    required this.sender,
    required this.memo,
    required this.startTime,
    required this.isRegistered,
    required this.hasPayed,
    required this.notifiedCost,
    required this.phone,
    required this.isPending,
    required this.hasFinished,
    required this.endTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'memo': memo,
      'startTime': startTime,
      'isRegistered': isRegistered,
      'hasPayed': hasPayed,
      'notifiedCost': notifiedCost,
      'phone': phone,
      'isPending': isPending,
      'hasFinished': hasFinished,
      'endTime': endTime,
    };
  }

  fromMap(Map<String, dynamic> map) {
    id = (map as QueryDocumentSnapshot).id;
    sender = map['sender'];
    memo = map['memo'];
    startTime = map['startTime'];
    isRegistered = map['isRegistered'];
    hasPayed = map['hasPayed'];
    notifiedCost = map['notifiedCost'];
    phone = map['phone'];
    isPending = map['isPending'];
    hasFinished = map['hasFinished'];
    endTime = map['endTime'];
  }
}
