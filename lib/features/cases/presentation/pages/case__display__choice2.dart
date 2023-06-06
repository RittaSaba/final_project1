
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/app_theme.dart';
import '../../../../core/widgets/appBar_widget.dart';
import '../../../user_profile/ui/pages/change_password_in_user_profil_screen.dart';
import '../widgets/case_field.dart';
import '../widgets/staggered_grid_tile_widget.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
var imagesList = [
  "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg",
   "https://cdn.pixabay.com/photo/2015/04...",
  "https://encrypted-tbn0.gstatic.com/im...",
  "https://cdn.pixabay.com/photo/2013/07...",
  "https://thumbs.dreamstime.com/b/pictu...",
  "https://images.pexels.com/photos/2063...",
  "https://i.pinimg.com/originals/4c/52/...",
  "https://coolhdwall.com/storage1/20210..."
];
class Case_Display_Num2 extends StatefulWidget {
  Case_Display_Num2 ({Key? key}) : super(key: key);

  @override
  State<Case_Display_Num2 > createState() => _Case_Display_Num2State();
}

class _Case_Display_Num2State extends State<Case_Display_Num2 > {
  final List<String> list =[' تفاصيل القضيّة ',' حالة القضيّة ',' جلسات القضيّة ',' مرفقات القضيّة ',' القرارات '];
  bool isPressed=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: build_appBar(title: 'تفاصيل القضية'),
      body: Container(
        margin: EdgeInsets.all(12),
        child:StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),

                child: Material(
                  elevation: 30,
                  shadowColor: colorbar,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
padding: EdgeInsets.all(8),

                    decoration: BoxDecoration(

                        color: colorContainer,
                        borderRadius: BorderRadius.all(
                            Radius.circular(15))
                    ),
                    child: buildStaggeredGridTileWidget(list[index]),
                  ),
                ),
              );
            },
            staggeredTileBuilder: (index) {
              return StaggeredTile.count(1, index.isEven ? 1.2 : 1);
            }
        ),));
  }
}
