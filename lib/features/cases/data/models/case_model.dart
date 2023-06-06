import 'dart:ffi';

import '../../domain/entities/case.dart';

class CaseModel extends Case1 {
  CaseModel({
    required int id,
    required String title,
    required String Status,
    required int Value_Status,
    required String case_room,
    required int court_id,
  }) : super(
            id: id,
            title: title,
            Status: Status,
            Value_Status: Value_Status,
            case_room: case_room,
            court_id: court_id);

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
        id: json['id'],
        title: json['title'],
        Status: json['Status'],
        Value_Status: json['Value_Status'],
        court_id: json['court_id'],
        case_room: json['case_room'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'Status': Status,
      'Value_Status': Value_Status,
      'court_id': court_id,
      'case_room': case_room,
    };
  }
}
