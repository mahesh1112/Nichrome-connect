import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nichrome_test/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';
import 'package:nichrome_test/utils/constants/text_strings.dart';
import 'package:nichrome_test/utils/validators/validation.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(XSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            const SizedBox(height: 20,),
            const Text(XTexts.forgetPasswordTitle,
              style: TextStyle(color: XColors.primary, fontSize: 32, fontWeight: FontWeight.bold)),
                // style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: XSizes.spaceBtwItems),
            const Text(XTexts.forgetPasswordSubTitle,
                style: TextStyle(color: Color.fromARGB(255, 124, 124, 124), fontSize: 16, fontWeight: FontWeight.w400)),
            const SizedBox(height: XSizes.spaceBtwSections * 1.5),
            // Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: XValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: XTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(
              height: XSizes.spaceBtwSections,
            ),

            // Submit button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: const Text('Submit')))
          ],
        ),
      ),
    );
  }
}
