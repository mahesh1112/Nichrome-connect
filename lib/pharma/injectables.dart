import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class injectables extends StatefulWidget {
  const injectables({super.key});

  @override
  State<injectables> createState() => _injectablesState();
}

class _injectablesState extends State<injectables> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // title: Text(subcategoryName), // Display subcategory name in AppBar
        title: Text("Injectables"),
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
                  child: Text( "Complete Line",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/injectibles/DaeyongPharmatech.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Daeyong Pharmatech",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Complete Line for Ampoule and Vial',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      BulletPoint(text: 'Washing (Ultrasonic)'),
                      BulletPoint(text: 'Drying and Sterilizing'),
                      BulletPoint(text: 'Filling & Robber Stoppering'),
                      BulletPoint(text: 'AL-Cap Sealing'),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: () => launchUrl(Uri.parse('http://www.daeyongpt.com/')),
                    child: Text("Read More")),


                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Filling Pumps",
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
                      child: Image.network("https://www.nichrome.com/images/pharma/injectibles/filling-pumps-2.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("MPA Technical Devices, Italy",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("MPA Srl is an Italian company that manufactures top quality special parts and pre-assembled units for the pharmaceutical, nautical and cosmetic and food sectors. Ready available Precession, CIP/SIP Dosing Pumps and Needles for liquid, viscous products for sterile applications. MPA offers customization and improvisation on OEM products",
                    style: TextStyle(
                        fontSize: 16
                    ),
                  ),
                ),
                ElevatedButton(onPressed: () => launchUrl(Uri.parse('https://mpaitaly.com/en/products-mpa/')),
                    child: Text("Read More")),



                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text( "Pre Filled Syringe Filling Line",
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
                      child: Image.network("https://www.nichrome.com/images/2020/pharma/injectables/PFS/pfsline.jpg")),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text("Nichrome India Limited is a complete integrated solution provider for injectable products. From aseptic filling, sealing and assembly to end-to-end packaging with blister packaging and cartoning. All our machines are cGMP compliant and user friendly.",
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