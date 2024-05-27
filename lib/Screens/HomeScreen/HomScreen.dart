import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
//import 'package:flutter_image_slider/carousel.dart';
//import 'package:infinite_carousel/infinite_carousel.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> slider = [
    SizedBox(
      height: 100.h,
      width: 100.w,
      child: Image.asset(
        "assets/onboarding.png",
        colorBlendMode: BlendMode.multiply,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: 100.h,
      width: 100.w,
      child: Image.asset(
        "assets/onboarding2.png",
        //   colorBlendMode: BlendMode.multiply,
        fit: BoxFit.cover,
      ),
    ),
    SizedBox(
      height: 100.h,
      width: 100.w,
      child: Image.asset(
        "assets/onboarding3.png",
        //  colorBlendMode: BlendMode.multiply,
        fit: BoxFit.cover,
      ),
    ),
  ];
  int selectedIndex = 0;
  CarouselController ctrl = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xff121B54),
          body: Container(
            width: 100.w,
            height: 100.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70.h,
                  child: CarouselSlider(
                      items: slider,
                      carouselController: ctrl,
                      options: CarouselOptions(
                        height: 70.h,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        reverse: false,
                        autoPlay: false,
                        onPageChanged: (index, reason) {
                          selectedIndex = index;
                          setState(() {});
                        },
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        scrollDirection: Axis.horizontal,
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var data in [0, 1, 2])
                      Container(
                        height: 6,
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: (selectedIndex == data) ? 20 : 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: (selectedIndex != data)
                                ? Colors.white38
                                : Colors.white),
                      )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {
                    if (selectedIndex < 2) {
                      selectedIndex = selectedIndex + 1;
                      ctrl.jumpToPage(selectedIndex);
                      setState(() {});
                    } else {
                      Get.off(() => LoginScreen(),
                          transition: Transition.rightToLeft);
                    }
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xff1F41BA)),
                    child: Text(
                      (selectedIndex != 2) ? "Next" : "Submit",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.66.sp,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
