import 'package:flutter/material.dart';
import 'package:nichrome_test/common/styles/spacing_styles.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: XSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // Image
              Image(height: 100, image: AssetImage(image)),
              const SizedBox(
                height: XSizes.spaceBtwSections,
              ),

              // Title & Subtitle
              Text(
                title,
                style: const TextStyle(
                    color: Color.fromARGB(255, 42, 42, 42),
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: XSizes.spaceBtwItems,
              ),

              Text(
                subTitle,
                style: const TextStyle(
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
                    onPressed: onPressed, child: const Text('Continue')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
