import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../common/clip.dart';
import '../common/search.dart';

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
    return DefaultTabController(
      length: 3, // Set the number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(top: 30,left:20),
                title: Row(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/logo/logo.png"),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ClipPath(
                clipper: CustomEdges(),
                child: Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    height: 300,
                    // width: double.infinity,
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
                          width: screenwidth - 20,
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
                                ), backgroundColor: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverAppBarDelegate(
                TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.black,

                  tabs: [
                    Tab(text: "Food"),
                    Tab(text: "Pharma"),
                    Tab(text: "Non Food"),
                  ],
                ),
              ),

              pinned: true,
            ),
            SliverFillRemaining(
              child: Container(
                // color: Colors.yellow,
                child: TabBarView(
                  children: [
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

                        ],
                      ),
                    ),
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

                        ],
                      ),
                    ),
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

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverAppBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}