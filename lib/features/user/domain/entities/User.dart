import 'package:equatable/equatable.dart';

class User1 extends Equatable{
  final int id;
final String first_name;
  final String last_name;
  final String mother_name;
  final String father_name;
  final DateTime birth_date;
  final String birth_place;
  final String email;
  final String roles_name;
  final String Status;

  final String password;
  final String location;
  final int phone;

User1({ required this.id,
  required this.first_name,
  required this.last_name,
  required this.mother_name,
  required this.father_name,
  required this.birth_date,
  required this.birth_place,
  required this.email,
  required this.roles_name,
  required this.Status,
  required this.password,
  required this.location,
  required this.phone,});

  @override
  // TODO: implement props
  List<Object?> get props {
    return [id,first_name,last_name,mother_name,father_name,birth_date,birth_place,email,roles_name,Status,password,location,phone];
  }
}