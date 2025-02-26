
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nichrome_test/localization/mahesh/screens/profile.dart';
import 'package:nichrome_test/search3.dart';
import 'package:nichrome_test/testing/categories.dart';
import 'package:nichrome_test/testing/rivision.dart';

import 'cards/cards.dart';
import 'localization/raj/screens/profile.dart';







class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageindex = 0;
  bool _isPopupShown = false;
  final pages = [Home(), category(), VisitingCardsPage(), Profilescreen()];
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

        body: pages[pageindex],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.white,
          activeColor: Colors.blue,
          color: Colors.grey,
          style: TabStyle.flip,
          items: [
            TabItem(icon: Icons.home_outlined, title: 'Home',),
            TabItem(icon: Icons.category_outlined, title: 'Category',),
            TabItem(icon: Icons.document_scanner_sharp, title: 'Scan'),
            TabItem(icon: Icons.person, title: 'Profile'),
          ],
          initialActiveIndex: 0,
          onTap: (int pageindex) {
            setState(() {
              setBottomBarIndex(pageindex);
            });
          },
        )
    );
  }


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_isPopupShown) {
        _showPopup(context);
        _isPopupShown = true; // Set the flag to true after showing popup
      }
    });
  }
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(10),
          backgroundColor: Colors.transparent, // Make the dialog background transparent
          content: Container(
            width: double.maxFinite,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/diwali.jpg'),  // Path to your image
                fit: BoxFit.cover,  // Image will fill the entire alert box
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}