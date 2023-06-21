import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


import '../util/shared_preferences.dart';

class ErrorManager {
  static String getApiError(Response response) {
    switch (response.statusCode) {
      case 401:
        AppSharedPreference.logout();
        return ' المستخدم الحالي لم يسجل الدخول ' '${response.statusCode}';

      case 503:
        return 'حدث تغيير في المخدم رمز الخطأ 503 ' '${response.statusCode}';
      case 481:
        return 'لا يوجد اتصال بالانترنت' '${response.statusCode}';

      case 404:
        return 'صفحة غير متوفرة' '${response.statusCode}';
      case 500:
      default:
        final errorBody = jsonDecode(response.body)['message'] ?? 'خطأ غير متوقع';

        return errorBody;
    }
  }
}

class ErrorBody {
  ErrorBody({required this.error});

  final Error error;

  factory ErrorBody.fromJson(Map<String, dynamic> json) {
    return ErrorBody(
      error: json['error'] == null ? Error.fromJson({}) : Error.fromJson(json['error']),
    );
  }

  Map<String, dynamic> toJson() => {'error': error.toJson()};
}

class Error {
  Error({
    required this.code,
    required this.message,
    required this.details,
    required this.validationErrors,
  });

  final num code;
  final String message;
  final dynamic details;
  final dynamic validationErrors;

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      details: json['details'],
      validationErrors: json['validationErrors'],
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'message': message,
        'details': details,
        'validationErrors': validationErrors,
      };
}
