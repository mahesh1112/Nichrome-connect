
import 'package:flutter/material.dart';
import 'package:nichrome_test/common/styles/spacing_styles.dart';
import 'package:nichrome_test/features/authentication/screens/login/widgets/login_header.dart';
import 'package:nichrome_test/features/authentication/screens/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: XSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the content
            children: [
              // Logo, Title and Sub-title
              XLoginHeader(),

              // Form
              XLoginForm(),

              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
