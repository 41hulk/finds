import 'package:finds/config/http.dart';
import 'package:finds/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool loading = false;
  bool isBack = false;

  UserModel? _user;

  // AppLogger appLogger = AppLogger();
  NetworHandler networHandler = NetworHandler();

  Future<dynamic> signUp({
    required String username,
    required String email,
    required String password,
    required String nationality,
    // required UserModel data
  }) async {
    try {
      loading = true;
      _user = UserModel(
        username: username,
        email: email,
        password: password,
        nationality: nationality,
      );

      var res = await networHandler.post('/auth/register', _user!.toJson());
      loading = false;
      notifyListeners();
      return res;
    } catch (e) {
      notifyListeners();
      return e;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      notifyListeners();
    } catch (e) {
      rethrow;
    }
    notifyListeners();
  }

  Future<void> updateProfile(
    String? username,
    String? photoUrl,
  ) async {
    try {} catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    notifyListeners();
  }
}
