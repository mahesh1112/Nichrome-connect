import 'package:flutter/material.dart';

class dh_wing_servo extends StatefulWidget {
  const dh_wing_servo({super.key});

  @override
  State<dh_wing_servo> createState() => _dh_wing_servoState();
}

class _dh_wing_servoState extends State<dh_wing_servo> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
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
                child: Text('High Speed Double Head Wing Servo Auger Filler',
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
                        'https://www.nichrome.com/images/V10/machines/large/High_Speed_Double_Head_Wing_machine.jpg')),
              ),
              Padding(
        
                padding: EdgeInsets.all(20),
                child: Text(
                    "THE DOUBLE HEAD WING SERVO AUGER FILLER MACHINE is a high-speed, reliable packaging solution for spice powders (chilli, turmeric, coriander, sambar, etc.), nutraceutical powders (premix, health drinks, energy drinks, etc.) and beverages (coffee, dairy whitener, etc.) THE DOUBLE HEAD WING SERVO AUGER FILLER MACHINE is a high-speed, reliable packaging solution for spice powders (chilli, turmeric, coriander, sambar, etc.), nutraceutical powders (premix, health drinks, energy drinks, etc.) and beverages (coffee, dairy whitener, etc.)",
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
