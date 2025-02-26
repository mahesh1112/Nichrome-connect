import 'package:flutter/material.dart';
import 'package:nichrome_test/features/authentication/controllers/login/login_controller.dart';
import 'package:nichrome_test/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:nichrome_test/features/authentication/screens/signup/signup.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/utils/constants/text_strings.dart';
import 'package:nichrome_test/utils/validators/validation.dart';

class XLoginForm extends StatelessWidget {
  const XLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: XSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => XValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: XTexts.email,
              ),
            ),
            const SizedBox(height: XSizes.spaceBtwInputFields),

            // Password
            Obx(
              () => TextFormField(
                validator: (value) =>
                    XValidator.validateEmptyText('Password', value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: XTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye),
                  ),
                ),
              ),
            ),

            const SizedBox(height: XSizes.spaceBtwInputFields / 2),

            // Remember me & Forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(XTexts.rememberMe),
                  ],
                ),

                // Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(XTexts.forgotPassword, style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),),
                ),
              ],
            ),

            const SizedBox(height: XSizes.spaceBtwSections),

            /// Sign in button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: const Text(XTexts.signIn),
              ),
            ),

            const SizedBox(height: XSizes.spaceBtwItems),

            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(
                  XTexts.createAccount,
                  style: TextStyle(color: Color.fromARGB(255, 138, 138, 138)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
