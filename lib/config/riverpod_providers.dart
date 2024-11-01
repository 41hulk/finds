import 'package:finds/domain/auth/auth_notifier.dart';
import 'package:finds/domain/auth/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthenticationState>((ref) {
  return AuthNotifier();
});
