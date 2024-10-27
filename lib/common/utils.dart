import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Snapshot(String content, context){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(content),
      backgroundColor: Colors.red,
      )
  );
}

pickimage(source)async{
  ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  Uint8List img = await file!.readAsBytes();
  return img;
}
