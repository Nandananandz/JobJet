import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:sizer/sizer.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        //padding: EdgeInsets.all(4.2.w),
        color: Color.fromARGB(255, 22, 9, 97),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Image.asset(
            //   "assets/discover.png",
            //   colorBlendMode: BlendMode.multiply,
            // ),
            SizedBox(
              height: 3.37.h,
            ),
            Text(
              "Find Your Dream\n              Job",
              style: GoogleFonts.poppins(
                fontSize: 26.66.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFEFEFE),
              ),
            ),
            SizedBox(
              height: 0.24.h,
            ),
            Text(
              "Swipe through thousands of job listings in  the UAE from top companies. Discover new opportunities that match your skills and experience",
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                fontSize: 13.33.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B88B3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
