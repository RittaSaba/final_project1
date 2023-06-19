import 'dart:convert';

import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/tasks/data/models/local_task.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/summaries/data/response/login_response.dart';
import '../api/api_service.dart';

class AppSharedPreference {
  static const _token = '1';
  static const _user = '2';
  static const _fireToken = '3';
  static const _counter = '4';
  static const _tasks = '5';
  static const _userType = '6';

  static late SharedPreferences _prefs;

  static init(SharedPreferences preferences) async {
    _prefs = preferences;
  }

  static cashToken(String? token) {
    if (token == null) return;

    _prefs.setString(_token, token);

    APIService.reInitial();
  }

  static String getToken() {
    return _prefs.getString(_token) ?? '';
  }

  static cashUser(User? model) {
    if (model == null) return;

    _prefs.setString(_userType, model.roleName);
    _prefs.setString(_user, jsonEncode(model.toJson()));
  }

  static User getUserModel() {
    var json = _prefs.getString(_user) ?? '{}';
    return User.fromJson(jsonDecode(json));
  }

  static void clear() {
    _prefs.clear();
  }

  static void logout() {
    _prefs.remove(_token);
    APIService.reInitial();
  }

  static bool isLogin() {
    return getToken().isNotEmpty;
    // return true;
  }

  static int _getCounter() {
    var c = _prefs.getInt(_counter) ?? 0;
    _prefs.setInt(_counter, c + 1);
    return c;
  }

  static void addTask(LocalTask task) {
    final listTasksJson = _prefs.getStringList(_tasks) ?? <String>[];

    task.id = _getCounter();

    var stringJson = jsonEncode(task.toMap());
    listTasksJson.add(stringJson);

    _prefs.setStringList(_tasks, listTasksJson);

    final listTasks = <LocalTask>[];
    for (var e in listTasksJson) {
      listTasks.add(LocalTask.fromMap(jsonDecode(e)));
    }
  }

  static List<LocalTask> getTask({required DateTime filterDate}) {
    final listTasksJson = _prefs.getStringList(_tasks) ?? <String>[];
    final listTasks = <LocalTask>[];
    for (var e in listTasksJson) {
      final item = LocalTask.fromMap(jsonDecode(e));
      if (filterDate.myHash == item.startTime?.myHash) {
        listTasks.add(item);
      }
    }

    return listTasks;
  }

  static bool deleteTask(int id) {
    final listTasksJson = _prefs.getStringList(_tasks) ?? <String>[];
    final listTasks = <LocalTask>[];
    for (var e in listTasksJson) {
      listTasks.add(LocalTask.fromMap(jsonDecode(e)));
    }
    int oldSize = listTasks.length;
    listTasks.removeWhere((e) => e.id == id);
    _prefs.setStringList(
        _tasks, listTasks.map((task) => jsonEncode(task.toMap())).toList());
    return oldSize != listTasks.length;
  }

  static bool get isUser {
    return (_prefs.getString(_userType) ?? '') != 'محامي';
  }

  static bool updateTask(LocalTask newTask, int id) {
    final listTasksJson = _prefs.getStringList(_tasks) ?? <String>[];
    final listTasks = <LocalTask>[];

    for (var e in listTasksJson) {
      listTasks.add(LocalTask.fromMap(jsonDecode(e)));
    }

    for (var i = 0; i < listTasks.length; i++) {
      if (listTasks[i].id == id) {
        listTasks[i] = newTask;
        //    final updatedList = listTasks.map((task) => jsonEncode(task.toMap())).toList();
        _prefs.setStringList(
            _tasks, listTasks.map((task) => jsonEncode(task.toMap())).toList());
        return true;
      }
    }
    return false;
  }

  static void cashFireToken(String token) {
    _prefs.setString(_fireToken, token);
  }

  static String getFireToken() {
    return _prefs.getString(_fireToken) ?? '';
  }
}

/*هذا الكود هو عبارة عن ملف `AppSharedPreference` يقوم بتعريف وتنفيذ العمليات المتعلقة بـ `SharedPreferences` والتي تستخدم لتخزين واسترداد البيانات في تطبيق Flutter.

في البداية، يتم تعريف ثلاث ثوابت `_token` و `_user` و `_fireToken` التي تمثل مفاتيح `SharedPreferences` المستخدمة لتخزين الرمز المميز (token) ومعلومات المستخدم ورمز Firebase Cloud Messaging (FCM) على التوالي.

ثم يتم تعريف متغير `_prefs` الذي يستخدم للوصول إلى حافظة التخزين المؤقت (SharedPreferences)، والتي يتم تعيينها باستخدام دالة `init()` التي تأخذ `SharedPreferences` كمدخل وتستخدم لتهيئة `_prefs`.

تضم الملف أيضًا سلسلة من الدوال التي تتحكم في عمليات تخزين واسترداد البيانات من حافظة التخزين المؤقت (SharedPreferences)، والتي تشمل:

- دالة `cashToken()` التي تستخدم لتخزين الرمز المميز (token) في حافظة التخزين المؤقت (SharedPreferences) وتهيئة خدمة `API` باستخدام `APIService.reInitial()`.
- دالة `getToken()` التي تستخدم لاسترداد الرمز المميز (token) المخزن في حافظة التخزين المؤقت (SharedPreferences).
- دالة `cashUser()` التي تستخدم لتخزين معلومات المستخدم التي تم تسجيل الدخول بها في حافظة التخزين المؤقت (SharedPreferences).
- دالة `getUserModel()` التي تستخدم لاسترداد معلومات المستخدم المستخدم المسجلة في التطبيق من حافظة التخزين المؤقت (SharedPreferences).
- دالة `clear()` التي تستخدم لمسح جميع البيانات المخزنة في حافظة التخزين المؤقت (SharedPreferences).
- دالة `logout()` التي تستخدم لتسجيل الخروج من التطبيق عندما يقوم المستخدم بالضغط على زر تسجيل الخروج، وتقوم بمسح جميع البيانات المخزنة في حافظة التخزين المؤقت (SharedPreferences) وإعادة تهيئة خدمة `API` باستخدام `APIService.reInitial()`.
- دالة `isLogin()` التي تستخدم للتحقق مما إذا كان المستخدم مسجلاً دخولًا أم لا، عن طريق استرجاع الرمز المميز (token) من حافظةالتخزين المؤقت (SharedPreferences) والتحقق مما إذا كانت القيمة غير فارغة.
- دالة `cashFireToken()` التي تستخدم لتخزين رمز Firebase Cloud Messaging (FCM) في حافظة التخزين المؤقت (SharedPreferences).
- دالة `getFireToken()` التي تستخدم لاسترداد رمز Firebase Cloud Messaging (FCM) المخزن في حافظة التخزين المؤقت (SharedPreferences).

يتم استخدام `jsonEncode()` و `jsonDecode()` لتحويل الكائنات إلى سلسلة نصية `JSON` والعكس، وذلك لتخزين الكائنات في حافظة التخزين المؤقت (SharedPreferences) كنص.

يتم أيضًا استخدام `APIService.reInitial()` لإعادة تهيئة خدمة `API` عند تغيير الرمز المميز (token) أو تسجيل الخروج.*/
