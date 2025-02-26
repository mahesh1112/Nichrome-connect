import 'package:flutter/material.dart';

class XLoginHeader extends StatelessWidget {
  const XLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 60),
        const Image(
          height: 200,
          image: AssetImage(r"assets/logos/3.png"),
        ),
        
        Text(
          'Infinite Possibilities with Innovation',
          style: TextStyle(color: Colors.grey[600]),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
