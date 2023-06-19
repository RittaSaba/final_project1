import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../widgets/list_tile_day_widget.dart';

final List<Task1> li = [

  Task1(
      id: 5,
      task_name: "موعد لجلسة الجنائية",
      description:
      "اذا كنت اريد اجراء إحصاء على عمود معين ، فااقوم بتخزين هذا العمود فقط ، فان التخزينعلى مستوى العمود اسرع بكثير وخاصة في حال كانت الاحصاءات متمركزة على الاعمدة وبالتالي هذه ال الموجودة داخل الداتا بيز تساعدنا لتطبيق مفاهيم اg  DWمع المحافظة على كل المميزات و المفاهيم الموجوداضافة الى عدم ضياع البيانات أو ضياعها بشكل اقل",
      start_date: DateTime(2023, 5, 21, 10, 15),
      end_date: DateTime(2023, 5, 21, 10, 45),
      status: "الحالة",
      status_value: 1,
      user_first_name: "ريتا",
      user_last_name: "سابا",
      case_number: "112",
      type_id: 2),

];


class TasksDisplay extends StatefulWidget {
  const TasksDisplay({Key? key}) : super(key: key);

  @override
  State<TasksDisplay> createState() => _TasksDisplayState();
}

class _TasksDisplayState extends State<TasksDisplay> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTaskInitial>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(top: 2),

          //alignment: Alignment.topCenter,
          child: ListView.separated(itemBuilder: (context,index){final item  = state.result.tasks[index];
            return Card(
              elevation: 20,
              shadowColor: colorbar,
              //shape: CircleBorder(side: BorderSide(width: 20)),
              child: build_listTile_Day_Widget(item , context),
            );

            }, separatorBuilder: (context, index) {
            return 10.vSpace;
          }, itemCount:  state.result.tasks.length,)
        );
      },
    );
  }
}
/*

* */