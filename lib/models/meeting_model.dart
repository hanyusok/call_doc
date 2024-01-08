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

  factory MeetingModel.fromMap(Map<dynamic, dynamic> mapData) {
    return MeetingModel(
      address: mapData['address'],
      foodList: mapData['foodList'],
      name: mapData['name'],
      uid: mapData['uid'],
      status: mapData['status'],
      total: mapData['total'],
    );
  }
}

/*  
meeting_model collection has member, progress inside
*/