import 'package:flutter/material.dart';

class XFormDivider extends StatelessWidget {
  const XFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: Colors.grey[600],
            thickness: 0.5,
            indent: 60,
            endIndent: 10,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          dividerText,
          style: TextStyle(color: Colors.grey[600]),
        ),
        Flexible(
          child: Divider(
            color: Colors.grey[600],
            thickness: 0.5,
            indent: 10,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
