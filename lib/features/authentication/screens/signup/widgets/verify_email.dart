import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/data/repositories/authentication/authentication_repository.dart';
import 'package:nichrome_test/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              const Image(
                  height: 100, image: AssetImage(r"assets/logos/nichrome.png")),

              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // Title & Subtitle
              const Text(
                'Verify your email address!',
                style: TextStyle(
                    color: Color.fromARGB(255, 62, 62, 62),
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              Text(
                email ?? '',
                style: const TextStyle(
                    color: Color.fromARGB(255, 62, 62, 62), fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              const Text(
                'Your Account Awaits: Verify Your Email to begin.',
                style: TextStyle(
                    color: Color.fromARGB(255, 137, 137, 137), fontSize: 18),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.checkEmailVerificationStatus(),
                    child: const Text('Continue')),
              ),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () => controller.sendEmailVerification(),
                    child: const Text('Resend Email')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
