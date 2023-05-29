import 'dart:ffi';

import '../../domain/entities/desicion.dart';



class DesicionModel extends Desicion {
  DesicionModel(
      {required  int id, required UnsignedInt case_id, required String description, required int number, required DateTime date})
      : super(id: id,
      case_id: case_id,
      description: description,
      number: number,
      date: date
  );


  factory DesicionModel.fromJson(Map<String, dynamic> json) {
    return DesicionModel(
      id: json['id'],
      case_id: json['case_id'],
      description: json['description'],
      number: json['number'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'case_id': case_id,
      'description': description,
      'number': number,
      'date': date,
    };
  }
}
