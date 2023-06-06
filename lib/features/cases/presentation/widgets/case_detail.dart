
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

Widget buildCaseDetail({ required String title,required bool isPressed}){
  return Card(

    color: colorbar,

    elevation: 50,
    //shape: CircleBorder(side: BorderSide(width: 20)),
    child:
    InkWell(

      borderRadius: BorderRadius.circular(50),


      onTap: (){

          isPressed=!isPressed;

        /*    Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Directionality(textDirection: TextDirection.rtl,child: Case_Display());
                  }));*/

      },
      child: Row(children: [isPressed?Icon(Icons.arrow_right,size: 50,color: colorIcon,):
      Icon(Icons.arrow_drop_down,size: 50,color: colorIcon,),
        Text(title,style: TextStyle(fontSize: 25,color: colorText),)],),
    ),
  );
}