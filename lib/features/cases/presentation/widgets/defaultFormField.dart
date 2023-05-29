import 'package:flutter/material.dart';

import '../../../../core/app_theme.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback onSubmit(String)?,
  VoidCallback onChange(String)?,
  VoidCallback? suffixPressed,
  required String? validate(String),
  required String label,
  required IconData prefix,
  required bool isPassword,
  IconData? suffix,
}) =>
    TextFormField(
      validator: validate,
      controller: controller,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(),
        prefixIcon: Icon(
          prefix,
          color: colorIcon,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                  color: colorIcon,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );
