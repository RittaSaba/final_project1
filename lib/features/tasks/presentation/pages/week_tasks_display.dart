
import 'package:final_project1/core/app_theme.dart';
import 'package:flutter/material.dart';


import '../../domain/entities/task.dart';
import '../widgets/list_tile_day_widget.dart';



final List<Task1> li = [

Task1(id:6,task_name: "موعد لمحكمة قضائية من أجل المحاكمة النهائية للمدّعي و هي مهمة جدا جدا", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
    , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),
  Task1(id: 5,task_name: "موعد لجلسة الجنائية", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
      , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),
  Task1(id: 4,task_name: "موعد مقابلة المدير", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
      , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),
  Task1(id: 3,task_name: "موعد تحضير لجلسة الجنائية", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
      , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),
  Task1(id: 2,task_name: "موعد لمقابلة المُوكل", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
      , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),
  Task1(id: 1,task_name: "موعد كتابة وصف القضضية", description: "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل"
      , start_date: DateTime(2023,5,21,10,15), end_date:  DateTime(2023,5,21,10,45), status: "الحالة", status_value: 1, user_first_name: "ريتا", user_last_name: "سابا", case_number: "112", type_id: 2),

];

Widget build_Week_Tasks_Display(BuildContext context) {
  return Container(
    padding: EdgeInsets.only(top: 2),

    //alignment: Alignment.topCenter,
    child: ListView(

      padding: EdgeInsets.all(10),
      //scrollDirection: Axis.vertical,
      children: li.map((e) {
        return Card(

          elevation: 20,
shadowColor: colorbar,
          //shape: CircleBorder(side: BorderSide(width: 20)),
          child:  build_listTile_Day_Widget(e,context),
        );
      }).toList(),
    ),
  );
}

