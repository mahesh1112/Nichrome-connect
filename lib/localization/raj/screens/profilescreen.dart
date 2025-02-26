import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nichrome_test/localization/mahesh/storagemethods.dart';

import 'utils1.dart';

// import 'package:nichrome/Authenticate/AuthMethods.dart';
// import '../common/utils.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

Future profileimage(Uint8List file) async {
  String Profile = await StorageMethods().StoreImage("Name", file, true);
  FirebaseFirestore.instance
      .collection("profile")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .set({"Profile": Profile});
}

class _ProfilescreenState extends State<Profilescreen> {
  String name = "";
  String email = "";
  String role = "";
  String phone = "";
  Uint8List? image;
  String? profile;

  void initState() {
    getdata();
    getimage();
    super.initState();
  }

  getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['FirstName'];
      email = (snap.data() as Map<String, dynamic>)["Email"];
      role = (snap.data() as Map<String, dynamic>)["LastName"];
      phone = (snap.data() as Map<String, dynamic>)["PhoneNumber"];
    });
  }

  getimage() async {
    DocumentSnapshot pro = await FirebaseFirestore.instance
        .collection("profile")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    profile = (pro.data() as Map<String, dynamic>)['Profile'];
  }

  void selectimage() async {
    Uint8List img = pickimage(ImageSource.gallery);
    setState(() {
      image = img;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          Center(
              child: Stack(
            children: [
              image != null
                  ? CircleAvatar(
                      backgroundImage: MemoryImage(image!),
                      backgroundColor: Colors.white,
                      maxRadius: 80,
                    )
                  : CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/icons/profile_img.png'),
                      backgroundColor: Colors.white,
                      maxRadius: 80,
                    ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton(
                    onPressed: selectimage,
                    child: Icon(Icons.camera_alt_outlined),
                  ))
            ],
          )),
          SizedBox(
            height: 30.0,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
            subtitle: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email id"),
            subtitle: Text(
              email,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text("Role"),
            subtitle: Text(
              role,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("Phone No."),
            subtitle: Text(
              phone,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
