import 'package:flutter/material.dart';

class WingStickpack extends StatefulWidget {
  const WingStickpack({super.key});

  @override
  State<WingStickpack> createState() => _WingStickpackState();
}

class _WingStickpackState extends State<WingStickpack> {
  @override

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text('VFFS Series'),
        backgroundColor: Color(0xFFFFF8F8),
      ),
      body: SingleChildScrollView(
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
                child: Text('Wing Stickpack',
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
                    child: Image.network(
                        'https://www.nichrome.com/images/V10/machines/large/Wing-Stickpack.jpg')),
              ),
              Padding(

                padding: EdgeInsets.all(20),
                child: Text(
                  "Nichrome's WING sachet filling machine Series offers efficient packaging solution for versatile, complex and user-friendly applications. Its PLC based machine is sturdy in performance and versatile in design. Its multi-featured controller can pack multi-sided sachets and pouches.",
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
