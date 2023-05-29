import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
