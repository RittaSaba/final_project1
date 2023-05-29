import 'package:final_project1/features/profile/presentation/pages/userProfilScreen.dart';
import 'package:flutter/material.dart';

import 'list_Tile_drawer_widget.dart';

class Drawer_Widget extends StatelessWidget {
  Drawer_Widget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // scrollDirection: Axis.vertical,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("myUser.name"),
            accountEmail: Text("myUser.phone.toString()"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "images/ll.jpg",
                  width: 1500,
                  height: 1500,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onDetailsPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return UserProfilScreen();
              }));
            },
            decoration: BoxDecoration(
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
          build_listTile("الصفحة الرئيسية",Icons.home,(){}),
          build_listTile("المرفقات",Icons.category,(){}),
          Divider(
            color: Color(0xff565654),
          ),
          build_listTile("حول التطبيق",Icons.info,(){}),
          build_listTile("الإعدادات",Icons.settings,(){}),
          build_listTile("تسجيل خروج",Icons.exit_to_app,(){}),

        ],
      ),
    );
  }
}
