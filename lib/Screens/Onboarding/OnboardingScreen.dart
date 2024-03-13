import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobjet/Screens/Onboarding/Service/controller.dart';
import 'package:jobjet/Screens/Onboarding/components/OnboardCard.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  planController pctrl = Get.put(planController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 22, 9, 97),
      body: GetBuilder<planController>(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  OnboardCardScreen(),
            CarouselSlider(
                items: [
                  for (var data in pctrl.PlanList)
                    OnboardCard(
                      planData: data,
                      index: pctrl.PlanList.indexOf(data),
                    ),
                ],
                options: CarouselOptions(
                    viewportFraction: .8,
                    height: 59.h,
                    enlargeCenterPage: true))
          ],
        );
      }),
    );
  }
}
