import 'package:drawable_text/drawable_text.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/my_expansion/item_expantsion.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/GetCaseCubit.dart';
import 'package:final_project1/features/cases/new/bloc/cases_cubit/GetCasesCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/app_theme.dart';
import '../../../../../core/my_expansion/my_expansion_widget.dart';

import '../../../../../core/widgets/appBar_widget.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import '../../data/response/cases_response.dart';
import '../widget/case_field.dart';

class Case_Display extends StatefulWidget {
  Case_Display({Key? key, required this.modelCase}) : super(key: key);

  final Case modelCase;

  @override
  State<Case_Display> createState() => _Case_DisplayState();
}

class _Case_DisplayState extends State<Case_Display> {
  final List<String> list = [
    'تفاصيل إضافية',
    'جلسات القضية',
    'مرفقات القضية',
    'القرارات'
  ];
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: build_appBar(title: 'تفاصيل القضية', context: context),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          "حالة القضية ",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 5,),
                        Text( widget.modelCase.status,style: TextStyle(fontSize: 18,color: Colors.redAccent),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyExpansionWidget(
                    items: [
                      ItemExpansion(
                        header: DrawableText(text: 'الوقائع و الالتماس '),
                        body: Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              DrawableText(
                                text: "الوقائع :",
                                color: Colors.redAccent,
                                padding: EdgeInsets.all(10.0),
                              ),
                              DrawableText(
                                text: widget.modelCase.facts,
                                padding: EdgeInsets.all(10.0),
                              ),
                              Divider(
                                color: colorbar,
                              ),
                              DrawableText(
                                text: "الالتماس :",
                                color: Colors.redAccent,
                                padding: EdgeInsets.all(10.0),
                              ),
                              DrawableText(
                                text: widget.modelCase.claim,
                                padding: EdgeInsets.all(10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                      ItemExpansion(
                        header: DrawableText(text: 'جلسات القضية'),
                        body: FutureBuilder(
                          future: getCaseSession(widget.modelCase.id),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const LoadingWidget();
                            }
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final item = snapshot.data!.sessions[index];
                                    return Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          DrawableText(

                                            text: "الجلسة رقم " +
                                                    item.number.toString() ??
                                                '',
                                            color: Colors.redAccent,
                                            size: 16,
                                          ),
                                          DrawableText(
                                            text: item.description ?? '',
                                            size: 16,
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return 10.0.vSpace;
                                  },
                                  itemCount: snapshot.data!.sessions.length),
                            );
                          },
                        ),
                      ),
                      ItemExpansion(
                          header: DrawableText(text: 'مرفقات القضية'),
                          body: Container(
                            child: Column(
                              children: [
                                /*widget.modelCase*/
                              ],
                            ),
                          )),
                      ItemExpansion(
                        header: DrawableText(text: 'القرارات'),
                        body: FutureBuilder(
                          future: getCaseDecision(widget.modelCase.id),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const LoadingWidget();
                            }
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    final item =
                                        snapshot.data!.decisions[index];
                                    return Column(
                                      children: [
                                        DrawableText(
                                          text: "  قرار رقم ${item.number} : ",
                                          color: Colors.redAccent,
                                          padding: EdgeInsets.all(6.0),
                                        ),
                                        DrawableText(
                                            text: item.description ?? ''),
                                      ],
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return 10.0.vSpace;
                                  },
                                  itemCount: snapshot.data!.decisions.length),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
