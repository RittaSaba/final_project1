
import 'package:flutter/material.dart';
import '../../../../core/app_theme.dart';

class UserProfilScreen extends StatefulWidget {
  UserProfilScreen({Key? key}) : super(key: key);

  @override
  State<UserProfilScreen> createState() => _UserProfilScreenState();
}

class _UserProfilScreenState extends State<UserProfilScreen> {
  bool isObscurePassword = true;
  final textController = TextEditingController();
  final textPassword = TextEditingController();

  validglobal(String val) {
    if (val.isEmpty) return "field can not empty";
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            //automaticallyImplyLeading: false,
            elevation: 0,
            toolbarHeight: 90,
            backgroundColor: Colors.white,

            title: Text("الملف الشخصي"),

            flexibleSpace: Stack(
              children: [
                Container(
                  //height: 100,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35)),
                    color: Colors.white,
                    gradient: LinearGradient(
                      colors: [(Color(0xF001305C)), (Color(0xFF587D99))],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body:
          Container(
            padding: EdgeInsets.only(left: 15, top: 20, right: 15),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(width: 4, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/ll.jpg"),
                                )),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white,
                                  ),
                                  color: Color(0xFF587D99),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'هل تريد تعديل كلمة المرور الحالية..؟',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  buildTextFild(
                      "كلمة المرور الحالية ","",

                      true
                  ),
                  buildTextFild("كلمة المرور الجديدة ", "", true),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            gradient: LinearGradient(
                              colors: [
                                (Color(0xF001305C)),
                                (Color(0xFF587D99))
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            )),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "حفظ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            elevation: 5,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(
                          "إلغاء",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xF001305C),
                              fontWeight: FontWeight.bold),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
      ),
    );
  }

  Widget buildTextFild(
      String lableText, String placrholder, bool isPasswordTextFild) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: TextFormField(
        obscureText: isPasswordTextFild ? isObscurePassword : false,

        decoration: InputDecoration(
          //  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: colorText),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorbar),
            ),
            suffixIcon: isPasswordTextFild
                ? IconButton(
                onPressed: () {
                  isObscurePassword = !isObscurePassword;
                },
                icon: Icon(Icons.remove_red_eye, color: colorIcon))
                : null,
            contentPadding: EdgeInsets.all(8),
            labelText: lableText,
            labelStyle: TextStyle(
                color: colorText, fontSize: 20, fontWeight: FontWeight.bold),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placrholder,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}
