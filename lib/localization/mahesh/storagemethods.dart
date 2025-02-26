  
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageMethods{
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> StoreImage(String childname, Uint8List file,bool isprofile)async{
    Reference? ref;
    if(isprofile) {
       ref = await _storage.ref().child("profile").child(
          _auth.currentUser!.uid);
    }
    else {
       ref = await _storage.ref().child("product").child(
          _auth.currentUser!.uid).child(childname);
    }
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;

  }

  Future StoreProductInfo(String name, String price, Uint8List file)async{
    String uid = _auth.currentUser!.uid;

    DocumentSnapshot snap = await _firestore.collection("users").doc(uid).get();
    String user = (snap.data() as Map<String, dynamic>)['Name'];

    String ref = "error";
    try{
      String downloadurl = await StoreImage(name, file, false);
      _firestore.collection("Products").doc(uid).set({
        "Seller": user,
        "Name" : name,
        "Price" : price,
        "Image" : downloadurl
      });

      ref = "success";
    }on FirebaseAuthException catch(e){
      return e.message;
    }
    return ref;
  }

}

