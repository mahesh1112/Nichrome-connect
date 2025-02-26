import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nichrome_test/features/authentication/screens/login/login.dart';
import 'package:nichrome_test/utils/theme/theme.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.system,
//       theme: XAppTheme.lightTheme,
//       darkTheme: XAppTheme.darkTheme,
//     );
//   }
// }

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        themeMode: ThemeMode.system,
        theme: XAppTheme.lightTheme,
        darkTheme: XAppTheme.darkTheme,
        // initialBinding: GeneralBindings(),
        home: const LoginScreen());
  }
}
