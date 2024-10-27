import 'package:flutter/material.dart';
import 'package:nichrome/screens/categories.dart';

import '../common/clip.dart';
import '../common/search.dart';
import '../common/slider_screen.dart';
import '../common/Sidebar.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFF3E0),
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
      backgroundColor: Color(0xFFFFF8F8),
      body: DefaultTabController(
        length: 3, // Number of tabs
        child: Column(
          children: [
            // ClipPath section
            ClipPath(
              clipper: CustomEdges(),
              child: Container(
                color: Color(0xFFFFF3E0),
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 350,
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
                      // Container(
                      //   width: MediaQuery.of(context).size.width - 20,
                      //   height: 150,
                      //   child: ElevatedButton(
                      //     onPressed: () {},
                      //     child: Icon(
                      //       Icons.qr_code_scanner,
                      //       size: 60,
                      //       color: Colors.black,
                      //     ),
                      //     style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(20),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SliderScreen()
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
                Tab(text: "Food"),
                Tab(text: "Pharma"),
                Tab(text: "Non-Food"),
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
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => category()));
                                  },
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/food/Grains.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Grains")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/food/Milk.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Milk")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/food/Namkeen.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Namkeen")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image:
                                              AssetImage('assets/food/Oil.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Oil")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/food/Powders.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Powders")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/food/Ready_to_eat.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Ready to Eat")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),

                  // Tab 2 content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/capsules.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Capsules")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/Gel.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Gel")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/granules.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Granules")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/Injectibles.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Injectibles")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/tablets.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Tablets")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/pharma/oral-liquid.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Oral Liquid")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),

                  // Tab 3 content
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Adhesives.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Adhesives")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Fertilizer.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Fertilizers")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Agrochemicals.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Agrochemical")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Hardware.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Hardware")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Lube-oil.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Lube Oil")
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image(
                                          image: AssetImage(
                                              'assets/non_food/Paint-powder.jpg'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                Text("Paint Powders")
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        )
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
