import 'package:finds/config/logger_config.dart';
import 'package:finds/data/models/user.dart';
import 'package:finds/domain/auth/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  AuthNotifier() : super(AuthenticationState.initial());
  final supabase = Supabase.instance.client;
  final posthog = Posthog();

  Future<void> signUp({required email, required password}) async {
    try {
      state = AuthenticationState.loading();
      final response =
          await supabase.auth.signUp(email: email, password: password);

      state = AuthenticationState.authenticated(response as UserModel);
      await posthog.capture(eventName: 'user_signed_up', properties: {
        'email': email,
        'user_id': response.user!.id,
      });
      AppLogger.logInfo(
        'User signed up: ${response.user!.email}',
      );
    } catch (e) {
      state = AuthenticationState.error(e.toString());
      AppLogger.logError('FAIL SIGNIN', e.toString());
    }
  }
  // Future<void> signIn(String email, String password) async {
  //   state = AuthState.loading();
  //   try {
  //     final user = await _authRepository.signIn(email, password);
  //     state = AuthState.authenticated(user!);
  //   } catch (e) {
  //     state = AuthState.error(e.toString());
  //   }
  // }

  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
      posthog.capture(eventName: 'user_signed_out');

      state = AuthenticationState.unauthenticated();
    } catch (e) {
      AppLogger.logError('FAIL SIGNOUT', e.toString());
    }
  }
}
