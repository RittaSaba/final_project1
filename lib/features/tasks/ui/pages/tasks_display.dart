import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_cubit.dart';
import 'package:final_project1/features/tasks/bloc/get_tasks_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/task.dart';
import '../widgets/list_tile_day_widget.dart';



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
              /*AlertDialog(
          shape: Border.all(
              color: colorIcon,
              width: 6),
          title: Text(
            task.name,
            style: TextStyle(
                fontWeight:
                FontWeight
                    .bold,
                color:
                colorbar1),
          ),
          content:
          SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                /*      Row(
                  children: [
                    Text(
                      "وقت البدء " +
                          task.startDate

                              .toString() +
                          ":" +
                          item.startTime!
                              .minute
                              .toString(),
                      style:
                      TextStyle(
                        fontSize:
                        14,
                        color:
                        colorbar1,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "وقت الانتهاء " +
                          item.endTime!
                              .hour
                              .toString() +
                          ":" +
                          item.endTime!
                              .minute
                              .toString(),
                      style:
                      TextStyle(
                        fontSize:
                        14,
                        color:
                        colorbar1,
                      ),
                    ),
                  ],
                ),*/
                Text(
                  task.description,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                "تم",
                style: TextStyle(
                    color:
                    colorText,
                    fontWeight:
                    FontWeight
                        .bold),
              ),
              onPressed: () {
                Navigator.of(
                    context)
                    .pop();
              },
            ),
          ],
        );*/
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