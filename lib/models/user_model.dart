class UserModel {
  final String address;
  final Map foodList;
  final String name;
  final String uid;
  final String status;
  final String total;

  UserModel({
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

  factory UserModel.fromMap(Map<dynamic, dynamic> mapData) {
    return UserModel(
      address: mapData['address'],
      foodList: mapData['foodList'],
      name: mapData['name'],
      uid: mapData['uid'],
      status: mapData['status'],
      total: mapData['total'],
    );
  }
}
