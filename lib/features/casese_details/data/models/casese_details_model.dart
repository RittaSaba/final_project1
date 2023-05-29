import 'dart:ffi';

import 'package:final_project1/features/attachments/domain/entities/attachment.dart';

import '../../domain/entities/casese_details.dart';


class Casese_detailsModel extends Casese_details {
  Casese_detailsModel(
      {required  int id, required String title, required String facts, required String legal_discussion, required int id_cases})
      : super(id: id,
      title: title,
      facts: facts,
      legal_discussion: legal_discussion,
      id_cases: id_cases
  );

  factory Casese_detailsModel.fromJson(Map<String, dynamic> json) {
    return Casese_detailsModel(
      id: json['id'],
        title: json['title'],
        facts: json['facts'],
      legal_discussion: json['legal_discussion'],
      id_cases: json['id_cases'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'facts': facts,
      'legal_discussion': legal_discussion,
      'id_cases': id_cases,
    };
  }
}
