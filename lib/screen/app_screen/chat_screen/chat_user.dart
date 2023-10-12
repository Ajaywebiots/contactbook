class ChatUser {
  ChatUser({
    required this.number,
    required this.name,
    required this.deviceId,
    required this.fcmToken,
  });
  late final String number;
  late final String name;
  late final String deviceId;
  late final String fcmToken;

  ChatUser.fromJson(Map<String, dynamic> json){
    number = json['number'];
    name = json['name'];
    deviceId = json['deviceId'];
    fcmToken = json['fcmToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['deviceId'] = deviceId;
    data['fcmToken'] = fcmToken;
    return data;
  }
}