//import 'dart:html';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nichrome/Authenticate/AuthMethods.dart';
import '../common/utils.dart';

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

  void initState(){
    getdata();
    getimage();
    super.initState();
  }

  getdata() async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['Name'];
      email = (snap.data() as Map<String, dynamic>)["Email"];
      role = (snap.data() as Map<String, dynamic>)["Role"];
      phone = (snap.data() as Map<String, dynamic>)["Phone"];


    });
  }

  getimage()async{
    DocumentSnapshot pro = await FirebaseFirestore.instance.collection("profile").doc(FirebaseAuth.instance.currentUser!.uid).get();
    profile = (pro.data() as Map<String, dynamic>)['Profile'];

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_new_rounded)),
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
                backgroundImage: NetworkImage('https://w0.peakpx.com/wallpaper/368/441/HD-wallpaper-cute-anime-girl-anime-cat-girl-anime-girl-cartoon-cat-girl-cute-anime-thumbnail.jpg'),
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
