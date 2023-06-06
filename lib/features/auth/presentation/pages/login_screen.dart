import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/features/summaries/data/request/login__request.dart';
import 'package:final_project1/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../../generated/assets.dart';
import '../../../cases/presentation/widgets/defaultFormField.dart';
import '../../../summaries/bloc/login_cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool rememberMePassword = false;
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginInitial>(
          listenWhen: (previous, current) => current.statuses.isDone,
          listener: (context, state) {
            Navigator.pushReplacementNamed(context, RouteName.basicScreen);
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: build_appBar(title: 'تسجيل الدخول '),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 70,
                      //backgroundColor: Colors.amber,
                      backgroundImage: AssetImage(
                        Assets.assetsLl,
                      ),
                    ),
                    60.vSpace,
                    defaultFormField(
                        isPassword: false,
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Phone must not be empty';
                          }
                          return null;
                        },
                        hintText: 'رقم الهاتف',
                        prefix: Icons.phone_android),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                        controller: passwordController,
                        isPassword: isPassword,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value.isEmpty) {
                            return 'Password is to o short';
                          }
                          return null;
                        },
                        suffixPressed: () {
                          setState(() {
                            isPassword = !isPassword;
                          });
                        },
                        hintText: 'كلمة المرور',
                        prefix: Icons.lock,
                        suffix: isPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMePassword,
                          activeColor: colorIcon,
                          tristate: false,
                          onChanged: (newBool) {
                            setState(() {
                              rememberMePassword = !rememberMePassword;
                            });
                          },
                        ),
                        Text(
                          'تذكرني',
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: colorText),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: BlocBuilder<LoginCubit, LoginInitial>(
                        builder: (context, state) {
                          if (state.statuses.isLoading) {
                            return const CircularProgressIndicator.adaptive();
                          }

                          return MaterialButton(
                            color: Colors.white,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                final request = LoginRequest(
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );

                                context
                                    .read<LoginCubit>()
                                    .login(context, request: request);
                              }
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                color: colorText,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
