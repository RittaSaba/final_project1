import 'dart:convert';

import 'package:final_project1/core/strings/enum_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../features/tasks/data/models/local_task.dart';

extension ResponseHelper on http.Response {
  Map<String, dynamic> get toJson => jsonDecode(body);
}

extension NumHelper on num {
  Widget get vSpace => SizedBox(height: toDouble());

  Widget get hSpace => SizedBox(width: toDouble());
}

extension IntHelper on int {
  bool get success => (this >= 200 && this <= 210);
}

extension DateTimeHelper on DateTime {
  int get myHash =>  (day * 7) + (month * 23);
}

extension CubitStatusesHelper on CubitStatuses {
  bool get isLoading => this == CubitStatuses.loading;

  bool get isDone => this == CubitStatuses.done;
}

extension RepeatHelper on Repeat {
  String get getName {
    switch (this) {
      case Repeat.never:
        return 'أبدا';
        break;
      case Repeat.daily:
        return 'يوميا';
        break;
      case Repeat.weekly:
        return 'أسبوعيا';
        break;
      case Repeat.monthly:
        return 'شهريا';
        break;
    }
  }
}
