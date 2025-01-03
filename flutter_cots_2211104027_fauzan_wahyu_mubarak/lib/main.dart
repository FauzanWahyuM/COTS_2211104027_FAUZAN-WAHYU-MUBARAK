import 'package:flutter/material.dart';
import 'package:flutter_cots/modules/gojek/bindings/onboarding_binding.dart';
import 'package:flutter_cots/modules/gojek/view/login_page.dart';
import 'package:flutter_cots/modules/gojek/view/main_page.dart';
import 'package:flutter_cots/modules/gojek/view/onboarding_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gojek Clone',
      initialRoute: '/onboarding',
      getPages: [
        GetPage(
            name: '/onboarding',
            page: () => OnboardingPage(),
            binding: OnboardingBinding()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/main', page: () => MainPage()),
      ],
    );
  }
}
