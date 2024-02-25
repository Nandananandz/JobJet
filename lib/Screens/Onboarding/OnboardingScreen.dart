import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jobjet/Screens/Onboarding/components/OnboardCard.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 9, 97),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  OnboardCardScreen(),
          CarouselSlider(
              items: [
                OnboardCardScreen(),
              ],
              options: CarouselOptions(
                  viewportFraction: .8, height: 600, enlargeCenterPage: true))
        ],
      ),
    );
  }
}
