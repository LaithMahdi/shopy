class UserModel {
  final int id;
  final String username;
  final String picture;
  final String mail;
  final String phone;
  final String password;
  final int verifyCode;

  UserModel({
    required this.id,
    required this.username,
    required this.picture,
    required this.mail,
    required this.phone,
    required this.password,
    required this.verifyCode,
  });
}
