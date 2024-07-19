Future<Map<String, String>> login() async {
  await Future.delayed(Duration(seconds: 2));
  return {'id': 'dart', 'token': 'sldkfjg'};
}

Future<Map<String, String>> ShowUserInfo(String? id) async {
  //DB에서 주어진 id에 해당하는 사용자 정보 받기
  Map<String, String> userInfo = {'id': 'dart', 'name': 'flutter'};
  await Future.delayed(Duration(seconds: 1));
  return userInfo;
}

Future<List<String>> ShowNotificationList(String? id) async {
  //DB에서 주어진 id에 해당하는 알림 목록 받기
  List<String> NotificationList = ['a', 'b', 'c'];
  await Future.delayed(Duration(milliseconds: 1500));
  return NotificationList;
}

void main() async {
  var result = await login();
  print(result);

  ShowUserInfo(result['id']).then((value) => print(value));

  ShowNotificationList(result['id']).then((value) => print(value));
}
