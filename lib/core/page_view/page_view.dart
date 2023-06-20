
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../features/auth/presentation/pages/login_screen.dart';
import '../../router/app_router.dart';
import '../util/shared_preferences.dart';
import 'intro1.dart';
import 'intro2.dart';
import 'intro3.dart';

class PView extends StatefulWidget {
  const PView({Key? key}) : super(key: key);

  @override
  State<PView> createState() => _PViewState();
}

class _PViewState extends State<PView> {

  PageController _controller = PageController();

  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(
                children: [ PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      lastPage = (index == 2);
                    });
                  },
                  children: [
                    Intro1(),
                    Intro2(),
                    Intro3(),
                  ],
                ),

                  Container(
                    alignment: Alignment(0, 0.75),

                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _controller.jumpToPage(2);
                            },
                            child: Text("تخطي", style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xF001305C),
                            ),),
                          ),
                          SmoothPageIndicator( controller: _controller,
                            count: 3,
                            effect: ScaleEffect(
                              dotHeight: 8,
                              dotWidth: 10,
                              dotColor: Colors.grey,
                              activeDotColor:Color(0xF001305C),

                              radius: 5,
                              strokeWidth: 1,
                              spacing: 10,
                            ),

                          ),
                          lastPage ?
                          GestureDetector(
                              onTap: () {
                                if (AppSharedPreference.isLogin()) {
                                  Navigator.pushReplacementNamed(context, RouteName.basicScreen);
                                } else {
                                  Navigator.pushReplacementNamed(context, RouteName.login);
                                }
                                _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn,);
                              },
                              child: Text("تم", style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xF001305C))))
                              : GestureDetector(
                            onTap: () {
                              _controller.nextPage(

                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeIn,
                              );

                            },
                            child: Text("التالي", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xF001305C)),
                            ),)


                        ]),

                  ),
                ])),
      ),
    );
  }
}