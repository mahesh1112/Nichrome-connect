import 'package:flutter/material.dart';
import 'package:nichrome_test/Packagingsystems/producthandling.dart';
import 'package:nichrome_test/testing/cat_provider.dart';
import 'package:nichrome_test/testing/machine_category_page.dart';
import 'package:nichrome_test/testing/subcategoriesdetails.dart';
// import 'package:nichrome/Packagingsystems/producthandling.dart';
// import 'package:nichrome/screens/subcategoriesdetails.dart';
// import '../pages/machine_category_page.dart';


class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _category();
}

class _category extends State<category> {
  int currentIndex = 0;
  int preIndex = 0;
  int postIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text("All Categories"),
        ),
        body: Row(children: [
          Expanded(
              flex: 1,
              child: Container(color: Colors.grey[350],
                  child: ListView.builder(
                      itemCount: railCategories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                preIndex = currentIndex - 1;
                                postIndex = currentIndex + 1;
                              });
                            },
                            child: Stack(children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? Colors.white
                                      : Colors.grey[350],
                                  border: index != 0
                                      ? const Border(
                                    top: BorderSide(
                                        color: Colors.white, width: 1),
                                  )
                                      : null,
                                ),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            railCategories[index].catImageUrl,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    const SizedBox(height: 5),
                                    Text(
                                      railCategories[index].catName as String,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ]));
                      }))),
          Expanded(
            flex: 3,
            child: SubCategories(currentIndex: currentIndex,),
          )
        ]
        )
    );
  }
}

class SubCategories extends StatelessWidget {
  final int currentIndex;
  const SubCategories({
    super.key,required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final List subcategoryItems = [
      packagingmachines,packgingsystems,fillersystems
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white70,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 15,
            mainAxisSpacing: 8),
        itemCount: subcategoryItems[currentIndex].length,
        itemBuilder: (context, index) {
          final subcategory = subcategoryItems[currentIndex][index];

          return GestureDetector(
            onTap: () {
              if(subcategoryItems[currentIndex][index].catName != 'Product Handling' && subcategoryItems[currentIndex][index].catName != 'Secondary Packaging' && subcategoryItems[currentIndex][index].catName != 'Primary Packaging'){
              // Navigate to the detail screen on subcategory tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryDetailsScreen(
                    categoryName: railCategories[currentIndex].catName as String,
                    subcategoryName: subcategoryItems[currentIndex][index].catName,
                    subcategoryImageUrl: subcategoryItems[currentIndex][index].catImageUrl,
                    subcategoryDescription: _getSubcategoryDescription(subcategoryItems[currentIndex][index].catName),
                    subcategoryVideoUrl: subcategoryItems[currentIndex][index].catVideoUrl,
                    subcategoryPdfUrl: subcategoryItems[currentIndex][index].catPdfUrl,
                  ),
                ),
              );}

              else if(subcategoryItems[currentIndex][index].catName == 'Product Handling'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> producthandling()));
              }
              else if(subcategoryItems[currentIndex][index].catName == 'Primary Packaging'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MachineCategoryPage(industry: 'Primary Packaging')));
              }
              else if(subcategoryItems[currentIndex][index].catName == 'Secondary Packaging'){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> MachineCategoryPage(industry: 'Secondary Packaging')));
              }
            },
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(
                      subcategory.catImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subcategory.catName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

String _getSubcategoryDescription(String subcategoryName) {
  switch (subcategoryName) {
    case 'DH Wing Servo Auger Filler':
      return 'This machine is designed for high-speed auger filling applications. It is ideal for powders and granular products.';
    case 'Wing Sickpack':
      return 'Wing Sickpack is a versatile packaging machine designed for stickpack applications.';
    case 'Maxima 200':
      return 'Maxima 200 is a flexible machine for packaging applications across industries.';
    case 'Track and Trace':
      return "Nichrome offers Partial or Complete Track & Trace solutions right from raw material stage till retail sales.\n\nFeatures:\n\t\t1) Software\n\t\t2) Cloud Storage (Real time data)\n\t\t3) Complete Hardware";
    case 'Warehousing':
      return "Nichrome’s Warehousing solutions are aimed at small and mid-sized companies for Warehousing - Storage / Retrieval.\n\nWe offer:\n\t\t1) Product Conveying\n\t\t2) Storage\n\t\t3) Traffic Management\n\t\t4) Coding and Data Capturing";
    case 'End of Line Packaging':
      return "Nichrome’s end of line packaging offers Palletization solutions for both\n\t\t1) Bag\n\t\t2) Cases\n\nWe offer customized solutions including:\n\t\t1) Automatic Pallet Dispensing\n\t\t2) Collation using Pick & Place (Robotic / Gantry)\n\t\t3) Palletizer (Robotic / Gantry)\n\t\t4) Multiple Line Configuration Integration\n\t\t5) Stretch Wrapping";
  // Add cases for other subcategories
    default:
      return 'This is a versatile and efficient machine used for a wide variety of packaging applications.';
  }
}