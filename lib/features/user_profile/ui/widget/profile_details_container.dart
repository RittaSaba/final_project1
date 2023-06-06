import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

Widget buildProfileDetailsContainer(
    { String? subTitle, required String title}) {
  return Container(
    child: ListTile(
    title: Text(title, style:
    TextStyle(color: colorText, fontWeight: FontWeight.bold, fontSize: 20),),

      subtitle:subTitle!=null?Text(subTitle, style:
      TextStyle(color: colorbar2, fontWeight: FontWeight.bold, fontSize: 17),):null,


  ), margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xff01305a).withAlpha(20),

      borderRadius: BorderRadius.circular(12),), height:100,);}