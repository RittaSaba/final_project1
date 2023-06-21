import 'package:final_project1/core/api/api_service.dart';
import 'package:final_project1/core/api/api_url.dart';
import 'package:final_project1/core/error/error_manager.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/features/user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import 'package:final_project1/generated/assets.dart';
import 'package:final_project1/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'list_Tile_drawer_widget.dart';

class Drawer_Widget extends StatelessWidget {
  Drawer_Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // scrollDirection: Axis.vertical,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, RouteName.userProfileDetails),
            
            child: UserAccountsDrawerHeader(

              accountName: Text(AppSharedPreference.getUserModel().firstName+" "+AppSharedPreference.getUserModel().lastName),
              accountEmail:  Text(AppSharedPreference.getUserModel().phone),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset(
                    Assets.assetsLl,
                    width: 1500,
                    height: 1500,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                ),
                //  color: Colors.white,

                gradient: LinearGradient(
                  colors: [(Color(0xF001305C)), (Color(0xFF587D99))],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          build_listTile("الصفحة الرئيسية", Icons.home, () {}),
          build_listTile("المرفقات", Icons.category, () {}),
          const Divider(
            color: Color(0xff565654),
          ),
          build_listTile("حول التطبيق", Icons.info, () {}),
          build_listTile("الإعدادات", Icons.settings, () {}),
          build_listTile("تسجيل خروج", Icons.exit_to_app, () {
            if (AppSharedPreference.isLogin()) {
              logoout(context);

              Navigator.pushReplacementNamed(context, RouteName.login);
            } else {
              Navigator.pushReplacementNamed(context, RouteName.login);
            }
          }),
        ],
      ),
    );
  }

  void logoout(BuildContext context) async {
    final prefs = await AppSharedPreference.getToken();
    print(prefs);
    //final authToken = prefs.getToken('auth_token');
    if (prefs != null) {
      final response = await APIService().postApi(
        url: PostUrl.logout,
        header: {'Authorization': 'Bearer $prefs'},
      );

      if (response.statusCode.success) {
        // Clear the authentication token from SharedPreferences
        AppSharedPreference.logout();

        // Redirect the user to the login screen
        Navigator.pushReplacementNamed(context, RouteName.login);
      } else {
        print(ErrorManager.getApiError(response));
        return;
      }
    }
    // Send a request to log out the user
  }
}
