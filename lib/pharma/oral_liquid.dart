import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class oralliquid extends StatefulWidget {
  const oralliquid({super.key});

  @override
  State<oralliquid> createState() => _oralliquidState();
}

class _oralliquidState extends State<oralliquid> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text("Oral Liquid"),
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
                  child: Text( "Filling and Capping",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/oral-liquid/Filling-and-Capping-02.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BulletPoint(text: 'Bottle Filling, Capping, Labeling Systems'),
                      BulletPoint(text: 'Desiccant Insertion, Leaflet Insertion'),
                      BulletPoint(text: 'Integrated Lines'),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () => launchUrl(Uri.parse('http://www.daeyongpt.com/')),
                    child: Text("Read More")),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Labeling",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/oral-liquid/kwt.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("KWT is able to offer a full range of industrial packing machines, including Filling Machines, Bottle Unscrambler, Leak Tester, Bottle Rinsers, Capping Machinery, Labeling Equipment, Induction Sealing Machines and so on.",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () => launchUrl(Uri.parse('https://www.kwt-auto.com/category-Labeling-Machin-004.html')),
                    child: Text("Read More")),



                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Cartoning",
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
                      child: Image.network("https://www.nichrome.com/images/2020/pharma/oral-liquid/cartoning-machine.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Nichrome brings in the leading edge solutions for secondary packaging for various industry segments like Food, Pharma, Personal Care, Confectionery, Beverages and other applications.\n\nEnd to end solutions offered include – vertical cartoning, horizontal cartoning, overwrapping and bundling, Case Packing and Palletizing",
                    style: TextStyle(
                        fontSize: 16
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