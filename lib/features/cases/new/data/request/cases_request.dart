import 'dart:core';

class CasesRequest {
  CasesRequest({
    this.id = 0,
    this.title = '',
    this.Status = '',
    this.Value_Status = 0,
    this.case_room = '',
    this.court_id = 0,
  });

  int id;
  String title;
  String Status;
  int Value_Status;
  String case_room;
  int court_id;

  CasesRequest copyWith({
    int? id,
    String? title,
    String? Status,
    int? Value_Status,
    String? case_room,
    int? court_id,
  }) {
    return CasesRequest(
      id: id ?? this.id,
      title: title ?? this.title,
      Status: Status ?? this.Status,
      Value_Status: Value_Status ?? this.Value_Status,
      case_room: case_room ?? this.case_room,
      court_id: court_id ?? this.court_id,
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

  factory CasesRequest.fromJson(Map<String, dynamic> json) {
    return CasesRequest(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      Status: json['Status'] ?? '',
      Value_Status: json['Value_Status'] ?? '',
      court_id: json['court_id'] ?? '',
      case_room: json['case_room'] ?? '',
    );
  }
}
