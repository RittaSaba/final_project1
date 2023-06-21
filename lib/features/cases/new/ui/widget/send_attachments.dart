

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

FilePickerResult? result;

String?_fileName;

PlatformFile?pickedfile;



File?fileToDisplay;


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
}