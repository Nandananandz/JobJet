import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:jobjet/Screens/HomeScreen/Component/HomeViewScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:jobjet/Screens/Onboarding/OnboardingScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //  backgroundColor: Color(0xff121B54),

          body: Container(
        height: 100.h,
        width: 100.w,
        child: OnBoardingSlider(
          totalPage: 3,
          speed: 2,
          //  indicatorPosition: 200,
          onFinish: () async {
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setString("STATUS", "OPENED");
            Get.to(() => LoginScreen(), transition: Transition.rightToLeft);
          },
          finishButtonText: "Submit",
          finishButtonTextStyle: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, color: Colors.white),
          finishButtonStyle: FinishButtonStyle(
              backgroundColor: Color(0xff1F41BA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),

          centerBackground: true,
          headerBackgroundColor: Color(0xff121B54),

          background: [
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
          ],
          pageBodies: [
            Container(),
            Container(), Container()
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 40),
            //   child: Column(
            //     children: <Widget>[
            //       SizedBox(
            //         height: 480,
            //       ),
            //       Text('Description Text 1'),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 40),
            //   child: Column(
            //     children: <Widget>[
            //       SizedBox(
            //         height: 480,
            //       ),
            //       Text('Description Text 1'),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 40),
            //   child: Column(
            //     children: <Widget>[
            //       SizedBox(
            //         height: 480,
            //       ),
            //       Text('Description Text 1'),
            //     ],
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
