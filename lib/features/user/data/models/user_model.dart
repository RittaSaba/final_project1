import 'dart:ffi';

import '../../domain/entities/User.dart';

class UserModel extends User1 {
  UserModel({
    required int id,
    required String first_name,
    required String last_name,
    required String mother_name,
    required String father_name,
    required DateTime birth_date,
    required String birth_place,
    required String email,
    required String roles_name,
    required String Status,
    required String password,
    required String location,
    required int phone,
  }) : super(
          id: id,
          first_name: first_name,
          last_name: last_name,
          mother_name: mother_name,
          father_name: father_name,
          birth_date: birth_date,
          birth_place: birth_place,
          email: email,

          roles_name: roles_name,
          Status: Status,
          password: password,
          location: location,
    phone:phone,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      mother_name: json['mother_name'],
      father_name: json['father_name'],
      birth_date: json['birth_date'],
      birth_place: json['birth_place'],
      email: json['email'],
      roles_name: json['roles_name'],
      Status: json['Status'],
      password: json['password'],
      location: json['location'], phone:json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'mother_name': mother_name,
      'father_name': father_name,
      'birth_date': birth_date,
      'birth_place': birth_place,
      'email': email,
      'roles_name': roles_name,
      'Status': Status,
      'password': password,
      'location': location,
      'phone':phone,
    };
  }
}
