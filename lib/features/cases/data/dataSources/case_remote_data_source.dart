import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/case_model.dart';

abstract class CaseRemoteDataSource {
  Future<List<CaseModel>> getAllCase();
  Future<Unit> updateCase(CaseModel caseModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class CaseRemoteDataSourceImpl implements CaseRemoteDataSource {
  final http.Client client;

  CaseRemoteDataSourceImpl({required this.client});



  @override
  Future<List<CaseModel>> getAllCase() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<CaseModel> caseModels = decodedJson
          .map<CaseModel>((jsonCaseModel) => CaseModel.fromJson(jsonCaseModel))
          .toList();
      return caseModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateCase(CaseModel caseModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {
      "id":caseModel.id,
      "title":caseModel.title,
      "Status":caseModel.Status,
      "Value_Status":caseModel.Value_Status,
      "case_room":caseModel.case_room,
    "court_id":caseModel.court_id,
    };

    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$caseModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
