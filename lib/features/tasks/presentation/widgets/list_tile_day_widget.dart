import 'package:final_project1/core/app_theme.dart';
import 'package:flutter/material.dart';


import '../../domain/entities/task.dart';
import '../pages/day_tasks.dart';

Widget build_listTile_Day_Widget(Task1 task,BuildContext context){
  BorderSide b;
  return  Container(color: colorContainer,
    child: ListTile(
      onTap: (){ Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) {
        return DaysTasks();
      }));},
      title: Row(
        children: [
          Expanded(
            child: Text(
              task.task_name,
              style: TextStyle(
                color: colorText,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),maxLines: 2,
            ),
          ),
          Transform.scale(
            scale: 1.6,
            child: Checkbox(
              value:false

               ,checkColor: Colors.green,

              activeColor: Colors.grey.shade200,
              fillColor:MaterialStateProperty.all( Colors.grey.shade400) ,
              tristate: true,
              onChanged: (newBool) {
                //call method from database to change the status
              },
            ),
          ),
        ],
      ),
      subtitle: Column(children: [
      Text(task.description,maxLines: 2,),
      Row(children: [
        Text(task.start_date.year.toString(),style: TextStyle(fontSize: 20),),
        Text("/",style: TextStyle(fontSize: 20)),
        Text(task.start_date.month.toString(),style: TextStyle(fontSize: 20)),
        Text("/",style: TextStyle(fontSize: 20)),
         Text(task.start_date.day.toString(),style: TextStyle(fontSize: 20),),
      ],),
    ],),),
  );}
