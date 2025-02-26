import 'dart:nativewrappers/_internal/vm/lib/typed_data_patch.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';


final FirebaseStorage storage = FirebaseStorage.instance;

class StoredData{
Future<String> uploadimagetostorage(String childname,file)async{
  Reference ref = storage.ref().child(childname);
  UploadTask uploadTask = ref.putData(file);
  TaskSnapshot snapshot = await uploadTask;
  String downloadurl = await snapshot.ref.getDownloadURL();
  return downloadurl;
}
}