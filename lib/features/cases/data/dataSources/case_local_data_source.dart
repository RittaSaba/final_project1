import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/case_model.dart';

abstract class CaseLocalDataSource {
  Future<List<CaseModel>> getCachedCase();
  Future<Unit> cacheCase(List<CaseModel> CaseModels);
}

const CACHED_CASE = "CACHED_CASE";

class CaseLocalDataSourceImpl implements CaseLocalDataSource {
  final SharedPreferences sharedPreferences;
  CaseLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheCase(List<CaseModel> caseModels) {
    List caseModelsToJson = caseModels
        .map<Map<String, dynamic>>((caseModels) => caseModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_CASE, json.encode(caseModelsToJson));
    return Future.value(unit);
  }





  @override
  Future<List<CaseModel>> getCachedCase() {
    final jsonString = sharedPreferences.getString(CACHED_CASE);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<CaseModel> jsonToCaseModels = decodeJsonData
          .map<CaseModel>((jsonCaseModel) => CaseModel.fromJson(jsonCaseModel))
          .toList();
      return Future.value(jsonToCaseModels);
    } else {
      throw EmptyCacheException();
    }
  }}
