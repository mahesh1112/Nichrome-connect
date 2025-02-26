import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';

class XAnimationLoaderWidget extends StatelessWidget {
  const XAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.8), // Display Lottie animation
          const SizedBox(height: XSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ), // Text
          const SizedBox(height: XSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    style:
                        OutlinedButton.styleFrom(backgroundColor: XColors.dark),
                    child: Text(
                      actionText!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: XColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ], // Text ), // OutlinedButton
      ),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import 'package:nichrome_test/utils/constants/colors.dart';
// import 'package:nichrome_test/utils/constants/sizes.dart';

// class XAnimationLoaderWidget extends StatelessWidget {
//   const XAnimationLoaderWidget({
//     super.key,
//     required this.text,
//     required this.animation,
//     this.showAction = false,
//     this.actionText,
//     this.onActionPressed,
//   });

//   final String text;
//   final String animation;
//   final bool showAction;
//   final String? actionText;
//   final VoidCallback? onActionPressed;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Lottie Animation
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.8,
//             child: Lottie.asset(
//               animation,
//               fit: BoxFit.contain,
//             ),
//           ),
//           const SizedBox(height: XSizes.defaultSpace),
//           Text(
//             text,
//             style: Theme.of(context).textTheme.bodyMedium,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: XSizes.defaultSpace),
//           if (showAction)
//             SizedBox(
//               width: 250,
//               child: OutlinedButton(
//                 onPressed: onActionPressed,
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: XColors.dark,
//                 ),
//                 child: Text(
//                   actionText ?? "",
//                   style: Theme.of(context)
//                       .textTheme
//                       .bodyMedium!
//                       .apply(color: XColors.light),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
