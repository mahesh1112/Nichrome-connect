import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class XImagePicker extends StatefulWidget {
  final Function(String) onImageSelected; // Callback when image is selected

  const XImagePicker({super.key, required this.onImageSelected});

  @override
  _XImagePickerState createState() => _XImagePickerState();
}

class _XImagePickerState extends State<XImagePicker> {
  final ImagePicker _picker = ImagePicker();
  String? _selectedImagePath;

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImagePath = image.path;
        });
        widget.onImageSelected(image.path); // Notify parent widget
      }
    } catch (e) {
      // Handle error (e.g., permission denied)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display selected image or a placeholder
        _selectedImagePath != null
            ? Image.file(
                File(_selectedImagePath!),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              )
            : const Icon(
                Icons.person,
                size: 100,
              ),
        const SizedBox(height: 10),

        // Buttons for choosing image from gallery or taking a picture
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo),
              label: const Text('Gallery'),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: const Icon(Icons.camera),
              label: const Text('Camera'),
            ),
          ],
        ),
      ],
    );
  }
}
