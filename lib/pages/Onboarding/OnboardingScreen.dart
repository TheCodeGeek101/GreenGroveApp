import 'package:flutter/material.dart';
import 'package:green_grove/pages/Onboarding/widgets/Community.dart';
import 'package:green_grove/pages/Onboarding/widgets/Cultivate.dart';
import 'package:green_grove/pages/Onboarding/widgets/Tracking.dart';
import 'package:green_grove/pages/Onboarding/widgets/Welcome.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import '../../Utils/constants.dart';
import '../SignIn/SignIn.dart';
class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      final pages = [
        WelcomeScreen(),
        Tracking(),
        CultivateScreen(),
        CommunityScreen()
      ];

    return Scaffold(
      body: LiquidSwipe(
        pages:pages,
        positionSlideIcon: 0,
        slideIconWidget: Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.green,
        )
      )
    );
  }
}