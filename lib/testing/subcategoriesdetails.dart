// import 'package:flutter/material.dart';
// import 'package:nichrome_test/testing/pdf_viwer.dart';
// import 'package:nichrome_test/testing/youtube_video.dart';

// class SubcategoryDetailsScreen extends StatelessWidget {
//   final String categoryName;
//   final String subcategoryName;
//   final String subcategoryImageUrl;
//   final String subcategoryDescription;
//   final String subcategoryVideoUrl;
//   final String subcategoryPdfUrl;

//   const SubcategoryDetailsScreen({
//     Key? key,
//     required this.categoryName,
//     required this.subcategoryName,
//     required this.subcategoryImageUrl,
//     required this.subcategoryDescription,
//     required this.subcategoryVideoUrl,
//     required this.subcategoryPdfUrl,
//   }) : super(key: key);

  



//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         // title: Text(subcategoryName), // Display subcategory name in AppBar
//         title: Text(categoryName),
//         backgroundColor: Color(0xFFFFF8F8),
//       ),
//       body: SingleChildScrollView(
//         child: ConstrainedBox(
//           constraints: BoxConstraints(
//             minHeight: screenHeight
//           ),
//           child: Container(
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: NetworkImage('https://img.freepik.com/free-vector/white-abstract-background_23-2148810113.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1728345600&semt=ais_hybrid'),
//                     fit: BoxFit.cover
//                 )
//             ),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text( subcategoryName,
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: Container(
//                       width: screenWidth - 40,
//                       decoration:
//                       BoxDecoration(border: Border.all(color: Colors.black)),
//                       child: Image.network(subcategoryImageUrl)),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child: Text(subcategoryDescription,
//                     style: TextStyle(
//                         fontSize: 16
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 100),



//                 /// YT VIDEO
//                 Padding(
//                   padding: EdgeInsets.all(20),
//                   child: AspectRatio(
//                     aspectRatio: 16 / 9, // Aspect ratio for YouTube video
//                     child: YouTubeVideoPlayer(
//                       videoUrl: subcategoryVideoUrl,
//                     ),
//                   ),
//                 ),


//                 const SizedBox(height: 16),


//                 // Button to Play YouTube Video in App or Browser
//                 ElevatedButton.icon(
//                   onPressed: _launchYouTube,
//                   icon: Icon(Icons.play_arrow, color: Colors.blue,),
//                   label: Text('Play on YouTube', style: TextStyle(color: Colors.blue),),
//                 ),
                
//                 SizedBox(height: 16),


//                 // Button to View Brochure
                
//                 const SizedBox(height: 16),

//                 SizedBox(
//                   width: 120, // Set the desired width
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PDFViewerPage(pdfUrl: subcategoryPdfUrl),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Button background color
//                       foregroundColor: Colors.white,  // Text color
//                     ),
//                     child: const Text(
//                       'Show Brochure',
//                     ),
//                   ),
//                 ),


//                 const SizedBox(height: 32),

                
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:nichrome_test/testing/pdf_viwer.dart';
import 'package:nichrome_test/testing/youtube_video.dart';
import 'package:url_launcher/url_launcher.dart';

class SubcategoryDetailsScreen extends StatelessWidget {
  final String categoryName;
  final String subcategoryName;
  final String subcategoryImageUrl;
  final String subcategoryDescription;
  final String subcategoryVideoUrl;
  final String subcategoryPdfUrl;

  const SubcategoryDetailsScreen({
    Key? key,
    required this.categoryName,
    required this.subcategoryName,
    required this.subcategoryImageUrl,
    required this.subcategoryDescription,
    required this.subcategoryVideoUrl,
    required this.subcategoryPdfUrl,
  }) : super(key: key);

  void _launchYouTube() async {
    if (await canLaunch(subcategoryVideoUrl)) {
      await launch(subcategoryVideoUrl);
    } else {
      throw 'Could not launch $subcategoryVideoUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Color(0xFFFFF8F8),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.freepik.com/free-vector/white-abstract-background_23-2148810113.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1728345600&semt=ais_hybrid'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    subcategoryName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Container(
                    width: screenWidth - 40,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Image.network(subcategoryImageUrl),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    subcategoryDescription,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 100),

                // YouTube Video Player
                Padding(
                  padding: EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YouTubeVideoPlayer(videoUrl: subcategoryVideoUrl),
                  ),
                ),
                const SizedBox(height: 16),



                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: _launchYouTube,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Play on YouTube', style: TextStyle(color: const Color.fromARGB(255, 247, 247, 247))),
                  ),
                ),


                const SizedBox(height: 16),

                // Button to View Brochure
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PDFViewerPage(pdfUrl: subcategoryPdfUrl),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Show Brochure'),
                  ),
                ),
                const SizedBox(height: 32),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
