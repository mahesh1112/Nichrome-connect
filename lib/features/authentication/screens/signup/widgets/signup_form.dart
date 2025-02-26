// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:nichrome_test/features/authentication/controllers/signup/signup_controller.dart';
// import 'package:nichrome_test/utils/constants/colors.dart';
// import 'package:nichrome_test/utils/constants/sizes.dart';
// import 'package:nichrome_test/utils/constants/text_strings.dart';
// import 'package:nichrome_test/utils/validators/validation.dart';

// class XSignupForm extends StatelessWidget {
//   const XSignupForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignupController());
//     return Form(
//       key: controller.signupFormKey,
//       child: Column(
//         children: [
//           // First & Last Name
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   controller: controller.firstName,
//                   validator: (value) =>
//                       XValidator.validateEmptyText('First Name', value),
//                   expands: false,
//                   decoration: const InputDecoration(
//                       labelText: "First Name", prefixIcon: Icon(Iconsax.user)),
//                 ),
//               ),
//               const SizedBox(
//                 width: XSizes.spaceBtwInputFields,
//               ),
//               Expanded(
//                 child: TextFormField(
//                   controller: controller.lastName,
//                   validator: (value) =>
//                       XValidator.validateEmptyText('Last Name', value),
//                   expands: false,
//                   decoration: const InputDecoration(
//                       labelText: "Last Name", prefixIcon: Icon(Iconsax.user)),
//                 ),
//               )
//             ],
//           ),
//           const SizedBox(height: XSizes.spaceBtwInputFields),

//           // Username
//           TextFormField(
//             controller: controller.username,
//             validator: (value) =>
//                 XValidator.validateEmptyText('Username', value),
//             expands: false,
//             decoration: const InputDecoration(
//                 labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
//           ),
//           const SizedBox(height: XSizes.spaceBtwInputFields),

//           // Email
//           TextFormField(
//             controller: controller.email,
//             validator: (value) => XValidator.validateEmail(value),
//             decoration: const InputDecoration(
//                 labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
//           ),
//           const SizedBox(height: XSizes.spaceBtwInputFields),

//           // Phone number
//           TextFormField(
//             controller: controller.phoneNumber,
//             validator: (value) => XValidator.validatePhoneNumber(value),
//             decoration: const InputDecoration(
//                 labelText: XTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
//           ),
//           const SizedBox(height: XSizes.spaceBtwInputFields),

//           // Password
//           Obx(
//             () => TextFormField(
//               controller: controller.password,
//               validator: (value) => XValidator.validatePassword(value),
//               obscureText: controller.hidePassword.value,
//               decoration: InputDecoration(
//                 labelText: XTexts.password,
//                 prefixIcon: const Icon(Iconsax.password_check),
//                 suffixIcon: IconButton(
//                     onPressed: () => controller.hidePassword.value =
//                         !controller.hidePassword.value,
//                     icon: Icon(controller.hidePassword.value
//                         ? Iconsax.eye_slash
//                         : Iconsax.eye)),
//               ),
//             ),
//           ),
//           const SizedBox(height: XSizes.spaceBtwSections),

//           // Terms and Conditions checkbox
//           Row(
//             children: [
//               SizedBox(
//                   width: 24,
//                   height: 24,
//                   child: Obx(() => Checkbox(
//                       value: controller.privacyPolicy.value,
//                       onChanged: (value) => controller.privacyPolicy.value =
//                           !controller.privacyPolicy.value))),
//               const SizedBox(width: XSizes.spaceBtwItems),
//               Text.rich(TextSpan(children: [
//                 TextSpan(
//                     text: 'I agree to ',
//                     style: TextStyle(color: Colors.grey[600], fontSize: 15)),
//                 const TextSpan(
//                     text: 'Privacy Policy',
//                     style: TextStyle(
//                         color: XColors.primary,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                         decoration: TextDecoration.underline,
//                         decorationColor: XColors.primary)),
//                 TextSpan(
//                     text: ' and ',
//                     style: TextStyle(color: Colors.grey[600], fontSize: 15)),
//                 const TextSpan(
//                     text: 'Terms of use',
//                     style: TextStyle(
//                         color: XColors.primary,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 15,
//                         decoration: TextDecoration.underline,
//                         decorationColor: XColors.primary)),
//               ]))
//             ],
//           ),

//           const SizedBox(height: XSizes.spaceBtwSections),

//           // Sign Up Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: controller.signup,
//               // onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmailScreen()));},
//               child: const Text('Create Account'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




























import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nichrome_test/features/authentication/controllers/signup/signup_controller.dart';
import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';
import 'package:nichrome_test/utils/constants/text_strings.dart';
import 'package:nichrome_test/utils/validators/validation.dart';

class XSignupForm extends StatelessWidget {
  const XSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // First & Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      XValidator.validateEmptyText('Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Name", prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: XSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      XValidator.validateEmptyText('Role', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: "Role", prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(height: XSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                XValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: "Username", prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: XSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => XValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: "Email", prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: XSizes.spaceBtwInputFields),

          // Phone number
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => XValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: XTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: XSizes.spaceBtwInputFields),




          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => XValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: XTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye)),
              ),
            ),
          ),
          const SizedBox(height: XSizes.spaceBtwSections),

          // Terms and Conditions checkbox
          Row(
            children: [
              SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(() => Checkbox(
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value))),
              const SizedBox(width: XSizes.spaceBtwItems),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'I agree to ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                const TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        color: XColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: XColors.primary)),
                TextSpan(
                    text: ' and ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 15)),
                const TextSpan(
                    text: 'Terms of use',
                    style: TextStyle(
                        color: XColors.primary,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: XColors.primary)),
              ]))
            ],
          ),

          const SizedBox(height: XSizes.spaceBtwSections),

          // Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.signup,
              // onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyEmailScreen()));},
              child: const Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }
}
