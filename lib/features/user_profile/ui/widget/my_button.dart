import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.lable,
    required this.onTap,
    this.width,
    this.buttonColor,
  }) : super(key: key);

  final String lable;
  final Function() onTap;
  final double? width;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        width: width ?? 150.0,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: buttonColor ?? Colors.transparent,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            lable,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
