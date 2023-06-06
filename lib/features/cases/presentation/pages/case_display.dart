import 'package:final_project1/core/my_expansion/item_expantsion.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/cases_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/my_expansion/my_expansion_widget.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import '../widgets/case_detail.dart';
import '../widgets/case_field.dart';

class Case_Display extends StatefulWidget {
  Case_Display({Key? key}) : super(key: key);

  @override
  State<Case_Display> createState() => _Case_DisplayState();
}

class _Case_DisplayState extends State<Case_Display> {
  final List<String> list = [
    'حالة القضية',
    'تفاصيل إضافية',
    'جلسات القضية',
    'مرفقات القضية',
    'القرارات'
  ];
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: build_appBar(title: 'تفاصيل القضية'),
      body: SingleChildScrollView(
        child: MyExpansionWidget(
          items: list
              .map((e) => ItemExpansion(
                  header: Text(
                    e,
                    style: TextStyle(fontSize: 25, color: colorText),
                  ),
                  body: Container(
                    height: 100.0,
                    color: Colors.red,
                  )))
              .toList(),
        ),
      ),
    );
  }
}
