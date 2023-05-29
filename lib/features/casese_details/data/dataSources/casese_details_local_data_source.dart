import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/casese_details_model.dart';

abstract class Casese_detailsLocalDataSource {
  Future<List<Casese_detailsModel>> getCachedCasese_details();
  Future<Unit> cacheCasese_details(List<Casese_detailsModel> Casese_detailsModels);
}

const CACHED_CASES_DETAILS = "CACHED_CASES_DETAILS";

class Casese_detailsLocalDataSourceImpl implements Casese_detailsLocalDataSource {
  final SharedPreferences sharedPreferences;
  Casese_detailsLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheCasese_details(List<Casese_detailsModel> casese_detailsModels) {
    List casese_detailsModelsToJson = casese_detailsModels
        .map<Map<String, dynamic>>((casese_detailsModels) => casese_detailsModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_CASES_DETAILS, json.encode(casese_detailsModelsToJson));
    return Future.value(unit);
  }





  @override
  Future<List<Casese_detailsModel>> getCachedCasese_details() {
    final jsonString = sharedPreferences.getString(CACHED_CASES_DETAILS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<Casese_detailsModel> jsonToCasese_detailsModels = decodeJsonData
          .map<Casese_detailsModel>((jsonCasese_detailsModel) => Casese_detailsModel.fromJson(jsonCasese_detailsModel))
          .toList();
      return Future.value(jsonToCasese_detailsModels);
    } else {
      throw EmptyCacheException();
    }
  }}
