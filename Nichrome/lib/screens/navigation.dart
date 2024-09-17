
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nichrome/screens/categories.dart';
import 'package:nichrome/screens/profile.dart';
import 'package:nichrome/screens/scan.dart';
import 'package:nichrome/screens/home.dart';



class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageindex = 0;
  final pages = [home(),category(),scan(), Profile()];
  var _appPageController = PageController();

  setBottomBarIndex(index) {
    setState(() {
      pageindex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 1000), curve: Curves.bounceInOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:pages[pageindex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          activeColor: Colors.blue,
          color: Colors.grey,
          style: TabStyle.flip,
          items: [
            TabItem(icon: Icons.home_outlined,title: 'Home',),
            TabItem(icon: Icons.category_outlined,title: 'Category',),
            TabItem(icon: Icons.document_scanner_sharp,title: 'Scan'),
            TabItem(icon: Icons.account_circle_outlined,title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int pageindex){
            setState(() {
              setBottomBarIndex(pageindex);
            });
          },
        )
    );
  }
}
