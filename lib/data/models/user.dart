class UserModel {
  final String id;
  final String email;
  final String username;
  final String password;
  final DateTime? createdAt;

  UserModel({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'password': password,
      'created_at': createdAt?.toIso8601String(),
    };
  }

  factory UserModel.fromSupabaseUser(UserModel user) {
    return UserModel(
      id: user.id,
      email: user.email,
      username: user.email.split('@').first,
      password: '',
      createdAt: user.createdAt,
    );
  }
}
