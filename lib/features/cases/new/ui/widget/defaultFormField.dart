import 'package:flutter/material.dart';

import '../../../../../core/app_theme.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback onSubmit(String)?,
  VoidCallback onChange(String)?,
  VoidCallback? suffixPressed,
  required String? validate(String),
  required String hintText,
  required IconData prefix,
  required bool isPassword,
  IconData? suffix,
}) =>
    Container(
// height: 52,
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 2),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xff01305a).withAlpha(20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator: validate,
        controller: controller,
        onFieldSubmitted: onSubmit,
        onChanged: onChange,
        keyboardType: type,
        obscureText: isPassword,
/*decoration: BoxDecoration(
color: Color(0xff01305a).withAlpha(20),

borderRadius: BorderRadius.circular(12),)*/

        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),

          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

//focusColor: Colors.red,

          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),

          prefixIcon: Icon(
            prefix,
            color: const Color(0xff01305a).withOpacity(0.6),
          ),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixPressed,
                  icon: Icon(
                    suffix,
                    color: const Color(0xff01305a).withOpacity(0.6),
                  ),
                )
              : null,

          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
