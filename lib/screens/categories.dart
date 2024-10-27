import 'package:flutter/material.dart';
import 'package:nichrome/screens/subcategoriesdetails.dart';
import 'cat_provider.dart';

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
                                      railCategories[index].catName,
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
            childAspectRatio: 3.7 / 6,
            crossAxisSpacing: 15,
            mainAxisSpacing: 8),
        itemCount: subcategoryItems[currentIndex].length,
        itemBuilder: (context, index) {
          final subcategory = subcategoryItems[currentIndex][index];

          return GestureDetector(
            onTap: () {
              // Navigate to the detail screen on subcategory tap
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SubcategoryDetailsScreen(
                    categoryName: railCategories[currentIndex].catName,
                    subcategoryName: subcategoryItems[currentIndex][index].catName,
                    subcategoryImageUrl: subcategoryItems[currentIndex][index].catImageUrl,
                    subcategoryDescription: _getSubcategoryDescription(subcategoryItems[currentIndex][index].catName),
                  ),
                ),
              );
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
  // Add cases for other subcategories
    default:
      return 'This is a versatile and efficient machine used for a wide variety of packaging applications.';
  }
}