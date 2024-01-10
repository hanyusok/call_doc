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
}
