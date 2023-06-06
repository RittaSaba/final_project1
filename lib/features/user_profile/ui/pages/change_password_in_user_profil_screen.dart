import 'dart:async';

import 'package:final_project1/core/app_theme.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/note_message.dart';
import 'package:final_project1/core/widgets/appBar_widget.dart';
import 'package:final_project1/features/cases/presentation/widgets/defaultFormField.dart';
import 'package:final_project1/features/user_profile/data/request/chang_password_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../bloc/change_pass_cubit/change_pass_cubit.dart';
import '../../bloc/get_profile_cubit/get_profile_cubit.dart';
import '../widget/my_button.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  bool isObscurePassword = true;
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();

  validglobal(String val) {
    if (val.isEmpty) return "field can not empty";
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: build_appBar(title: 'تعديل كلمة المرور'),
          body: Container(
            padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  const Text(
                    'هل تريد تعديل كلمة المرور الحالية..؟',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  defaultFormField(
                      controller: newPassController,
                      isPassword: isObscurePassword,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password is to o short';
                        }
                        return null;
                      },
                      suffixPressed: () {
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                      hintText: 'كلمة المرور الحاليّة',
                      prefix: Icons.lock,
                      suffix: isObscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                  defaultFormField(
                      controller: newPassController,
                      isPassword: isObscurePassword,
                      type: TextInputType.visiblePassword,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password is to o short';
                        }
                        return null;
                      },
                      suffixPressed: () {
                        setState(() {
                          isObscurePassword = !isObscurePassword;
                        });
                      },
                      hintText: 'كلمة المرور',
                      prefix: Icons.lock,
                      suffix: isObscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: BlocConsumer<ChangePassCubit, ChangePassInitial>(
                          listenWhen: (previous, current) =>
                              current.statuses.isDone,
                          listener: (context, state) {
                            NoteMessage.showSuccessSnackBar(
                                message: 'تم', context: context);
                            Timer(const Duration(seconds: 1), () {
                              Navigator.pop(context);
                            });
                          },
                          builder: (context, state) {
                            if (state.statuses.isLoading) {
                              return const LoadingWidget();
                            }
                            return MyButton(
                              buttonColor: const Color(0xff597d9b),
                              lable: 'حفظ',
                              width: 170,
                              onTap: () {
                                final request = ChangePasswordRequest(
                                  old: oldPassController.text,
                                  newPass: newPassController.text,
                                );
                                context.read<ChangePassCubit>().changePass(context, request: request);
                              },
                            );
                          },
                        ),
                      ),
                      10.hSpace,
                      Expanded(
                        child: MyButton(
                          buttonColor: Colors.grey[300],
                          lable: 'إلغاء',
                          width: 170,
                          onTap: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget buildTextFild(
      String lableText, String placrholder, bool isPasswordTextFild) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 40,
      ),
      child: TextFormField(
        obscureText: isPasswordTextFild ? isObscurePassword : false,
        decoration: InputDecoration(
            //  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorText),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorbar),
            ),
            suffixIcon: isPasswordTextFild
                ? IconButton(
                    onPressed: () {
                      isObscurePassword = !isObscurePassword;
                    },
                    icon: Icon(Icons.remove_red_eye, color: colorIcon))
                : null,
            contentPadding: const EdgeInsets.all(8),
            labelText: lableText,
            labelStyle: TextStyle(
                color: colorText, fontSize: 20, fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placrholder,
            hintStyle: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
