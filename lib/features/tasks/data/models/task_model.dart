import 'dart:ffi';

import '../../domain/entities/task.dart';

class TaskModel extends Task1 {
  TaskModel({
    required int id,
    required int type_id,
    required String task_name,
    required String description,
    required DateTime start_date,
    required DateTime end_date,
    required String status,
    required int status_value,
    required String user_first_name,
    required String user_last_name,
    required String case_number,
  }) : super(
            id: id,
            type_id: type_id,
            task_name: task_name,
            description: description,
            start_date: start_date,
            end_date: end_date,
            status: status,
            status_value: status_value,
            user_first_name: user_first_name,
            user_last_name: user_last_name,
            case_number: case_number);

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      type_id: json['type_id'],
      task_name: json['task_name'],
      description: json['description'],
      start_date: json['start_date'],
      end_date: json['end_date'],
      status: json['status'],
      status_value: json['status_value'],
      user_first_name: json['user_first_name'],
      user_last_name: json['user_last_name'],
      case_number: json['case_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_id': type_id,
      'task_name': task_name,
      'description': description,
      'start_date': start_date,
      'end_date': end_date,
      'status': status,
      'status_value': status_value,
      'user_first_name': user_first_name,
      'user_last_name': user_last_name,
      'case_number': case_number
    };
  }
}
