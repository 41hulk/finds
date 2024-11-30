class UserModel {
  final String username;
  final String email;
  final String password;
  final String nationality;

  UserModel({
    required this.username,
    required this.email,
    required this.password,
    required this.nationality,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'nationality': nationality,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      email: json['email'],
      password: json['password'],
      nationality: json['nationality'],
    );
  }
}
