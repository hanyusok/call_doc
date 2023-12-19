class CallDetail {
  final String id;
  final String sender;
  final String memo;
  final String startTime;
  final String isRegistered;
  final String hasPayed;
  final String notifiedCost;
  final String phone;
  final String isPending;
  final String hasFinished;
  final String endTime;

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
    'id': id,
  }
}
