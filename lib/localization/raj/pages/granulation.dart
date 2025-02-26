import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class granulation extends StatefulWidget {
  const granulation({super.key});

  @override
  State<granulation> createState() => _granulationState();
}

class _granulationState extends State<granulation> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text("Granulation"),
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
                  child: Text( "Single Pot Processor",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/granulation/Single-Pot-Processor.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Luperini Production Srl",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("The version 'high shear mixer granulator' is designed to mix and granulate different pharmaceutical powders in different formulations. Thanks to the combined action of the impeller and chopper, it can handle all types of products.",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () => launchUrl(Uri.parse('https://www.luperinigroup.com/')),
                    child: Text("Read More")),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "High Shear Mixer Granulator",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/granulation/High-Shear-Mixer-Granulator-02.jpg")),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keumsung Machinery Co. Ltd.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 16),
                      BulletPoint(text: 'Mixing, kneading, granulating'),
                      BulletPoint(text: 'Cone type vessel'),
                      BulletPoint(text: 'Inside of vessel became perfect cleaning is possible'),
                      BulletPoint(text: 'Open and close the exhaust damper device'),
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