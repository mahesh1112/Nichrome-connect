import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CapturePhotoScreen extends StatefulWidget {
  @override
  _CapturePhotoScreenState createState() => _CapturePhotoScreenState();
}

class _CapturePhotoScreenState extends State<CapturePhotoScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _capturedImage;

  Future<void> _capturePhoto() async {
    try {
      // Use ImagePicker to capture an image
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      
      // Check if an image was captured
      if (image != null) {
        setState(() {
          _capturedImage = File(image.path);
        });
      }
    } catch (e) {
      // Handle exceptions gracefully
      print("Error capturing photo: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to capture image. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Capture Photo"),
      ),
      body: Center(
        child: _capturedImage == null
            ? Text("No image captured")
            : Image.file(_capturedImage!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _capturePhoto,
        tooltip: 'Capture Photo',
        child: Icon(Icons.camera),
      ),
    );
  }
}
