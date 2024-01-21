import 'package:flutter/material.dart';
import 'package:green_grove/core/pages/Onboarding/OnboardingScreen.dart';
import 'package:green_grove/injection_container.dart';

Future<void> main() async  {
  runApp(MyApp());
  await initializeDependencies();

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