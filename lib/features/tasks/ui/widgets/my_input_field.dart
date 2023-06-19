import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  final Color backgroundColor = Colors.white;
  final bool colorhint=true;


  const MyInputField(
      {Key? key,
        required this.title,
        required this.hint,
        this.controller,
        this.widget,

      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xff01305a),

            ),
          ),
          Container(
            height: 52,
            padding: const EdgeInsets.only(left: 14),
            margin: const EdgeInsets.only(top: 8.0),

            decoration: BoxDecoration(
              color: const Color(0xff01305a).withAlpha(20),

              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(

                      readOnly: widget==null?false:true,
                      autofocus: false,
                      cursorColor: Colors.grey[700],
                      controller: controller,

                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        //   backgroundColor: Colors.red

                      ),
                      decoration: InputDecoration(
                          hintText: hint,
                          //focusColor: Colors.red,

                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:Colors.grey,

                          ),


                          focusedBorder: const UnderlineInputBorder(

                            borderSide: BorderSide.none,

                          ),
                          enabledBorder: const OutlineInputBorder(

                            borderSide: BorderSide.none,

                          )
                      ),
                    )
                ),
                widget==null?Container():Container(child: widget,)
              ],
            ),
          ),
        ]));
  }
}