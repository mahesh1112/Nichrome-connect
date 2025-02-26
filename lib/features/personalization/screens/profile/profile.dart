
// import 'dart:io'; // Import for File
// import 'package:flutter/material.dart';
// import 'package:get/get.dart'; // Import GetX package
// import 'package:nichrome_test/common/widgets/appbar/appbar.dart';
// import 'package:nichrome_test/features/personalization/screens/profile/widgets/profile_menu.dart';
// import 'package:nichrome_test/localization/unknown_locations/section_heading.dart';
// import 'package:nichrome_test/localization/profile_provider.dart';
// import 'package:nichrome_test/localization/unknown_locations/x_circular_image.dart';
// import 'package:nichrome_test/utils/constants/image_strings.dart';
// import 'package:nichrome_test/utils/constants/sizes.dart';
// import 'package:image_picker/image_picker.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ProfileProvider profileProvider = Get.find<ProfileProvider>();

//     return Scaffold(
//       appBar: const XAppBar(
//         showBackArrow: true,
//         title: Text('Profile'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(XSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Profile Picture Section
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   children: [
//                     Obx(() {
//                       final currentImagePath = profileProvider.profileImage.value; // Reactive image path
//                       return currentImagePath.isNotEmpty
//                           ? Image.file(
//                               File(currentImagePath),
//                               width: 80,
//                               height: 80,
//                               fit: BoxFit.cover,
//                             )
//                           : const XCircularImage(
//                               image: XImages.user,
//                               width: 80,
//                               height: 80,
//                             );
//                     }),
//                     TextButton(
//                       onPressed: _pickImage, // Open options for selecting image
//                       child: const Text('Change Profile Picture'),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: XSizes.spaceBtwItems / 2),
//               const Divider(),

//               /// Additional Sections
//               const SizedBox(height: XSizes.spaceBtwItems),
//               const XSectionHeading(
//                 title: 'Profile Information',
//                 showActionButton: false,
//               ),
//               const SizedBox(height: XSizes.spaceBtwItems),
//               XProfileMenu(onPressed: () {}, title: 'Name', value: 'Arnav Pise'),
//               XProfileMenu(onPressed: () {}, title: 'Username', value: 'arnav_pise'),

//               const SizedBox(height: XSizes.spaceBtwItems),
//               const Divider(),
//               const SizedBox(height: XSizes.spaceBtwItems),

//               const XSectionHeading(
//                 title: 'Personal Information',
//                 showActionButton: false,
//               ),
//               const SizedBox(height: XSizes.spaceBtwItems),
//               XProfileMenu(onPressed: () {}, title: 'User ID', value: '1234'),
//               XProfileMenu(onPressed: () {}, title: 'E-mail', value: 'arnavpise1@gmail.com'),
//               XProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+91 9022992545'),
//               XProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
//               XProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '15 Nov, 2002'),
//               const Divider(),
//               const SizedBox(height: XSizes.spaceBtwItems),

//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     'Close Account',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   /// Method to pick image from camera or gallery
//   Future<void> _pickImage() async {
//     final ImagePicker _picker = ImagePicker();

//     showModalBottomSheet(
//       context: Get.context!, // Use Get.context to get the current context
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextButton(
//                 onPressed: () async {
//                   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
//                   if (image != null) {
//                     Get.find<ProfileProvider>().updateProfileImage(image.path); // Update image path
//                   }
//                   Get.back(); // Close the bottom sheet
//                 },
//                 child: const Text('Take Photo'),
//               ),
//               TextButton(
//                 onPressed: () async {
//                   final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//                   if (image != null) {
//                     Get.find<ProfileProvider>().updateProfileImage(image.path); // Update image path
//                   }
//                   Get.back(); // Close the bottom sheet
//                 },
//                 child: const Text('Choose from Gallery'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:nichrome_test/localization/profile_provider.dart';

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final profileProvider = Get.find<ProfileProvider>();

//     return Scaffold(
//       appBar: AppBar(title: Text('Profile')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Obx(() {
//               // Check if the profile image path is not empty
//               if (profileProvider.profileImage.isEmpty) {
//                 return Image.asset(
//                   'assets/images/content/user.png', // Fallback default image
//                   width: 100,
//                   height: 100,
//                 );
//               }
//               // Display the image if it's available
//               return Image.asset(
//                 profileProvider.profileImage.value,
//                 width: 100,
//                 height: 100,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Image.asset(
//                     'assets/images/content/user.png', // Fallback if image fails to load
//                     width: 100,
//                     height: 100,
//                   );
//                 },
//               );
//             }),
//             Text('Profile Image'),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'dart:io'; // Import for File
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX package
import 'package:nichrome_test/common/widgets/appbar/appbar.dart';
import 'package:nichrome_test/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:nichrome_test/localization/unknown_locations/section_heading.dart';
import 'package:nichrome_test/localization/profile_provider.dart';
import 'package:nichrome_test/localization/unknown_locations/x_circular_image.dart';
import 'package:nichrome_test/utils/constants/image_strings.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileProvider profileProvider = Get.find<ProfileProvider>();

    return Scaffold(
      appBar: const XAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture Section
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final currentImagePath = profileProvider.profileImage.value; // Reactive image path
                      return currentImagePath.isNotEmpty
                          ? Image.file(
                              File(currentImagePath),
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )
                          : const XCircularImage(
                              image: XImages.user,
                              width: 80,
                              height: 80,
                            );
                    }),
                    TextButton(
                      onPressed: _pickImage, // Open options for selecting image
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: XSizes.spaceBtwItems / 2),
              const Divider(),

              /// Additional Sections
              const SizedBox(height: XSizes.spaceBtwItems),
              const XSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: XSizes.spaceBtwItems),
              XProfileMenu(onPressed: () {}, title: 'Name', value: 'Arnav Pise'),
              XProfileMenu(onPressed: () {}, title: 'Username', value: 'arnav_pise'),

              const SizedBox(height: XSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: XSizes.spaceBtwItems),

              const XSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: XSizes.spaceBtwItems),
              XProfileMenu(onPressed: () {}, title: 'User ID', value: '1234'),
              XProfileMenu(onPressed: () {}, title: 'E-mail', value: 'arnavpise1@gmail.com'),
              XProfileMenu(onPressed: () {}, title: 'Phone Number', value: '+91 9022992545'),
              XProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              XProfileMenu(onPressed: () {}, title: 'Date of Birth', value: '15 Nov, 2002'),
              const Divider(),
              const SizedBox(height: XSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Method to pick image from camera or gallery
  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    showModalBottomSheet(
      context: Get.context!, // Use Get.context to get the current context
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    Get.find<ProfileProvider>().updateProfileImage(image.path); // Update image path
                  }
                  Get.back(); // Close the bottom sheet
                },
                child: const Text('Take Photo'),
              ),
              TextButton(
                onPressed: () async {
                  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    Get.find<ProfileProvider>().updateProfileImage(image.path); // Update image path
                  }
                  Get.back(); // Close the bottom sheet
                },
                child: const Text('Choose from Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
}
