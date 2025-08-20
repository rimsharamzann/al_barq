import 'dart:convert';

import '../../../core/enums/enum_methods.dart';
import '../../../core/enums/user_enum.dart';

class UserModel {
  UserModel({
    this.uid,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.profilePicture,
    required this.role,
    this.merit,
    required this.loginDate,
  });

  factory UserModel.fromMap(map) {
    // print(map);

    // final timestamp = map['loginDate'] is Timestamp
    //     ? map['loginDate']
    //     : Timestamp.fromMillisecondsSinceEpoch(map['loginDate']);

    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      email: map['email'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      merit: map['merit'] ?? '',

      // (map['course'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      profilePicture: map['profilePicture'],
      role: enumFromString(map['role'], UserEnum.values) ?? UserEnum.buyer,
      loginDate:
          // map['loginDate'] != null
          //     ? map['loginDate'] is Timestamp
          //         ? (map['loginDate'] as Timestamp).toDate()
          //         : DateTime.tryParse(map['loginDate'].toString()) ??
          //             DateTime.now()
          //     :
          DateTime.now(),
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  final String? uid;
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String? profilePicture;
  final UserEnum role;
  final String? merit;
  final DateTime loginDate;

  UserModel copyWith({
    String? uid,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? profilePicture,
    String? merit,
    UserEnum? role,
    DateTime? loginDate,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      role: role ?? this.role,
      loginDate: loginDate ?? this.loginDate,
      merit: merit ?? this.merit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,

      'merit': merit,

      'profilePicture': profilePicture,
      'role': enumToString(role),
      'loginDate': loginDate.toIso8601String(),
      // 'loginDate': Timestamp.fromDate(loginDate),
    };
  }

  String toJson() => json.encode(toMap());
}
