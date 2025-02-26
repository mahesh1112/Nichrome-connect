import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class capsules extends StatefulWidget {
  const capsules({super.key});

  @override
  State<capsules> createState() => _capsulesState();
}

class _capsulesState extends State<capsules> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text("Capsules"),
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
                  child: Text( "Counting and Filling",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      width: screenWidth - 40,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Image.network("https://www.nichrome.com/images/pharma/capsule/counting-system.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'High Speed Counting and Feeding Systems for Tablet / Capsules',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      BulletPoint(text: 'Bottle Filling, Capping, Labeling Systems'),
                      BulletPoint(text: 'Desiccant Insertion, Leaflet Insertion'),
                      BulletPoint(text: 'Integrated Lines'),
                    ],
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Blister Packaging",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Center(
                  child: Container(
                      width: screenWidth - 40,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                      child: Image.network("https://www.nichrome.com/images/pharma/tablet-compression/blister-packaging.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPoint(text: 'Medium and high-speed Blister Packaging Machines for Tablet/ Capsules'),
                      BulletPoint(text: 'High-speed Card Blister Packaging with automatic feeding system for cosmetic and other healthcare products'),
                      BulletPoint(text: 'Cartoning Machine range for Blister Strips, Bottles, Tubes and Sachets including complete integrated lines'),
                    ],
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