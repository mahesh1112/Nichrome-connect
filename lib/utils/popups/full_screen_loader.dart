import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/common/widgets/loaders/animation_loader.dart';
import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/helpers/helper_functions.dart';

class XFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: XHelperFunctions.isDarkMode(Get.context!)
              ? XColors.dark
              : XColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            // Add this widget
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the contents vertically
              children: [
                const SizedBox(height: 250), // Adjust the spacing as needed
                XAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the Dialog using Navigator
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nichrome_test/common/widgets/loaders/animation_loader.dart';
// import 'package:nichrome_test/utils/constants/colors.dart';
// import 'package:nichrome_test/utils/helpers/helper_functions.dart';

// class XFullScreenLoader {
//   static void openLoadingDialog(String text, String animation) {
//     if (Get.overlayContext == null) return; // Ensure context is not null

//     showDialog(
//       context: Get.overlayContext!,
//       barrierDismissible: false,
//       builder: (_) => PopScope(
//         canPop: false,
//         child: Container(
//           color: XHelperFunctions.isDarkMode(Get.context!)
//               ? XColors.dark
//               : XColors.white,
//           width: double.infinity,
//           height: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 250), // Adjust spacing as needed
//               XAnimationLoaderWidget(
//                 text: text,
//                 animation: animation,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   static void stopLoading() {
//     if (Navigator.canPop(Get.overlayContext!)) {
//       // Ensure dialog can be popped
//       Navigator.of(Get.overlayContext!).pop();
//     }
//   }
// }
