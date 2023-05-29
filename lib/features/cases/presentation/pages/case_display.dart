
import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../profile/presentation/pages/userProfilScreen.dart';
import '../widgets/case_field.dart';

class Case_Display extends StatefulWidget {
  Case_Display({Key? key}) : super(key: key);

  @override
  State<Case_Display> createState() => _Case_DisplayState();
}

class _Case_DisplayState extends State<Case_Display> {
  final List<String> list =['حالة القضية','تفاصيل إضافية','جلسات القضية','مرفقات القضية','القرارات'];
bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: build_appBar(title: 'تفاصيل القضية'),
      body: Container(
        padding: EdgeInsets.only(top: 2),

        //alignment: Alignment.topCenter,
        child: ListView(

          padding: EdgeInsets.all(10),
          //scrollDirection: Axis.vertical,
          children: list.map((e) {
            return Card(

              color: colorbar,

              elevation: 50,
              //shape: CircleBorder(side: BorderSide(width: 20)),
              child:
              InkWell(

borderRadius: BorderRadius.circular(50),


                onTap: (){
                  setState(() {
                    isPressed=!isPressed;
                  });
              /*    Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Directionality(textDirection: TextDirection.rtl,child: Case_Display());
                  }));*/

                },
                child: Row(children: [isPressed?Icon(Icons.arrow_right,size: 50,color: colorIcon,):
                Icon(Icons.arrow_drop_down,size: 50,color: colorIcon,),
                  Text(e,style: TextStyle(fontSize: 25,color: colorText),)],),
              ),
            );
          }).toList(),
        ),
      ),);
  }
}
