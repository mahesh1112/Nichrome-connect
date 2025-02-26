
/*
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nichrome_test/features/shop/screens/home/widgets/home.dart';
import 'package:nichrome_test/localization/mahesh/storagemethods.dart';

import '../../../search2.dart';
// import 'package:nichrome/Authenticate/AuthMethods.dart';
// import '../common/utils.dart';





class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}


Future profileimage(Uint8List file)async{
  String Profile =await  StorageMethods().StoreImage("Name",file, true);
  FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).set({
    "Profile": Profile
  });
}

pickimage(ImageSource source)async{
final ImagePicker imagePicker = ImagePicker();
XFile? file = await imagePicker.pickImage(source: source);
Uint8List img = await file!.readAsBytes();
return img;
}


class _ProfilescreenState extends State<Profilescreen> {

  String name = "";
  String email = "";
  String role = "";
  String phone = "";
  Uint8List? image;
  String? profile;

  void initState(){
    getdata();
    getimage();
    super.initState();
  }

  getdata() async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['FirstName'];
      email = (snap.data() as Map<String, dynamic>)["Email"];
      role = (snap.data() as Map<String, dynamic>)["LastName"];
      phone = (snap.data() as Map<String, dynamic>)["PhoneNumber"];
    });
  }

  getimage()async{
    DocumentSnapshot pro = await FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).get();
    profile = (pro.data() as Map<String, dynamic>)['Profile'];

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
              profile == null?
              CircleAvatar(
                backgroundImage: AssetImage('assets/icons/profile_img.png'),
                backgroundColor: Colors.white,
                maxRadius: 80,
              ):
              CircleAvatar(
                backgroundImage: NetworkImage(profile!),
                backgroundColor: Colors.white,
                maxRadius: 80,
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton(
                      onPressed: ()async{
                        Uint8List file = await pickimage(ImageSource.gallery);
                        if(file!= null){
                          setState(() {
                            image = file;
                          });
                        }
                        if(image!= null){
                          profileimage(file);
                        }
                        Navigator.of(context).pop();
                      },
                    child: Icon(Icons.camera_alt_outlined),
                  ))
            ],
          )),
          SizedBox(height: 30.0,),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Name"),
            subtitle: Text(name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          SizedBox(height: 20.0,),
          ListTile(
              leading: Icon(Icons.email),
              title: Text("Email id"),
              subtitle: Text(email,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

          ),
          SizedBox(height: 20.0,),
          ListTile(
              leading: Icon(Icons.verified_user),
              title: Text("Role"),
            subtitle: Text(role,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),
          SizedBox(height: 20.0,),
          ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone No."),
              subtitle: Text(phone,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          ),

        ]),
      ),
    );
  }
}
*/



import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nichrome_test/localization/mahesh/storagemethods.dart';

class Profilescreen extends StatefulWidget {
  const Profilescreen({Key? key}) : super(key: key);

  @override
  State<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  String name = "";
  String email = "";
  String role = "";
  String phone = "";
  Uint8List? image;
  String? profile;

  @override
  void initState() {
    super.initState();
    getdata();
    getimage();
  }

  // Fetch user data from Firestore
  Future<void> getdata() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['FirstName'] ?? "";
      email = (snap.data() as Map<String, dynamic>)["Email"] ?? "";
      role = (snap.data() as Map<String, dynamic>)["LastName"] ?? "";
      phone = (snap.data() as Map<String, dynamic>)["PhoneNumber"] ?? "";
    });
  }

  // Fetch profile image URL from Firestore
  Future<void> getimage() async {
    DocumentSnapshot pro = await FirebaseFirestore.instance
        .collection("profile")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    setState(() {
      profile = (pro.data() as Map<String, dynamic>?)?['Profile'];
    });
  }

  // ==================== 🟨 Change 1: Null safety check added for file 🟨 ====================
  // Pick image from gallery
  Future<Uint8List?> pickimage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);

    // Check if the file is not null and return it as bytes
    if (file != null) {
      return await file.readAsBytes();
    }
    return null; // Return null if no file was picked
  }

  // ==================== 🟨 Change 2: Upload and Update Profile Picture 🟨 ====================
  // Upload profile image to Firebase Storage and update Firestore
  Future<void> profileimage(Uint8List file) async {
    try {
      String profileUrl =
      await StorageMethods().StoreImage("ProfileImages", file, true);

      // Update Firestore with the new profile image URL
      await FirebaseFirestore.instance
          .collection("profile")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({"Profile": profileUrl}, SetOptions(merge: true));

      // Update the UI state with the new profile image URL
      setState(() {
        profile = profileUrl;
      });
    } catch (e) {
      // Show error if upload fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to upload image: $e')),
      );
    }
  }

  @override
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
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  // ==================== 🟨 Change 3: Conditional Avatar Image 🟨 ====================
                  CircleAvatar(
                    backgroundImage: profile != null
                        ? NetworkImage(profile!) // Show network image if available
                        : AssetImage('assets/icons/profile_img.png')
                    as ImageProvider, // Default image if not available
                    backgroundColor: Colors.white,
                    maxRadius: 80,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton(
                      onPressed: () async {
                        Uint8List? file = await pickimage(ImageSource.gallery);
                        if (file != null) {
                          await profileimage(file); // Upload image if picked
                        }
                      },
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Name"),
              subtitle: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email id"),
              subtitle: Text(
                email,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text("Role"),
              subtitle: Text(
                role,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Phone No."),
              subtitle: Text(
                phone,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
