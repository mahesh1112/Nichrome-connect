import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/data/repositories/authentication/authentication_repository.dart';
import 'package:nichrome_test/data/repositories/user/user_repository.dart';
import 'package:nichrome_test/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:nichrome_test/features/personalization/models/user_model.dart';
import 'package:nichrome_test/utils/popups/loaders.dart';
import 'package:nichrome_test/utils/popups/full_screen_loader.dart';

import 'package:nichrome_test/utils/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final privacyPolicy =
      true.obs; //Observable for checking/unchecking terms and conditions
  final hidePassword = true.obs; //Observable for hiding/showing password
  final email = TextEditingController(); //Controller for email input
  final lastName = TextEditingController(); //Controller for last input
  final username = TextEditingController(); //Controller for username input
  final password = TextEditingController(); //Controller for password input
  final firstName = TextEditingController(); //Controller for first input
  final phoneNumber = TextEditingController(); //Controller for phonenumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); //Form key for form validation

  // --SIGNUP
  void signup() async {
    try {
      // Start Loading

      // Start Loading
      XFullScreenLoader.openLoadingDialog(
          'We are processing your information...', XImages.docerAnimation);

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        XFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        XLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Show Success Message
      XLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      XLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
