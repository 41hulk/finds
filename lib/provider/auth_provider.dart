import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finds/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  UserModel? _user;
  UserModel? get user => _user;

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _user = UserModel(
          uid: userCredential.user!.uid,
          email: userCredential.user!.email!,
          name: username,
          photoUrl: '',
          createdAt: DateTime.now());

      await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(_user!.toMap());

      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final userData = await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      _user = UserModel.fromMap(userData.data()!);
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
    await firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }
}
