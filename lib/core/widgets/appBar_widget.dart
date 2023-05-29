import 'package:flutter/material.dart';

import '../app_theme.dart';

AppBar build_appBar({IconButton? searchIcon,TabBar? tabBar, required String title}){


  return AppBar(
   // actions: [widget(child: searchIcon),],
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
          height: 300,

          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: colorbar, blurRadius: 20)],
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35)),
            color: Colors.white,
            gradient: LinearGradient(
              colors: [(Color(0xF001305C)), (Color(0xFF587D99))],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    ),
  );}
/*
widget({IconButton? child}) {

  if (child!=null) return child; else return null;
}*/