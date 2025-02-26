import 'package:get/get.dart';

class ProfileProvider extends GetxController {
  // Observable string for profile image, starts with a default image
  var profileImage = 'assets/images/content/user.png'.obs; // Default image path

  // Method to update profile image
  void updateProfileImage(String newImagePath) {
    if (newImagePath.isNotEmpty) {
      profileImage.value = newImagePath; // Update image path
    } else {
      profileImage.value = 'assets/images/content/user.png'; // Reset to default if the path is empty
    }
  }
}
