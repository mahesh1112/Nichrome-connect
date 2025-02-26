

// import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:nichrome_test/unknown_locations/x_circular_image.dart';
// import 'package:nichrome_test/utils/constants/colors.dart';
// import 'package:nichrome_test/utils/constants/image_strings.dart';

// class XUserProfileTile extends StatelessWidget {
//   const XUserProfileTile({
//     super.key,
//     required this.onPressed,
//   });

//   final VoidCallback onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       leading: const XCircularImage(
//         image: XImages.user,
//         width: 50,
//         height: 50,
//         padding: 0,
//       ),
//       title: Text(
//         'Arnav Pise',
//         style: Theme.of(context)
//             .textTheme
//             .headlineSmall!
//             .apply(color: XColors.white),
//       ),
//       subtitle: Text(
//         'arnavpise15@gmail.com',
//         style: Theme.of(context)
//             .textTheme
//             .bodyMedium!
//             .apply(color: XColors.white),
//       ),
//       trailing: Material(
//         type: MaterialType.transparency, // Use transparent material to preserve the background
//         child: InkWell(
//           borderRadius: BorderRadius.circular(50), // To match the icon shape
//           onTap: onPressed,  // Navigation happens only when the icon is tapped
//           child: const Padding(
//             padding: EdgeInsets.all(8.0), // Add padding for better visual effect
//             child: Icon(Iconsax.edit, color: XColors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nichrome_test/localization/unknown_locations/x_circular_image.dart';
import 'package:nichrome_test/utils/constants/colors.dart';

class XUserProfileTile extends StatelessWidget {
  const XUserProfileTile({
    super.key,
    required this.onPressed,
    required this.image, // Add image parameter
  });

  final VoidCallback onPressed;
  final String image; // Add a String type for the image

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: XCircularImage(
        image: image, // Use the image parameter here
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        'Arnav Pise', // You may want to make this dynamic as well
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: XColors.white),
      ),
      subtitle: Text(
        'arnavpise15@gmail.com', // You may want to make this dynamic as well
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: XColors.white),
      ),
      trailing: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: onPressed, 
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Iconsax.edit, color: XColors.white),
          ),
        ),
      ),
    );
  }
}
