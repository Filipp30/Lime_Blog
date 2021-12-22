

class UserModel{
  final int? id;
  final String? userName;
  final String email;
  final String password;

  const UserModel({
    this.id,
    this.userName,
    required this.email,
    required this.password,
  });
}