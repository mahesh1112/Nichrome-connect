import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:nichrome_test/features/authentication/screens/login/login.dart';
import 'package:nichrome_test/utils/constants/image_strings.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';
import 'package:nichrome_test/utils/constants/text_strings.dart';
import 'package:nichrome_test/utils/helpers/helper_functions.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ), // AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                  image: const AssetImage(XImages.deliveredEmailIllustration),
                  width: XHelperFunctions.screenWidth() * 0.6),
              const SizedBox(height: XSizes.spaceBtwSections),

              /// Email, Title & SubTitle
              Text(email,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: XSizes.spaceBtwItems),
              Text(XTexts.changeYourPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: XSizes.spaceBtwItems * 2),
              const Text(XTexts.changeYourPasswordSubTitle,
                  style: TextStyle(color: Color.fromARGB(255, 145, 145, 145), fontSize: 16, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center),
              const SizedBox(height: XSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: const Text(XTexts.done),
                ),
              ),
              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email), child: const Text(XTexts.resendEmail, style: TextStyle(color: Color.fromARGB(255, 145, 145, 145),),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
