import 'package:finds/data/models/user.dart';

class AuthenticationState {
  final bool isLoading;
  final UserModel? user;
  final String? errorMessage;

  AuthenticationState({required this.isLoading, this.user, this.errorMessage});

  factory AuthenticationState.initial() {
    return AuthenticationState(isLoading: false);
  }

  factory AuthenticationState.loading() {
    return AuthenticationState(isLoading: true);
  }

  factory AuthenticationState.authenticated(UserModel user) {
    return AuthenticationState(isLoading: false, user: user);
  }

  factory AuthenticationState.unauthenticated() {
    return AuthenticationState(isLoading: false);
  }

  factory AuthenticationState.error(String message) {
    return AuthenticationState(isLoading: false, errorMessage: message);
  }
}
