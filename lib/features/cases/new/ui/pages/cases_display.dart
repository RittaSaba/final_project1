import 'package:collection/collection.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/GetCaseCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_theme.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../router/app_router.dart';
import '../../bloc/cases_cubit/GetCaseInitial.dart';

import '../widget/case_field.dart';
import '../widget/text_button.dart';

class CaseDisplayfinal extends StatefulWidget {
  const CaseDisplayfinal({Key? key}) : super(key: key);

  @override
  State<CaseDisplayfinal> createState() => _CaseDisplayfinalState();
}

class _CaseDisplayfinalState extends State<CaseDisplayfinal> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCaseCubit, GetCaseInitial>(
      builder: (context, state) {
         if (state.statuses.isLoading) {
          return const LoadingWidget();
         }
        return Container(
          padding: const EdgeInsets.only(top: 2),

          //alignment: Alignment.topCenter,
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return 10.vSpace;
            },
            itemBuilder: (context, index) {
              final item  = state.result.cases[index];
              return Card(
                color: colorContainer,
                elevation: 20, shadowColor: colorbar,
                //shape: CircleBorder(side: BorderSide(width: 20)),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.caseDetails,arguments: item);
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      buildCaseField("المحامي :   ", item.lawyers.firstOrNull?.firstName??''),
                      buildCaseField("الموكل  :   ", 'item.clients'),
                      // buildCaseField("تاريخ القضية :  ", e.court_id
                      //     .toString()),

                      // SizedBox(height: 0.2,),
                      const Divider(),
                      !AppSharedPreference.isUser
                          ? const SizedBox()
                          : Container(
                        //color: Colors.grey[200],

                        margin: const EdgeInsets.only(
                          top: 2,
                        ),

                        child: buildTextButton("ارسال مرفق", 18, context),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: state.result.cases.length,
            padding: const EdgeInsets.all(10),
            //scrollDirection: Axis.vertical,
          ),
        );
      },
    );
  }
}
