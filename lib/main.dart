import 'package:final_project1/features/auth/presentation/pages/login_screen.dart';
import 'package:final_project1/router/app_router.dart';
import 'package:final_project1/send_attachment.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/basic_screen.dart';
import 'core/di/injection_container.dart'as di;
import 'core/util/shared_preferences.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await di.init();
  await SharedPreferences.getInstance().then((value) {
    AppSharedPreference.init(value);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.routes,
      //  onGenerateRoute: AppRoutes.routes,
    );
  }
}
