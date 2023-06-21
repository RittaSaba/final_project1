import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../app_theme.dart';



class Intro3 extends StatelessWidget {
  const Intro3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Directionality(textDirection: TextDirection.rtl,
      child: Container(
          padding: EdgeInsets.only(top:75,right: 20,left: 20),

          child:Column(children: [
            Row(children:[Lottie.asset(Assets.assetsSsss,width: 175),
              Lottie.asset(Assets.assetsTimer1,width: 100),]),
            SizedBox(height: 10,),
            Row(children:[
              Lottie.asset(Assets.assetsSet,width: 150),
              Lottie.asset(Assets.assetsCompletingTasks,width: 150),


            ]),
            SizedBox(height: 20,),
            Text("نسعى جاهدين لتقديم تجربة إدارة مكتبية محسّنة لعملائنا.",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorText,

            ),),
            SizedBox(height: 10,),
            Text("انضم إلينا الان.....",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: colorText,

            ),),


            //    Lottie.asset('images/ssss.json',width: 300),
          ],)

      ),
    );




    //   RiveAnimation.asset("images/1.riv",),
    /* Positioned.fill(child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5,sigmaY:5,),
        child: SizedBox(),)
        ),*/



  }
}