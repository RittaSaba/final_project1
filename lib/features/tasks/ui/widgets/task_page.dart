import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/features/tasks/data/models/local_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart' as ui;
import '../../../../core/widgets/appBar_widget.dart';
import '../../../../router/app_router.dart';
import '../../../user_profile/ui/widget/my_button.dart';
import '../pages/add_task_page.dart';
import '../pages/edit_old_task.dart';
import 'entit.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  var _selectedDate = DateTime.now();

  final listTasks = <LocalTask>[];

  @override
  void initState() {
    listTasks.addAll(AppSharedPreference.getTask(filterDate: _selectedDate ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () async {
              await Navigator.pushNamed(context, RouteName.addTask);
              setState(() {
                listTasks
                  ..clear()
                  ..addAll(
                      AppSharedPreference.getTask(filterDate: _selectedDate));
              });
            },
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _addTaskBar(context),
                _addDateBar(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    height: 420,
                    child: ListView.builder(
                      itemCount: listTasks.length,
                      itemBuilder: (_, i) {
                        final item = listTasks[i];
                        return Dismissible(
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            color: colorIcon,
                          ),
                          onDismissed: (DismissDirection direction) {},
                          confirmDismiss: (DismissDirection dicoration) async {
                            if (dicoration == DismissDirection.startToEnd) {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (_) {
                                    return Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF2e3253)
                                              .withOpacity(0.2),
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            topLeft: Radius.circular(20),
                                          )),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20, bottom: 20),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MyButton(
                                                lable: "عرض",
                                                width: 200,
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Directionality(
                                                        textDirection: ui
                                                            .TextDirection.rtl,
                                                        child: AlertDialog(
                                                          shape: Border.all(
                                                              color: colorIcon,
                                                              width: 6),
                                                          title: Text(
                                                            item.title,
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
                                                                Row(
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
                                                                ),
                                                                Text(
                                                                  item.note,
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
                                                }),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            MyButton(
                                                lable: "تعديل",
                                                width: 200,
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (_) {
                                                    return EditOldTaskePage(
                                                      oldTask: item,
                                                    );
                                                  }));
                                                }),
                                            MyButton(
                                                lable: "حذف",
                                                width: 200,
                                                onTap: () {
                                                  AppSharedPreference
                                                      .deleteTask(item.id ?? 0);
                                                  //  AppSharedPreference.updateTask(taskOnEditing,taskOnEditing.id??0 );
                                                  Navigator.pop(context);
                                                }),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                              return false;
                            }
                          },
                          key: UniqueKey(),
                          child: Container(
                            padding: const EdgeInsets.all(0.8),
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xff01305a).withAlpha(20),

                              borderRadius: BorderRadius.circular(20),
                              //  boxShadow: BoxShadow.lerpList(a, 10, 10),
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                            child: ListTile(
                              title: Text(item.title),
                              subtitle: Text(
                                item.note,
                                maxLines: 2,
                              ),

                              // trailing: Text("${task.remind.toString()}"),
                            ),
                          ),
                        );
                        /*  ListTile(
                          title: Text("${task.title}"),
                          subtitle: Text("${task.note}"),
                          trailing: Text("${task.remind.toString()}"),

                        );*/
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        locale: "ar",
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectedTextColor: Colors.white,
        selectionColor: const Color(0xff597d9b),
        dateTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        onDateChange: (date) {
          setState(() {
            _selectedDate = date;
            listTasks
              ..clear()
              ..addAll(AppSharedPreference.getTask(filterDate: _selectedDate));
          });
        },
      ),
    );
  }

  _addTaskBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMd().format(DateTime.now()).toString(),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff01305a),
                ),
              ),
              const Text(
                "اليوم",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff01305a),
                ),
              ),
            ],
          ),
          /* MyButton(
            lable: "+ إضافة مهمة ",
            width: 110,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTaskePage(),
                  ));
            },
          ),*/
        ],
      ),
    );
  }
}

/*
onLongPress: (){
Provider.of<MyProvider>(context,listen: false).removeTask(task);
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text("Task deleted"),
duration: Duration(seconds: 2),));

Provider.of<MyProvider>(context, listen: false).notifyListeners();}*/
