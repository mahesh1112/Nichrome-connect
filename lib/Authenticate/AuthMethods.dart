import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'StorageMethods.dart';



class AuthMethods{
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> RegisterWithEmailAndPassword(String Name, String Email, String Password, String Role, String phone)async{
    String ref =  "error";
    try{
      UserCredential user = await _auth.createUserWithEmailAndPassword(email: Email, password: Password);
      _firestore.collection("users").doc(_auth.currentUser!.uid).set({
        "Name": Name,
        "Email": Email,
        "Role": Role,
        "Phone": phone,
        "Password": Password,

      });
      ref = "success";
    }on FirebaseAuthException catch(e){
      return e.message!;
      }
      return ref;
  }

  Future Profile(Uint8List file)async{
    String Profile =await  StorageMethods().StoreImage("Name",file, true);
    _firestore.collection("profile").doc(_auth.currentUser!.uid).set({
      "Profile": Profile
    });


  }



  Future<String> LoginWithEmailAndPassword(String email, String password)async{
    String ref = "error";
    try{
      UserCredential user = await _auth.signInWithEmailAndPassword(email: email, password: password);
      ref = "success";

    }on FirebaseAuthException catch(e){
      return e.message!;
    }
    return ref;
  }


}

Future profileimage(Uint8List file)async{
  String Profile =await  StorageMethods().StoreImage("Name",file, true);
  FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).set({
    "Profile": Profile
  });


}


