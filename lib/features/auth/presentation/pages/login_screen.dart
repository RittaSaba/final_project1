import 'package:final_project1/core/api/api_service.dart';
import 'package:final_project1/core/api/api_url.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:final_project1/core/util/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/error/error_manager.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../cases/presentation/widgets/defaultFormField.dart';
import '../../domain/data/response/login_response.dart';

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
    return Scaffold(
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
                      'assets/ll.jpg',
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
                      label: 'رقم الهاتف',
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
                      label: 'كلمة المرور',
                      prefix: Icons.lock,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off),
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
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: MaterialButton(
                      color: Colors.white,
                      onPressed: () {
                        print("object11");
                        if (formKey.currentState!.validate()) {
                          print("object");
                          postDate();
                        }
                      },
                      child: Text(
                        'تسجيل الدخول',
                        style: TextStyle(
                          color: colorText,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void postDate() async {
    final response = await APIService().postApi(url: PostUrl.login, query: {
      "phone": phoneController.text,
      "password": passwordController.text,
      //   "headers": {}
    });
    if (!response.statusCode.success) {
      print(ErrorManager.getApiError(response));
      return;
    }

    final loginModel = LoginResponse.fromJson(response.toJson);

    AppSharedPreference.cashToken(loginModel.accessToken);
    AppSharedPreference.cashUser(loginModel.user);

    //TODO:

    // var url = "http://192.168.101.228:8000/api/login";

    // try {
    //   var response = await http.post(Uri.parse(url), body: {
    //     "email": phoneController.text,
    //     "password": passwordController.text,
    //     //   "headers": {}
    //   });
    //   if (response.statusCode == 200 || response.statusCode == 201) {
    //     var responseData = json.decode(response.body);
    //     var token1 = responseData['token'];
    //     if (context.mounted) {
    //       Navigator.of(context)
    //           .pushReplacement(MaterialPageRoute(builder: (context) {
    //         return BasicScreen();
    //       }));
    //     }
    //
    //     //  TODO: navigate to home screen
    //   } else {
    //     final snackBar = SnackBar(content: Text("Login Failed"));
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       snackBar,
    //     );
    //     //  err
    //     //    Navigator.of(context).pushReplacementNamed((n == 1 ? '/x1' : n==2 ? '/x4' :'/x5'),
    //     //  navagate to error screen
    //   }
    // } catch (e) {
    //   //  err
    //   print(e);
    //   //    Navigator.of(context).pushReplacementNamed((n == 1 ? '/x1' : n==2 ? '/x4' :'/x5'),
    //   //  navagate to error screen
    // }
  }

/*void PostDate() async {
    var url = "http://192.168.101.228:8000/api/auth/login";



      var response = await http.post(Uri.parse(url), body: {
        "email": phoneController.text,
        "password": passwordController.text,

        //   "headers": {}
      }
      ).timeout(Duration(seconds: 60));
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("2000");
        var responseData = json.decode(response.body);
        var token1 = responseData['token'];



        //  TODO: navigate to home screen
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) {
          return BasicScreen();
        }));
      }if (response.statusCode == 400 || response.statusCode == 401) {
        print(400);
        final snackBar = SnackBar(content: Text("Login Failed"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar,);
        //  err
        //    Navigator.of(context).pushReplacementNamed((n == 1 ? '/x1' : n==2 ? '/x4' :'/x5'),
        //  navagate to error screen

    }
  }*/
}
