
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:share_plus/share_plus.dart';

class PDFViewerPage extends StatelessWidget {
  final String pdfUrl;

  PDFViewerPage({required this.pdfUrl});

  void _sharePdf() {
    // Share the PDF URL
    Share.share(pdfUrl, subject: 'Check out this PDF Brochure');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
        actions: [
          IconButton(
            icon: Icon(Icons.share), // Share icon
            onPressed: _sharePdf, // Call the share function
          ),
        ],
      ),
      body: SfPdfViewer.network(
        pdfUrl,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          // Optional: Add any actions after the PDF is loaded
        },
        onDocumentLoadFailed: (PdfDocumentLoadFailedDetails details) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to load PDF: ${details.error}')),
          );
        },
      ),
    );
  }
}
