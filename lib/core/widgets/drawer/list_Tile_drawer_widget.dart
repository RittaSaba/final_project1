import 'package:final_project1/core/app_theme.dart';
import 'package:flutter/material.dart';

Widget build_listTile(String title,IconData icon,VoidCallback on_tab_function){
  return  ListTile(

    title: Text(
      title,
      style: TextStyle(
        color: Color(0xff0a0a0a),
        fontSize: 18,
      ),
    ),
    leading: Icon(
      icon,
      color: colorIcon,
      size: 25,
    ),
    onTap: on_tab_function,
  );}
