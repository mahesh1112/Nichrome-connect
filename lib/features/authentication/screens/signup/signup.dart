import 'package:flutter/material.dart';
import 'package:nichrome_test/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:nichrome_test/utils/constants/colors.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(XSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
              Text(
                'Sign Up',
                style: TextStyle(
                    color: XColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 56),
              ),
              SizedBox(height: XSizes.spaceBtwSections),

              // FORM
              XSignupForm(),
              SizedBox(height: XSizes.spaceBtwSections),

            ],
          ),
        ),
      ),
    );
  }
}
