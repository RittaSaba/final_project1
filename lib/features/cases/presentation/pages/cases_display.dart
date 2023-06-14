


import 'package:final_project1/features/cases2/bloc/cases2_cubit/GetCaseCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme.dart';
import '../../../../router/app_router.dart';
import '../../../cases2/bloc/cases2_cubit/GetCaseInitial.dart';

import '../widgets/case_field.dart';
import '../widgets/text_button.dart';

class CaseDisplayfinal extends StatefulWidget {
  const CaseDisplayfinal({Key? key}) : super(key: key);

  @override
  State<CaseDisplayfinal> createState() => _CaseDisplayfinalState();
}

class _CaseDisplayfinalState extends State<CaseDisplayfinal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<GetCaseCubit, GetCaseInitial>(
          builder: (context, state) {
            return Container(
              padding: EdgeInsets.only(top: 2),

              //alignment: Alignment.topCenter,
              child: ListView(
                  padding: EdgeInsets.all(10),
                  //scrollDirection: Axis.vertical,
                  children:
                  [ Card(
                    color: colorContainer,
                    elevation: 20, shadowColor: colorbar,
                    //shape: CircleBorder(side: BorderSide(width: 20)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.caseDetails);
                      },
                      child: Column(
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          buildCaseField("اسم القضية   :   ", " ${state.result.title}"),
                          // buildCaseField("اسم المحامي  :   ", e.Status),
                          // buildCaseField("اسم الموكل    :   ", e.case_room),
                          // buildCaseField("تاريخ القضية :  ", e.court_id
                          //     .toString()),

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
                  )
                  ]

              ),
            );
          },
        ));
  }
}
