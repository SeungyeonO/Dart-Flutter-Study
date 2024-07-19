Future<Map<String, String>> Login() {
  return Future.delayed(Duration(seconds: 2))
      .then((value) => {'id': 'dart', 'token': 'sldkfjg'});
}

Future<Map<String, String>> ShowUserInfo(String? id) {
  //DB에서 주어진 id에 해당하는 사용자 정보 받기
  Map<String, String> userInfo = {'id': 'none', 'iname': 'none'};
  return Future.delayed(Duration(seconds: 1)).then(
    (value) => userInfo,
  );
}

Future<List<String>> ShowNotificationList(String? id) {
  //DB에서 주어진 id에 해당하는 알림 목록 받기
  List<String> NotificationList = ['a', 'b', 'c'];
  return Future.delayed(Duration(milliseconds: 1500))
      .then((value) => NotificationList);
}

void main() {
  Login().then((value) {
    print(value);
    ShowUserInfo(value['id']).then((v) => print(v));
    ShowNotificationList(value['id']).then((v) => print(v));
  });
}
