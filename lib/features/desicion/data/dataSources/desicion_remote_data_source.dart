import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:http/http.dart' as http;


import '../../../../core/error/exception.dart';
import '../models/desicion_model.dart';
abstract class DesicionRemoteDataSource {
  Future<List<DesicionModel>> getAllDesicion();
  Future<Unit> updateDesicion(DesicionModel desicionModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class DesicionRemoteDataSourceImpl implements DesicionRemoteDataSource {
  final http.Client client;

  DesicionRemoteDataSourceImpl({required this.client});



  @override
  Future<List<DesicionModel>> getAllDesicion() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<DesicionModel> desicionModels = decodedJson
          .map<DesicionModel>((jsonDesicionModel) =>DesicionModel.fromJson(jsonDesicionModel))
          .toList();
      return desicionModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateDesicion(DesicionModel desicionModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {
      "id":desicionModel.id,
      "description":desicionModel.description,
      "case_id":desicionModel.case_id,
      "date":desicionModel.date,
      "number":desicionModel.number,
    };
    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$desicionModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
