import 'package:flutter/material.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    required this.showbackground,
    required this.showborder,
    required this.icon,
  });

  final String text;

  final IconData? icon;
  final bool showbackground, showborder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 34,left: 10, right: 10),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        // color: Colors.blue,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: showbackground ? Colors.white : null,
          borderRadius: BorderRadius.circular(16),
          border: showborder ? Border.all(color: Colors.black) : null,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black, size: 32),
            const SizedBox(
              width: 15,
            ),
            Text(text,
                style: TextStyle(color: Colors.black,fontSize: 20),)
          ],
        ),
      ),
    );
  }
}