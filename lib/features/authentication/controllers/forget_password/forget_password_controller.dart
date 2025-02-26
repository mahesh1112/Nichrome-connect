import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/data/repositories/authentication/authentication_repository.dart';
import 'package:nichrome_test/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:nichrome_test/utils/constants/image_strings.dart';
import 'package:nichrome_test/utils/popups/full_screen_loader.dart';
import 'package:nichrome_test/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      XFullScreenLoader.openLoadingDialog(
          'Processing your request...', XImages.docerAnimation);

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to reset password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Show success screen
      XLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your Password'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      XFullScreenLoader.openLoadingDialog(
          'Processing your request...', XImages.docerAnimation);

      // Send Email to reset password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Show success screen
      XLoaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email link sent to reset your Password'.tr);
    } catch (e) {
      // Remove Loader
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
