import 'package:flutter/material.dart';


class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    Key? key,
    this.margin,
    this.padding,
    this.cardColor,
    required this.child,
    this.elevation = 2,
    this.radios,
  }) : super(key: key);

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? cardColor;
  final Widget child;
  final double elevation;
  final double? radios;

  @override
  Widget build(BuildContext context) {
    var innerPadding =
        padding ?? EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0);

    //محتوى البطاقة
    final cardChild = Padding(padding: innerPadding, child: child);

    return Card(
      margin: margin,
      color: cardColor,
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radios ?? 12.0),
      ),
      child: cardChild,
    );
  }
}
