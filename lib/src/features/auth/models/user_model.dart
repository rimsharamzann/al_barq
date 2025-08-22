import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? profilePicture;
  final DateTime loginDate;
  final String city;
  final String zipCode;
  final String address;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.profilePicture,
    required this.loginDate,
    required this.city,
    required this.zipCode,
    required this.address,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? profilePicture,

    DateTime? loginDate,
    String? city,
    String? zipCode,
    String? address,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      loginDate: loginDate ?? this.loginDate,
      city: city ?? this.city,
      zipCode: zipCode ?? this.zipCode,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'loginDate': loginDate.millisecondsSinceEpoch,
      'city': city,
      'zipCode': zipCode,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] != null
          ? map['phoneNumber'] as String
          : null,
      profilePicture: map['profilePicture'] != null
          ? map['profilePicture'] as String
          : null,
      loginDate: DateTime.fromMillisecondsSinceEpoch(map['loginDate'] as int),
      city: map['city'] as String,
      zipCode: map['zipCode'] as String,
      address: map['address'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
