import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_theme.dart';
import '../../../../send_attachment.dart';
import '../../../attachments/presentation/widgets/send_attachments.dart';
FilePickerResult? result;

String?_fileName;

PlatformFile?pickedfile;



File?fileToDisplay;
TextButton buildTextButton(String name,double size,BuildContext context) {

  return TextButton(
    onPressed: (){

      openDialog(context);


    }, child: Row(

    children: [
      Icon(Icons.send_rounded,size: size,color: colorbar,),
      SizedBox(width:8,),
      Text(name),
    ],

  ),


  );
}

void openDialog(BuildContext context) {
  showDialog(context: context, builder: (context)=>AlertDialog(content:

  TextButton(child: Text("اختيار الصور من المعرض"),onPressed: (){buildPickFile(context);},),),);}

/*
void pickFile(BuildContext context)async{
  try{

    result =await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: true);
//add the photos to the database
    if(result!=null){
      //send attachments to the database
      _fileName=result!.files.first.name;
      pickedfile=result!.files.first;
      fileToDisplay=File(pickedfile!.path.toString());
      print("File name $_fileName");

    }

  }catch(e){
    print(e);
  }
  Navigator.of(context).pop();
}*/