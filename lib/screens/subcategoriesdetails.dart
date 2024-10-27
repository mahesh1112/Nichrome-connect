import 'package:flutter/material.dart';

class SubcategoryDetailsScreen extends StatelessWidget {
  final String categoryName;
  final String subcategoryName;
  final String subcategoryImageUrl;
  final String subcategoryDescription;

  const SubcategoryDetailsScreen({
    Key? key,
    required this.categoryName,
    required this.subcategoryName,
    required this.subcategoryImageUrl,
    required this.subcategoryDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text(categoryName),
        backgroundColor: Color(0xFFFFF8F8),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight
          ),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-vector/white-abstract-background_23-2148810113.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1728345600&semt=ais_hybrid'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( subcategoryName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                      width: screenWidth - 40,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Image.network(subcategoryImageUrl)),
                ),
                Padding(
          
                  padding: EdgeInsets.all(20),
                  child: Text(subcategoryDescription,
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
