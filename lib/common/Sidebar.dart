import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Authenticate/LoginScreen.dart';
import '../screens/profilescreen.dart';


class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String name ="";

  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }

  getdata()async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
    setState(() {
      name = (snap.data() as Map<String, dynamic>)['Name'];

    });

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          InkWell(
            onTap: () => null,
            child: UserAccountsDrawerHeader(
              accountName: Text("$name"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    'https://w0.peakpx.com/wallpaper/368/441/HD-wallpaper-cute-anime-girl-anime-cat-girl-anime-girl-cartoon-cat-girl-cute-anime-thumbnail.jpg',
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1597655601841-214a4cfe8b2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bW91bnRhaW4lMjBzY2VuZXJ5fGVufDB8fDB8fA%3D%3D&w=1000&q=80',
                ),
                fit: BoxFit.cover,
              )),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profilescreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.notification_add_sharp),
            title: Text("Notification"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.contact_support_rounded),
            title: Text("About Us"),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            //trailing:Icon(Icons.logout) ,
            leading: Icon(Icons.logout),
            title: Text("Log Out"),
            onTap: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
          ),
        ],
      ),
    );
  }
}
