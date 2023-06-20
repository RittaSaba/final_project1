
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../generated/assets.dart';
import '../app_theme.dart';


class Intro1 extends StatelessWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Container(
        padding:EdgeInsets.only(top: 75,left: 10,right: 20) ,

        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Lottie.asset(Assets.assetsWork,alignment: Alignment.topCenter,width: 230),


            //Text(
            SizedBox(height: 15,),

            Text("مرحبًا بك في Libra...! ",style: TextStyle(
              fontSize: 40,fontWeight: FontWeight.bold,
              color: colorText,

            ),),
            SizedBox(height: 10,),
            Text("نعمل باستمرار على تحسين تجربتكم عبر تطبيقنا ",style: TextStyle(
              fontSize: 20,
              color: colorText,

            ),),
            Text("ضمن فريق محاماة متخصص يقدم خدمات قانونية شاملة لعملائنا ",style: TextStyle(
              fontSize: 15,
              color: colorText,

            ),),

            Text("لضمان تلبية احتياجاتكم القانونية",style: TextStyle(
              fontSize: 15,
              color: colorText,

            ),) ,
            Text("بشكل شامل ومريح...",style: TextStyle(
              fontSize: 15,
              color: colorText,

            ),) ,




          ],
        ),
      ),
    );
  }
}