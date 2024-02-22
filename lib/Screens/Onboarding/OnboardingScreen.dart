import 'package:flutter/material.dart';
import 'package:jobjet/Screens/Onboarding/components/OnboardCard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff121B54),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [OnboardCardScreen()],
      ),
    );
  }
}
