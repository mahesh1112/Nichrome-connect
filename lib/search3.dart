import 'package:flutter/material.dart';
import 'package:nichrome_test/common/clip.dart';
import 'package:nichrome_test/testing/machines.dart';

import 'common/Sidebar.dart';
import 'common/slider_screen.dart';
import 'localization/raj/pages/capsule.dart';
import 'localization/raj/pages/granulation.dart';
import 'localization/raj/pages/injectables.dart';
import 'localization/raj/pages/oral_liquid.dart';
import 'localization/raj/screens/tablets.dart';
import 'testing/machine_category_page.dart';
import 'testing/subcategoriesdetails.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, String>> filteredIndustries = [];
  List<Machine> filteredMachines = [];
  bool isSearching = false;
  final FocusNode _focusNode = FocusNode();

  void dispose() {
    _focusNode.dispose(); // Clean up the focus node
    super.dispose();
  }

  // List of industries
  List<Map<String, String>> industries = [
    {'name': 'Powders'},
    {'name': 'Ready to eat'},
    {'name': 'Capsules'},
    {'name': 'Gel'},
    {'name': 'Granulation'},
    {'name': 'Injectibles'},
    {'name': 'Tablets'},
    {'name': 'Oral Liquid'},
    {'name': 'Adhesives'},
    {'name': 'Fertilizers'},
    {'name': 'Agrochemicals'},
    {'name': 'Hardware'},
    {'name': 'Lube Oil'},
    {'name': 'Paint Powders'},
  ];

  // List of machines
  List<Machine> machines = MachineData.allMachines;

  @override
  void initState() {
    super.initState();
    filteredIndustries = industries; // Show all industries initially
    filteredMachines = machines; // Show all machines initially
  }

  // Search logic
  void _filterSearch(String query) {
    setState(() {
      // Filter industries
      filteredIndustries = industries.where((industry) {
        return industry['name']!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      // Filter machines
      filteredMachines = machines.where((machine) {
        return machine.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      FocusScope.of(context).unfocus();
    },
      child: Scaffold(
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
              ClipPath(
                clipper: CustomEdges(),
                child: Container(
                  color: Color(0xFFFFF3E0),
                  child: SizedBox(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        // Search bar
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextField(
                            focusNode: _focusNode,
                            controller: searchController,
                            onChanged: _filterSearch, // Update on text change
                            decoration: InputDecoration(
                              hintText: "Search Machines or Subcategories...",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0)
                              ),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        // Unified search results
                        Expanded(
                          child: searchController.text.isEmpty
                              ? SliderScreen() // Show slider when search is empty
                              : (filteredIndustries.isEmpty &&
                                      filteredMachines.isEmpty)
                                  ? Center(
                                      child: Text(
                                        'No results found',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: filteredIndustries.length +
                                          filteredMachines.length,
                                      separatorBuilder: (context, index) =>
                                          Divider(
                                        color: Colors.grey,
                                        thickness: 1,
                                        height: 1,
                                      ),
                                      itemBuilder: (context, index) {
                                        // Unified list
                                        if (index < filteredIndustries.length) {
                                          // Industries
                                          var industry =
                                              filteredIndustries[index];
                                          return ListTile(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            title: Text(
                                              industry['name']!,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MachineCategoryPage(
                                                    industry: industry['name']!,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          // Machines
                                          var machine = filteredMachines[
                                              index - filteredIndustries.length];
                                          return ListTile(
                                            contentPadding: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 20),
                                            title: Text(
                                              machine.name,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                                machine.categories.join(', ')),
                                            leading: Image.network(
                                                machine.imageUrl,
                                                width: 50,
                                                height: 50),
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SubcategoryDetailsScreen(
                                                    categoryName:
                                                        machine.categories.first,
                                                    // Pass appropriate category
                                                    subcategoryName: machine.name,
                                                    subcategoryImageUrl:
                                                        machine.imageUrl,
                                                    subcategoryDescription:
                                                        machine.description,
                                                    subcategoryVideoUrl:
                                                        machine.videoUrl,
                                                    subcategoryPdfUrl:
                                                        machine.pdfUrl,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                    ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

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
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Grains'),
                                        ),
                                      );
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Grains",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Milk'),
                                        ),
                                      );
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
                                                'assets/food/Milk.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Milk",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Sugar'),
                                        ),
                                      );
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
                                                'assets/food/Sugar.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Sugar",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Tea'),
                                        ),
                                      );
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
                                            image:
                                                AssetImage('assets/food/Tea.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tea and Coffee",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Namkeen'),
                                        ),
                                      );
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
                                                'assets/food/Namkeen.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Namkeen",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Oil'),
                                        ),
                                      );
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
                                            image:
                                                AssetImage('assets/food/Oil.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Oil",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Powders'),
                                        ),
                                      );
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
                                                'assets/food/Powders.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Powders",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Ready to eat'),
                                        ),
                                      );
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
                                                'assets/food/Ready_to_eat.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Ready to eat",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => capsules()));
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
                                                'assets/pharma/capsules.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Capsules",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Gel'),
                                        ),
                                      );
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
                                                'assets/pharma/Gel.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Gel",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => granulation(),
                                        ),
                                      );
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
                                                'assets/pharma/granules.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Granulation",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => injectables(),
                                        ),
                                      );
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
                                                'assets/pharma/Injectibles.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Injectibles",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => tablets()));
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
                                                'assets/pharma/tablets.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Tablets",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => oralliquid(),
                                        ),
                                      );
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
                                                'assets/pharma/oral-liquid.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Oral Liquid",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Adhesives'),
                                        ),
                                      );
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
                                                'assets/non_food/Adhesives.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Adhesives",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Fertilizers'),
                                        ),
                                      );
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
                                                'assets/non_food/Fertilizer.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Fertilizers",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Agrochemicals'),
                                        ),
                                      );
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
                                                'assets/non_food/Agrochemicals.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Agrochemicals",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Hardware'),
                                        ),
                                      );
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
                                                'assets/non_food/Hardware.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Hardware",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Lube Oil'),
                                        ),
                                      );
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
                                                'assets/non_food/Lube-oil.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Lube Oil",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MachineCategoryPage(
                                                  industry: 'Paint Powders'),
                                        ),
                                      );
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
                                                'assets/non_food/Paint-powder.jpg'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Paint Powders",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )
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
      ),
    );
  }
}
