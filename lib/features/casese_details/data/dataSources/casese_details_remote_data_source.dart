import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/casese_details_model.dart';

abstract class Casese_detailsRemoteDataSource {
  Future<List<Casese_detailsModel>> getAllCasese_details();
  Future<Unit> updateCasese_details(Casese_detailsModel casese_detailsModel);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class Casese_detailsRemoteDataSourceImpl implements Casese_detailsRemoteDataSource {
  final http.Client client;

  Casese_detailsRemoteDataSourceImpl(this.id, this.title, this.facts, this.legal_discussion, this.id_cases, {required this.client});



  @override
  Future<List<Casese_detailsModel>> getAllCasese_details() async {
    final response = await client.get(
      Uri.parse(BASE_URL + "/posts"),
      headers: {"Content-Type": "application//json"},
    );
    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body) as List;
      final List<Casese_detailsModel> casese_detailsModels = decodedJson
          .map<Casese_detailsModel>((jsonCasese_detailsModel) => Casese_detailsModel.fromJson(jsonCasese_detailsModel))
          .toList();
      return casese_detailsModels;
    } else {
      throw ServerException();
    }
  }
  final  int id;
  final String title;
  final String facts;
  final String legal_discussion;
  final int id_cases;

  @override
  Future<Unit> updateCasese_details(Casese_detailsModel casese_detailsModel) async {

    //final attachmentId = attachmentModel.attachmentId.toString();
    final body = {
      "id":casese_detailsModel.id,
      "title":casese_detailsModel.title,
      "facts":casese_detailsModel.facts,
      "legal_discussion":casese_detailsModel.legal_discussion,
      "id_cases":casese_detailsModel.id_cases,
    };

    final response =
    await client.patch(Uri.parse (BASE_URL + "/posts/$casese_detailsModel"), body: body);
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }




}
