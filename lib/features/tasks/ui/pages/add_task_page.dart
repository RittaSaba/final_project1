import 'package:collection/collection.dart';
import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/core/widgets/spinner_widget.dart';
import 'package:final_project1/features/tasks/data/models/local_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as ui;
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import '../../../../core/widgets/appBar_widget.dart';
import '../../../../main.dart';
import '../../../user_profile/ui/widget/my_button.dart';
import '../widgets/entit.dart';
import '../widgets/my_input_field.dart';
import '../widgets/task_page.dart';

class AddTaskePage extends StatefulWidget {
  const AddTaskePage({Key? key}) : super(key: key);

  @override
  State<AddTaskePage> createState() => _AddTaskePageState();
}

class _AddTaskePageState extends State<AddTaskePage> {
  final  localTask = LocalTask(title: "",note: "");

  var now = DateTime.now();
  var _selectedDate = DateTime.now();

  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  final dateC = TextEditingController();
  final startC = TextEditingController();
  final endC = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: ui.TextDirection.rtl, child: Scaffold(
      appBar: build_appBar(title: "إضافة مهمة ", context: context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyInputField(
              title: "العنوان",
              hint: "قم بإضافة عنوان",
              controller: _titleController,
            ),
            MyInputField(
              title: "ملاحظة",
              hint: "قم بإضافةالملاحظة",
              controller: _noteController,

            ),
            MyInputField(
              title: "التاريخ",
              hint: DateFormat.yMd().format(localTask.startTime ?? now),
              controller: dateC,
              widget: IconButton(
                icon: Icon(
                  Icons.calendar_today_outlined,
                  color: const Color(0xff01305a).withOpacity(0.6),
                ),
                onPressed: () {
                  _getDateFromUser();
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputField(
                    title: "وقت البداية",
                    widget: IconButton(
                      icon: Icon(Icons.access_time_rounded,
                          color: const Color(0xff01305a).withOpacity(0.6)),
                      onPressed: () {
                        _getTimeFromUser(isStartTime: true);
                      },
                    ),
                    controller: startC,
                    hint: DateFormat('hh:mm a')
                        .format(localTask.startTime ?? now),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: MyInputField(
                    controller: endC,
                    title: "وقت الانتهاء",
                    widget: IconButton(
                      icon: Icon(Icons.access_time_rounded,
                          color: const Color(0xff01305a).withOpacity(0.6)),
                      onPressed: () {
                        _getTimeFromUser(isStartTime: false);
                      },
                    ),
                    hint:
                    DateFormat('hh:mm a').format(localTask.endTime ?? now),
                  ),
                ),
              ],
            ),
            TitleWidget(
              title: 'تذكير',
              child: SpinnerWidget(
                items: remindList
                    .mapIndexed(
                      (i, e) => SpinnerItem(
                      id: i + 1,
                      item: e,
                      isSelected: e == localTask.remind,
                      name: 'قبل${remindList[i]} دقائق '),
                )
                    .toList(),
                width: double.infinity,
                onChanged: (p0) {
                  localTask.remind = p0.item;
                },
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            TitleWidget(
              title: 'تكرار',
              child: SpinnerWidget(
                items: Repeat.values
                    .mapIndexed(
                      (i, e) => SpinnerItem(
                      id: i + 1,
                      item: e,
                      isSelected: e == localTask.repeat,
                      name: e.getName),
                )
                    .toList(),
                width: double.infinity,
                onChanged: (p0) {
                  localTask.repeat = p0.item;
                },
              ),
            ),
            SizedBox(height: 18,),
            Row(
              children: [
                Expanded(
                  child: MyButton(

                    lable: "إنشاء مهمة",

                    onTap: () {
                      localTask.title = _titleController.text;
                      localTask.note = _noteController.text;

                      AppSharedPreference.addTask(localTask);
                      Navigator.pop(context);
                    },
                    buttonColor: colorbar,
                  ),
                ),
                //_colorPallete(),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: MyButton(
                    lable: "إلغاء",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonColor: Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  _getDateFromUser() async {
    final pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: now,
        lastDate: DateTime(2123),
        cancelText: "إلغاء",
        confirmText: "تأكيد",
        errorInvalidText: "ادخل تاريخ صحيح",
        helpText: "ادخل التاريخ",
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xff597d9b), // لون الخلفية
                onPrimary: Colors.white,
                onSecondary: Colors.red,
              ),
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black), // لون النص
                subtitle2: TextStyle(color: Colors.red),
                // لون النص
                // لون النص
              ),
              dialogBackgroundColor: Colors.white,
              // لون خلفية DatePicker
            ),
            child: child!,
          );
        });

    if (pickerDate != null) {
      setState(() {
        localTask.startTime = localTask.startTime?.copyWith(
          day: pickerDate.day,
          month: pickerDate.month,
          year: pickerDate.year,
        );

        dateC.text = DateFormat.yMd().format(localTask.startTime!);
      });
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickerTime = await _showTimePicker();
    if (pickerTime == null) return;

    if (isStartTime == true) {
      setState(() {
        localTask.startTime = localTask.startTime!.copyWith(
          hour: pickerTime.hour,
          minute: pickerTime.minute,
        );
        startC.text = DateFormat('hh:mm a').format(localTask.startTime ?? now);
      });
    } else {
      setState(() {
        localTask.endTime = localTask.endTime!.copyWith(
          hour: pickerTime.hour,
          minute: pickerTime.minute,
        );
        endC.text = DateFormat('hh:mm a').format(localTask.endTime ?? now);
      });
    }
  }

  Future<TimeOfDay?> _showTimePicker() async {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.dialOnly,
      context: context,
      confirmText: "تأكيد",
      cancelText: "إلغاء",
      hourLabelText: "الساعة",
      minuteLabelText: "الدقائق",
      helpText: "ادخل الوقت",
      errorInvalidText: "ادخل وقت صحيح",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xff597d9b), // لون الخلفية
              onPrimary: Colors.white,
              onSecondary: Colors.red,
            ),
            textTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.black), // لون النص
              subtitle2: TextStyle(color: Colors.red),
              // لون النص
              // لون النص
            ),
            dialogBackgroundColor: Colors.white, // لون خلفية DatePicker
          ),
          child: child!,
        );
      },
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
  }

  /////////
  _validatData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const TaskPage()));
    } else if (!_titleController.text.isNotEmpty ||
        !_noteController.text.isNotEmpty) {
      final snackBar = SnackBar(
        content: const Text(
          "يرجى ملىء الحقول المطلوبة",
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),

        backgroundColor: const Color(0xff01305a).withOpacity(0.4),

        // elevation: 5,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // Navigator.of(context).pushReplacementNamed(routeName)
    }
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key, required this.title, required this.child})
      : super(key: key);
  final String title;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Color(0xff01305a),
          ),
        ),
        5.0.vSpace,
        child
      ],
    );
  }
}
