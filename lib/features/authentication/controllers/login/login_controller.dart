import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nichrome_test/data/repositories/authentication/authentication_repository.dart';
import 'package:nichrome_test/features/personalization/controllers/user_controller.dart';
import 'package:nichrome_test/utils/constants/image_strings.dart';
import 'package:nichrome_test/utils/popups/full_screen_loader.dart';
import 'package:nichrome_test/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    // Ensure default values if null
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// -- Email And Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      XFullScreenLoader.openLoadingDialog(
          'Logging you in...', XImages.docerAnimation);

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        XFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // Login user using Email and Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save User Record
      //await userController.saveUserRecord(userCredentials);

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      XFullScreenLoader.openLoadingDialog(
          'Logging you in...', XImages.docerAnimation);

      // Google Authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      XFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loader
      XFullScreenLoader.stopLoading();
      XLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
