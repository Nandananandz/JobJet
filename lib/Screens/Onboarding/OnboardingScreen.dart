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
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: 68.28.w,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF161F59).withOpacity(.7),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(17),
                                  topRight: Radius.circular(17)),
                            ),
                          ),
                          Expanded(
                            child: OnboardCard(
                              planData: data,
                              index: pctrl.PlanList.indexOf(data),
                            ),
                          ),
                          Container(
                            width: 68.28.w,
                            height: 17,
                            decoration: BoxDecoration(
                              color: Color(0xFF161F59).withOpacity(.7),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(17),
                                  bottomRight: Radius.circular(17)),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
                options: CarouselOptions(
                    viewportFraction: .8,
                    height: 63.h,
                    enlargeCenterPage: true))
          ],
        );
      }),
    );
  }
}
