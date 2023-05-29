
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Send_Attachment extends StatefulWidget {

  @override
  State<Send_Attachment> createState() => _Send_AttachmentState();
}

class _Send_AttachmentState extends State<Send_Attachment> {
  FilePickerResult? result;

  String?_fileName;

  PlatformFile?pickedfile;

  bool isLoading=false;

  File?fileToDisplay;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
    [Center(child: isLoading?CircularProgressIndicator():TextButton(onPressed: (){
      pickFile();},child: Text("Pick File"),),),
      if(pickedfile!=null)
      SizedBox(height: 300,width: 400,
        child: Image.file(fileToDisplay!),)],),);
  }
  void pickFile()async{
    try{
      setState(() {
        isLoading=true;
      });
      result =await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: true);

      if(result!=null){
        //send attachments to the database
        _fileName=result!.files.first.name;
        pickedfile=result!.files.first;
        fileToDisplay=File(pickedfile!.path.toString());
        print("File name $_fileName");

      }
      setState(() {
        isLoading=false;
      });
    }catch(e){
      print(e);
    }
  }
}
