import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getCachedUsers();
  Future<Unit> cacheUsers(List<UserModel> UserModels);
}

const CACHED_USERS = "CACHED_USERS";

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheUsers(List<UserModel> userModels) {
    List userModelsToJson = userModels
        .map<Map<String, dynamic>>((userModels) => userModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_USERS, json.encode(userModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<UserModel>> getCachedUsers() {
    final jsonString = sharedPreferences.getString(CACHED_USERS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<UserModel> jsonToUserModel = decodeJsonData
          .map<UserModel>((jsonUserModel) => UserModel.fromJson(jsonUserModel))
          .toList();
      return Future.value(jsonToUserModel);
    } else {
      throw EmptyCacheException();
    }
  }






}
