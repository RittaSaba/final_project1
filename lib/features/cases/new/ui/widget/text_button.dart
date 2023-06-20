import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:final_project1/core/api/api_service.dart';
import 'package:final_project1/core/extensions.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/api/api_url.dart';
import '../../../../../core/app_theme.dart';
import '../../../../../core/util/note_message.dart';
import '../../../../../core/util/shared_preferences.dart';
import '../../../../../send_attachment.dart';
import 'send_attachments.dart';

FilePickerResult? result;

String? _fileName;

PlatformFile? pickedfile;

File? fileToDisplay;

TextButton buildTextButton(String name, double size, BuildContext context) {
  return TextButton(



    onPressed: ()   async {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery);
      final result =   await APIService().uploadMultiPart(
          url: PostUrl.sendAttachment,
          files: [
            image

          ],
          nameFile: 'attachment',
          query: {
            'token': AppSharedPreference.getToken(),
          });

      loggerObject.wtf(result.statusCode);
      if(result.statusCode.success)
        return NoteMessage.showSuccessSnackBar(
            message: 'تم', context: context);
    },
    child: Row(
      children: [
        Icon(
          Icons.send_rounded,
          size: size,
          color: colorbar,
        ),
        SizedBox(
          width: 8,
        ),
        Text(name,style: TextStyle(color: colorbar1),),
      ],
    ),
  );
}

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
