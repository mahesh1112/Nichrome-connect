import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class producthandling extends StatefulWidget {
  const producthandling({super.key});

  @override
  State<producthandling> createState() => _producthandlingState();
}

class _producthandlingState extends State<producthandling> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text("Product Handling"),
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
                  child: Text( "Conveying Systems",
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Screw-Conveying.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Screw Conveying",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Vacuum-Conveyor2.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Vacuum Conveying",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Belt-Bucket-Conveying.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Belt / Bucket Conveying",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "PRODUCT STORAGE",
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Storage-Silos.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Storage Silos",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Jumbo Bags",
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Jumbo-Bag-Handling2.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Jumbo Bag Handling",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Jumbo-Bag-Dispensing.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Jumbo Bag Dispensing",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Product Processing",
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Cleaning2.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Cleaning",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Grading.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Grading",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Mixing2.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Mixing",
                    style: TextStyle(
                        fontSize: 15,
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
                      child: Image.network("https://www.nichrome.com/images/2022/08/product-handling/Distribution.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Distribution",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}