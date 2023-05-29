import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

Widget buildCaseField(String text,String textinfo) {

  return Container(
      padding: EdgeInsets.only(top: 5,right: 3),
      margin: EdgeInsets.only(right: 5),
      child: Row(

        children: [
          Expanded(
            child: Text(text,
              style: TextStyle(
                  color: colorText, fontWeight: FontWeight.bold,fontSize: 18),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(child: Text(textinfo,style: TextStyle(color:Color(0xFF6B6C6E),fontSize: 15),maxLines: 2,),),
        ],
      ));
}