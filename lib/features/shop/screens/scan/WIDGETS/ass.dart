import 'dart:io';
import 'package:flutter/material.dart';

class Ass extends StatelessWidget {
  final File image;

  const Ass({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Image.file(image),
      ),
    );
  }
}
