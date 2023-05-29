import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:final_project1/features/attachments/domain/entities/attachment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/desicion_model.dart';

abstract class DesicionLocalDataSource {
  Future<List<DesicionModel>> getCachedDesicion();
  Future<Unit> cacheDesicion(List<DesicionModel> DesicionModels);
}

const CACHED_DESICION = "CACHED_DESICION";

class DesicionLocalDataSourceImpl implements DesicionLocalDataSource {
  final SharedPreferences sharedPreferences;
  DesicionLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheDesicion(List<DesicionModel> desicionModels) {
    List desicionModelsToJson = desicionModels
        .map<Map<String, dynamic>>((desicionModels) => desicionModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_DESICION, json.encode(desicionModelsToJson));
    return Future.value(unit);
  }





  @override
  Future<List<DesicionModel>> getCachedDesicion() {
    final jsonString = sharedPreferences.getString(CACHED_DESICION);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<DesicionModel> jsonToDesicionModels = decodeJsonData
          .map<DesicionModel>((jsonDesicionModel) => DesicionModel.fromJson(jsonDesicionModel))
          .toList();
      return Future.value(jsonToDesicionModels);
    } else {
      throw EmptyCacheException();
    }
  }}
