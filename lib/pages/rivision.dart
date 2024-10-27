import 'package:flutter/material.dart';
import 'package:nichrome/pharma/capsule.dart';
import 'package:nichrome/pharma/injectables.dart';
import 'package:nichrome/pharma/oral_liquid.dart';
import 'package:nichrome/screens/tablets.dart';
import '../common/clip.dart';
import '../common/search.dart';
import '../common/slider_screen.dart';
import '../common/Sidebar.dart';
import 'package:nichrome/pharma/granulation.dart';
import 'machine_category_page.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery
        .of(context)
        .size
        .width;
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
                                onTap: () {Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Grains'),
                                      ),
                                      );
                                    },
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Grains.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Grains",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)

                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Milk'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Milk.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Milk",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),

                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Sugar'),
                                    ),
                                  );
                                  },
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Sugar.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Sugar",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)

                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Tea'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Tea.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Tea and Coffee",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Namkeen'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Namkeen.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Namkeen",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Oil'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Oil.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Oil",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Powders'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Powders.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Powders",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Ready to eat'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/food/Ready_to_eat.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Ready to eat",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
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
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                    onTap: () {
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => capsules()));
                                    },
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/capsules.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Capsules",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Gel'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/Gel.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Gel",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => granulation(),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/granules.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Granulation",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => injectables(),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/Injectibles.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Injectibles",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => tablets()));
                                  },
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/tablets.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Tablets",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => oralliquid(),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/pharma/oral-liquid.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Oral Liquid",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,)
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
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Adhesives'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Adhesives.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Adhesives",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Fertilizers'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Fertilizer.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Fertilizers",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Agrochemicals'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Agrochemicals.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Agrochemicals",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Hardware'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Hardware.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Hardware",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Lube Oil'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Lube-oil.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Lube Oil",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MachineCategoryPage(industry: 'Paint Powders'),
                                    ),
                                  );},
                                  child: Container(
                                    height: 200,width: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image(image: AssetImage('assets/non_food/Paint-powder.jpg'), fit: BoxFit.cover,)),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text("Paint Powders",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,)
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
