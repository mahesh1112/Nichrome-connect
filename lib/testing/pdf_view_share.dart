import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MachineBrochure extends StatelessWidget {
  final String pdfUrl;  // The URL to the PDF file for the machine
  final String machineName;

  const MachineBrochure({required this.pdfUrl, required this.machineName});

  Future<void> _openPDF() async {
    if (await canLaunch(pdfUrl)) {
      await launch(pdfUrl);
    } else {
      throw 'Could not launch $pdfUrl';
    }
  }

  Future<void> _shareBrochure() async {
    try {
      // Share the PDF link through available apps
      await Share.share(
        'Check out the brochure for $machineName: $pdfUrl',
        subject: 'Brochure for $machineName',
      );
    } catch (e) {
      print("Error sharing brochure: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          onPressed: _openPDF, // Open the PDF brochure
          icon: Icon(Icons.picture_as_pdf),
          label: Text('View Brochure'),
        ),
        SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: _shareBrochure, // Share the PDF link
          icon: Icon(Icons.share),
          label: Text('Share Brochure'),
        ),
      ],
    );
  }
}
