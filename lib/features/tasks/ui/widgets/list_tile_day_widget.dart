import 'package:final_project1/core/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart' as ui;
import '../../data/response/task_response.dart';
import '../../domain/entities/task.dart';
import '../pages/day_tasks.dart';

Widget build_listTile_Day_Widget(Task task,BuildContext context){
  BorderSide b;
  return  Container(color: colorContainer,
    child: ListTile(
      onTap: (){
        showDialog(
          context: context,
          builder:
              (BuildContext context) {
            return Directionality(
              textDirection: ui.TextDirection.rtl,
              child: AlertDialog(
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
                     /* Row(
                        children: [
                          Text(
                            "وقت البدء " +
                                item.startTime!
                                    .hour
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
              ),
            );
          },
        );
      },
      title: Row(
        children: [
          Expanded(
            child: Text(
              task.name,
              style: TextStyle(
                color: colorText,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),maxLines: 2,
            ),
          ),
        /*  Transform.scale(
            scale: 1.6,
            child: Checkbox(
              value:task.status=="0"?true:false

               ,checkColor: colorIcon,

              activeColor: Colors.grey.shade200,
              fillColor:MaterialStateProperty.all( Colors.grey.shade400) ,
              tristate: true,
              onChanged: (newBool) {
                //call method from database to change the status
              },
            ),
          ),*/
        ],
      ),
      subtitle: Column(children: [
      Text(task.description,maxLines: 2,),
      /*Row(children: [
        Text(task.start_date.year.toString(),style: TextStyle(fontSize: 20),),
        Text("/",style: TextStyle(fontSize: 20)),
        Text(task.start_date.month.toString(),style: TextStyle(fontSize: 20)),
        Text("/",style: TextStyle(fontSize: 20)),
         Text(task.start_date.day.toString(),style: TextStyle(fontSize: 20),),
      ],),*/
    ],),),
  );}
