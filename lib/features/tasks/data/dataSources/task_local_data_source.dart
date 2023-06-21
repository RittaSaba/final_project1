import 'dart:convert';


import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/task_model.dart';

abstract class TaskLocalDataSource {
  Future<List<TaskModel>> getCachedTask();
  Future<Unit> cacheTasks(List<TaskModel> TaskModels);
}

const CACHED_TASKS = "CACHED_TASKS";

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final SharedPreferences sharedPreferences;
  TaskLocalDataSourceImpl({required this.sharedPreferences});


  @override
  Future<Unit> cacheTasks(List<TaskModel> taskModels) {
    List taskModelsToJson = taskModels
        .map<Map<String, dynamic>>((taskModels) => taskModels.toJson())
        .toList();
    sharedPreferences.setString(CACHED_TASKS, json.encode(taskModelsToJson));
    return Future.value(unit);
  }





  @override
  Future<List<TaskModel>> getCachedTask() {
    final jsonString = sharedPreferences.getString(CACHED_TASKS);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<TaskModel> jsonToTaskModels = decodeJsonData
          .map<TaskModel>((jsonTaskModel) => TaskModel.fromJson(jsonTaskModel))
          .toList();
      return Future.value(jsonToTaskModels);
    } else {
      throw EmptyCacheException();
    }
  }



}
