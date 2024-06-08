import 'dart:convert';

class LoginModel {
  String name;
  String email;
  String bio;
  String createdAt;
  String phoneNumber;
  String uid;

  LoginModel({
    required this.name,
    required this.email,
    required this.bio,
    required this.createdAt,
    required this.phoneNumber,
    required this.uid,
  });

  // from map
  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      uid: map['uid'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',

    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "uid": uid,
      "bio": bio,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
    };
  }

  String toJsonString() {
    return jsonEncode(toMap());
  }
}
