import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor; // Parameter for background color
  final Color textColor; // Parameter for text color
  final double fontSize; // Parameter for font size
  final FontWeight fontWeight; // Parameter for font weight
  final double borderRadius; // New parameter for border radius

  const CustomButton({super.key, 
    required this.height,
    required this.width,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // Default value
    this.textColor = Colors.white, // Default value
    this.fontSize = 16.0, // Default value
    this.fontWeight = FontWeight.normal, // Default value
    this.borderRadius = 8.0, // Default value
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Use custom background color
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(borderRadius), // Use custom border radius
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor, // Use custom text color
              fontSize: fontSize, // Use custom font size
              fontWeight: fontWeight, // Use custom font weight
            ),
          ),
        ),
      ),
    );
  }
}
