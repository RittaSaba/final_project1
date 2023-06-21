import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/animation.dart';

import '../../generated/assets.dart';
import '../app_theme.dart';

class Intro2 extends StatelessWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Container(
        padding:EdgeInsets.only(top: 75,left: 20,right: 20) ,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(Assets.assetsTasklist,width: 275),
              SizedBox(
                height: 15,
              ),
              //Text(
              SizedBox(height: 30,),
              Text("قم بإدارة مهامك..!",style: TextStyle(
                fontSize: 35,fontWeight: FontWeight.bold,
                color: colorText,

              ),),
              SizedBox(height: 10,),
              Text("مما يضمن لك تنظيمًا احترافيًا وتحقيق أهدافك بكفاءة عالية",style: TextStyle(
                fontSize: 15,
                color: colorText,

              ),),


            ],
          ),
        ),
      ),
    );
  }
}