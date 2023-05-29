import 'dart:convert';

import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/features/profile/presentation/pages/userProfilScreen.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/case.dart';
import '../widgets/case_field.dart';
import '../widgets/text_button.dart';
import 'case__display__choice2.dart';
import 'case_display.dart';

final List<Case1> list = [
  Case1(
      id: 1,
      title: "قضية بيع عقار",
      Status: "قيد التحقيق",
      Value_Status: 0,
      case_room: "156",
      court_id:55,),
  Case1(
    id: 2,
    title: "قضية بيع عقار",
    Status: "قيد التحقيق",
    Value_Status: 0,
    case_room: "156",
    court_id:55,),
  Case1(
    id: 3,
    title: "قضية بيع عقار",
    Status: "قيد التحقيق",
    Value_Status: 0,
    case_room: "156",
    court_id:55,),
  Case1(
    id: 4,
    title: "قضية بيع عقار",
    Status: "قيد التحقيق",
    Value_Status: 0,
    case_room: "156",
    court_id:55,),
  Case1(
    id: 5,
    title: "قضية بيع عقار",
    Status: "قيد التحقيق",
    Value_Status: 0,
    case_room: "156",
    court_id:55,),
];

Widget build_Cases_Display(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 2),

    //alignment: Alignment.topCenter,
    child: ListView(
      padding: EdgeInsets.all(10),
      //scrollDirection: Axis.vertical,
      children: list.map((e) {
        return Card(
          color: colorContainer,
          elevation: 20, shadowColor: colorbar,
          //shape: CircleBorder(side: BorderSide(width: 20)),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Case_Display_Num2());
              }));
            },
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                buildCaseField("اسم القضية   :   ", e.title),
                buildCaseField("اسم المحامي  :   ", e.Status),
                buildCaseField("اسم الموكل    :   ", e.case_room),
                buildCaseField("تاريخ القضية :  ", e.court_id.toString()),

                // SizedBox(height: 0.2,),
                Divider(),
                Container(
                  //color: Colors.grey[200],

                  margin: EdgeInsets.only(top: 2),

                  child: buildTextButton("ارسال مرفق", 18, context),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    ),
  );
}
