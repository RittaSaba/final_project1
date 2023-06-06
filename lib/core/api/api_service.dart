import 'dart:convert';

import 'package:collection/collection.dart';

// import 'package:flutter_qareeb_client/core/extensions/extensions.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../util/shared_preferences.dart';

var loggerObject = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    // number of method calls to be displayed
    errorMethodCount: 0,
    // number of method calls if stacktrace is provided
    lineLength: 300,
    // width of the output
    colors: true,
    // Colorful log messages
    printEmojis: false,
    // Print an emoji for each log message
    printTime: false,
  ),
);

const baseUrl = '192.168.19.17:8001';
const acccessToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTkyLjE2OC4xOS4xNzo4MDAxL2FwaS9hdXRoL2xvZ2luIiwiaWF0IjoxNjg2MDQxODA5LCJleHAiOjE2ODYwNDU0MDksIm5iZiI6MTY4NjA0MTgwOSwianRpIjoiN0prMGhmNXFYcDZDdVUwQyIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.W9GKCRMgCBLYNFRKft8h5aHLW_IHa-VcQG2qZwRMaJQ';

class APIService {
  static APIService _singleton = APIService._internal();

  factory APIService() => _singleton;

  factory APIService.reInitial() {
    _singleton = APIService._internal();
    return _singleton;
  }

  final innerHeader = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $acccessToken',
    // 'Authorization': 'Bearer ${AppSharedPreference.getToken()}',
  };

  APIService._internal();

  Future<http.Response> getApi({
    required String url,
    Map<String, dynamic>? query,
    Map<String, String>? header,
    String? path,
    String? hostName,
  }) async {
    if (query != null) query.removeWhere((key, value) => value == null);

    innerHeader.addAll(header ?? {});

    if (path != null) url = '$url/$path';

    if (query != null) {
      query.removeWhere((key, value) => value == null);
      query.forEach((key, value) => query[key] = value.toString());
    }

    logRequest('${hostName ?? ''}$url', query);

    final uri = Uri.http(hostName ?? baseUrl, url, query);

    final response = await http.get(uri, headers: innerHeader).timeout(
          const Duration(seconds: 30),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);
    return response;
  }

  Future<http.Response> postApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
    String? hostName,
  }) async {
    if (body != null) body.removeWhere((key, value) => value == null);

    if (query != null) {
      query.removeWhere((key, value) => value == null);
      query.forEach((key, value) => query[key] = value.toString());
    }

    innerHeader.addAll(header ?? {});

    final uri = Uri.http(hostName ?? baseUrl, url, query);

    logRequest(url, (body ?? {})..addAll(query ?? {}));

    final response = await http
        .post(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> puttApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    if (body != null) body.removeWhere((key, value) => value == null);
    if (query != null) query.removeWhere((key, value) => value == null);

    innerHeader.addAll(header ?? {});

    if (query != null) {
      query.removeWhere((key, value) => value == null);
      query.forEach((key, value) => query[key] = value.toString());
    }

    final uri = Uri.http(baseUrl, url, query);

    logRequest(url, body);

    final response = await http
        .put(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> deleteApi({
    required String url,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
    Map<String, String>? header,
  }) async {
    if (body != null) body.removeWhere((key, value) => value == null);

    if (query != null) {
      query.removeWhere((key, value) => value == null);
      query.forEach((key, value) => query[key] = value.toString());
    }

    innerHeader.addAll(header ?? {});

    final uri = Uri.http(baseUrl, url, query);

    logRequest(url, body);

    final response = await http
        .delete(uri, body: jsonEncode(body), headers: innerHeader)
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => http.Response('connectionTimeOut', 481),
        );

    logResponse(url, response);

    return response;
  }

  Future<http.Response> uploadMultiPart({
    required String url,
    String? path,
    String type = 'POST',
    String nameFile = 'File',
    List<XFile?>? files,
    Map<String, dynamic>? fields,
    Map<String, String>? header,
  }) async {
    Map<String, String> f = {};
    (fields ?? {}).forEach((key, value) => f[key] = value.toString());

    innerHeader.addAll(header ?? {});
    final uri = Uri.http(baseUrl, '$url/${path ?? ''}');

    var request = http.MultipartRequest(type, uri);

    ///log
    logRequest(url, fields, additional: files?.firstOrNull?.path);

    for (var file in (files ?? <XFile?>[])) {
      if (file == null) continue;

      final multipartFile =
          http.MultipartFile.fromBytes(nameFile, await file.readAsBytes());

      request.files.add(multipartFile);
    }

    request.headers.addAll(innerHeader);

    request.fields.addAll(f);

    final stream = await request.send();

    final response = await http.Response.fromStream(stream);

    ///log
    logResponse(url, response);

    return response;
  }
}

void logRequest(String url, Map<String, dynamic>? q, {String? additional}) {
  loggerObject.i(
      '$url \n ${jsonEncode(q)}${additional == null ? '' : '\n$additional'}');
}

void logResponse(String url, http.Response response) {
  var r = [];
  var res = '';
  if (response.body.length > 800) {
    r = response.body.splitByLength1(800);
    for (var e in r) {
      res += '$e\n';
    }
  } else {
    res = response.body;
  }

  loggerObject.v('${response.statusCode} \n $res');
}

extension SplitByLength on String {
  List<String> splitByLength1(int length, {bool ignoreEmpty = false}) {
    List<String> pieces = [];

    for (int i = 0; i < this.length; i += length) {
      int offset = i + length;
      var piece = substring(i, offset >= this.length ? this.length : offset);

      if (ignoreEmpty) {
        piece = piece.replaceAll(RegExp(r'\s+'), '');
      }

      pieces.add(piece);
    }
    return pieces;
  }
}

// extension on String {
//   List<String> splitByLength(int length) => [substring(0, length), substring(length)];
// }
