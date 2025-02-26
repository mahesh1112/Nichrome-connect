import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:permission_handler/permission_handler.dart';

class Scan extends StatefulWidget {
  const Scan({super.key});

  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  File? _image;
  String _extractedInfo = '';
  String _remainingValues = '';

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    await [
      Permission.camera,
      Permission.storage,
    ].request();
  }

  Future<void> getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      // Upload the image to the server
      await uploadImage(_image!);
    } else {
      print('No image selected');
    }
  }

  Future<void> uploadImage(File image) async {
    var uri = Uri.parse('https://swift-aliens-vanish.loca.lt/upload'); // Replace with your local IP address
    // var uri = Uri.parse('https://short-rivers-scream.loca.lt/upload'); // for emulator
    var request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
        contentType: MediaType('image', 'jpeg'),
      ),
    );

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        print('Response Data: $responseData'); // Debug output

        // Decode the JSON response
        Map<String, dynamic> responseJson = json.decode(responseData);

        // Extract information from the response
        setState(() {
          _extractedInfo = responseJson['info'] != null ? responseJson['info'].toString() : 'No information found';
          _remainingValues = responseJson['remaining_values'] != null ? responseJson['remaining_values'].toString() : 'No remaining values';
        });

        print('Extracted Info: $_extractedInfo');
        print('Remaining Values: $_remainingValues');
      } else {
        print('Failed to upload image: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan'),
      ),
      body: SingleChildScrollView(  // Wrap content inside SingleChildScrollView
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? const Text('No image selected')
                  : Image.file(_image!),
              const SizedBox(height: 20),
              Text(
                'Extracted Info: $_extractedInfo',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                'Remaining Values: $_remainingValues',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
