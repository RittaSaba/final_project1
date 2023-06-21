/*
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';*/
/*
class sendAttachment extends StatefulWidget {
  const sendAttachment({Key? key}) : super(key: key);

  @override
  _sendAttachmentState createState() => _sendAttachmentState();
}

class _sendAttachmentState extends State<sendAttachment> {
  //
  File? _image;
  Future getImage(ImageSource source) async {
    try {
        final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
     final imagePermanent = await saveFilePermanently(image.path);
      setState(() {
      //  this._image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveFilePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  void openFiles() async {
    FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
    if (resultFile != null) {
      PlatformFile file = resultFile.files.first;
      print(file.name);
      print(file.bytes);
      print(file.extension);
      print(file.path);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Future _showImageDialog() async {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  title: 'Pick from Camera',
                  icon: Icons.camera,
                  onClick: () => getImage(ImageSource.camera),
                ),
                CustomButton(
                    title: 'Pick from Gallery',
                    icon: Icons.image_outlined,
                    onClick: () => getImage(ImageSource.gallery)),
                CustomButton(
                    title: 'Pick a pdf',
                    icon: Icons.picture_as_pdf,
                    onClick: () => openFiles()),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(_showImageDialog),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "إرسال مرفقات",
        style: TextStyle(
          fontFamily: 'Cairo',
        ),
      ),
    );
  }

  Widget _buildBody(_showImageDialog()) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _showImageDialog(); // openFiles();
                },
                child: Container(
                  width: 150,
                  height: 50,
                  color: Colors.lightBlue,
                  child: Center(
                    child: Text(
                      "Open file",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            _image != null
                ? Image.file(
              _image!,
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            )
                : Image.network(
                'https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg'),
          ],
        ));
  }

  Widget CustomButton({
    required String title,
    required IconData icon,
    required VoidCallback onClick,
  }) {
    return Container(
      width: 300,
      child: ElevatedButton(
          onPressed: onClick,
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 20,
              ),
              Text(title),
            ],
          )),
    );
  }
}
*/