import 'package:shared_preferences/shared_preferences.dart';

storeUserData(apiResponse) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  await storage.setString('token', apiResponse['access_token']);
  await storage.setString('username', apiResponse['data']['username']);
  await storage.setString('email', apiResponse['data']['email']);
  await storage.setString('id', apiResponse['data']['id']);
}

Future<String?> getToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? token = storage.getString('token');
  return token;
}
