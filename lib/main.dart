import 'package:flutter/material.dart';
import 'package:green_grove/injection_container.dart';
import 'package:green_grove/presentation/pages/Onboarding/OnboardingScreen.dart';


Future<void> main() async {
 await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboarding Screen',
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}