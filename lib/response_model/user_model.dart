class UserModel {
  final int userId;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;
  final String refreshToken;

  const UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      image: json['image'],
      token: json['token'],
      refreshToken: json['refreshToken'],
    );
  }
}