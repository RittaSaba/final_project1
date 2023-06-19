import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/search/ui/pages/search_build.dart';

AppBar build_appBar(
    {IconButton? searchIcon,
    TabBar? tabBar,
    required String title,
    required BuildContext context}) {
  return AppBar(
    actions: [
      if (searchIcon != null)
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: Searchbuild());
          },
          icon: Icon(Icons.search), // استخدم رمز الأيقونة هنا
        ),
    ],
    bottom: tabBar != null ? tabBar : null,
    centerTitle: true,
    //automaticallyImplyLeading: false,
    elevation: 0,
    toolbarHeight: 90,
    backgroundColor: Colors.white,

    title: Text(title),

    flexibleSpace: Stack(
      children: [
        Container(
          //height: 100,
          height: 400,

          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0xFF587D99), blurRadius: 20)],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              //  bottomRight: Radius.circular(35)
            ),
            color: Colors.white,
            gradient: LinearGradient(
              colors: [(Color(0xF0A2C8EF)), (Color(0xFF587D99))],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    ),
  );
}
/*
widget({IconButton? child}) {

  if (child!=null) return child; else return null;
}*/
/*
class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key,required this. title, this.tabBar,this.searchIcon}) : super(key: key);
  final String title;
  final TabBar? tabBar;
  final Icon?searchIcon;



  @override
  Widget build(BuildContext context) {
    return AppBar(
       actions: [ if (searchIcon != null)
         IconButton(
           onPressed: (){},
           icon: Icon(Icons.search), // استخدم رمز الأيقونة هنا
         ),],
      bottom: tabBar!=null?tabBar:null,
      centerTitle: true,
      //automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: 90,
      backgroundColor: Colors.white,

      title: Text(title),

      flexibleSpace: Stack(
        children: [
          Container(
            //height: 100,
            height: 400,

            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Color(0xFF587D99), blurRadius: 20)],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                //  bottomRight: Radius.circular(35)
              ),
              color: Colors.white,
              gradient: LinearGradient(
                colors: [(Color(0xF0A2C8EF)), (Color(0xFF587D99))],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
