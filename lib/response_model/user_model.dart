class UserModel {
  final int userId;
  final int username;
  final String email;

  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'],
      username: json['username'],
      title: json['title'],
    );
  }
}