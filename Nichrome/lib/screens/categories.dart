import 'package:flutter/material.dart';

import '../common/clip.dart';
import '../common/search.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _scanState();
}

class _scanState extends State<category> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Container(
              height: 250,
              width: 200,
              child: Image.asset("assets/logo/logo.png"),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            // ClipPath section
            ClipPath(
              clipper: CustomEdges(),
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 300,
                  width: 400,
                  child: Column(
                    children: [
                      const SearchContainer(
                        text: "Search",
                        showbackground: true,
                        showborder: true,
                        icon: Icons.search,
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: 150,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.qr_code_scanner,
                            size: 60,
                            color: Colors.black,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // TabBar Section
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: "Tab 1"),
                Tab(text: "Tab 2"),
                Tab(text: "Tab 3"),
              ],
            ),

            // TabBarView with scrollable content
            Expanded(
              child: TabBarView(
                children: [
                  // Tab 1 content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Grains.jpg'), fit: BoxFit.cover,)),
                            ),
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Milk.jpg'), fit: BoxFit.cover,)),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Namkeen.jpg'), fit: BoxFit.cover,)),
                            ),
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Oil.jpg'), fit: BoxFit.cover,)),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Powders.jpg'), fit: BoxFit.cover,)),
                            ),
                            Container(
                              height: 200,width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Ready_to_eat.jpg'), fit: BoxFit.cover,)),
                            ),

                          ],
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),

                  // Tab 2 content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Your scrollable content for Tab 2
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Content for Tab 2"),
                        ),
                        SizedBox(height: 20),
                        // Add more widgets here
                      ],
                    ),
                  ),

                  // Tab 3 content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        // Your scrollable content for Tab 3
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Content for Tab 3"),
                        ),
                        SizedBox(height: 20),
                        // Add more widgets here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
