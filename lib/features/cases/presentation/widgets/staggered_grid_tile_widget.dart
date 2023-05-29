

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../core/app_theme.dart';

Widget buildStaggeredGridTileWidget(String text) {

  return InkWell(onTap: (){},
    child: ClipRRect(

      borderRadius: BorderRadius.all(
          Radius.circular(15),),
      child: Text(text,style: TextStyle(fontSize:20,color: colorText ),),
    ),
  );
}