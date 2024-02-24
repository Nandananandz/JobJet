import 'package:flutter/material.dart';
import 'package:jobjet/Screens/Onboarding/components/OnboardCard.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 14, 30, 130),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [Expanded(
            child: Center(
              child: OnboardCardScreen(),
            ),
        
      ),
        ],
    ),
    );
  }
}
