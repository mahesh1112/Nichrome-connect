// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:nichrome_test/common/widgets/appbar/appbar.dart';
// import 'package:nichrome_test/common/widgets/custom_shapes/container/primary_header_container.dart';
// import 'package:nichrome_test/common/widgets/list_tiles/settings_menu_tile.dart';
// import 'package:nichrome_test/common/widgets/list_tiles/user_profile_tile.dart';
// import 'package:nichrome_test/features/personalization/screens/profile/profile.dart';
// import 'package:nichrome_test/unknown_locations/section_heading.dart';
// import 'package:nichrome_test/utils/constants/colors.dart';
// import 'package:nichrome_test/utils/constants/sizes.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// -- Header
//             XPrimaryHeaderContainer(
//               child: Column(
//                 children: [
//                   /// AppBar
//                   XAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: XColors.white),)),
//                   const SizedBox(height: XSizes.spaceBtwSections,),

//                   /// User Profile Card
//                   // XUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
//                   XUserProfileTile(onPressed: () { print("Navigating to ProfileScreen"); // Use debug logging to trace execution
//                   Get.snackbar("Debug", "Profile Tile Tapped");
//                   Get.to(() => const ProfileScreen());
//   },
// ),
//                   const SizedBox(height: XSizes.spaceBtwSections,),
//                 ],
//               )
//             ),
          
//             /// -- Body
//             Padding(
//               padding: const EdgeInsets.all(XSizes.defaultSpace,),
//               child: Column(
//                 children: [
//                   /// -- Account Settings
//                   const XSectionHeading(title: 'Account Settings', showActionButton: false,),
//                   const SizedBox(height: XSizes.spaceBtwItems,),

//                   const XSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'hmmm',),
//                   const XSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'hmmm',),
//                   const XSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'hmmm',),

//                   /// -- App Settings
//                   const SizedBox(height: XSizes.spaceBtwSections,),
//                   const XSectionHeading(title: 'App Settings', showActionButton: false,),
//                   const SizedBox(height: XSizes.spaceBtwItems,),
//                   const XSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your cloud firebase'),

//                   /// -- Logout Button
//                   const SizedBox(height: XSizes.spaceBtwSections),
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton(onPressed: (){}, child: const Text('Logout')),
//                   ),
//                   const SizedBox(height: XSizes.spaceBtwSections * 2.5,),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nichrome_test/common/widgets/appbar/appbar.dart';
import 'package:nichrome_test/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:nichrome_test/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:nichrome_test/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:nichrome_test/features/personalization/screens/profile/profile.dart';
import 'package:nichrome_test/localization/unknown_locations/section_heading.dart';
import 'package:nichrome_test/localization/profile_provider.dart';
import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.find() to access your ProfileProvider
    final profileProvider = Get.find<ProfileProvider>(); // Get the ProfileProvider instance

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            XPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  XAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(color: XColors.white),
                    ),
                  ),
                  const SizedBox(height: XSizes.spaceBtwSections),

                  /// User Profile Card
                  Obx(() => XUserProfileTile(
                    onPressed: () {
                      print("Navigating to ProfileScreen");
                      Get.snackbar("Debug", "Profile Tile Tapped");
                      Get.to(() => ProfileScreen());
                    },
                    image: profileProvider.profileImage.value, // Retrieve image from the provider
                  )),
                  const SizedBox(height: XSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(XSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const XSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: XSizes.spaceBtwItems),

                  const XSettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subTitle: 'hmmm'),
                  const XSettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subTitle: 'hmmm'),
                  const XSettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'hmmm'),

                  /// -- App Settings
                  const SizedBox(height: XSizes.spaceBtwSections),
                  const XSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: XSizes.spaceBtwItems),
                  const XSettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your cloud firebase'),

                  /// -- Logout Button
                  const SizedBox(height: XSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Add logout functionality here
                        Get.snackbar("Logout", "You have been logged out.");
                      },
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: XSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
