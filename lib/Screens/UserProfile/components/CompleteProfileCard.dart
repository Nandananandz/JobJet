import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/UserProfile/components/UserDetailCard.dart';
import 'package:sizer/sizer.dart';

class CompleteProfileCard extends StatelessWidget {
  const CompleteProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        // height: 50.64.h,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(4.2.w),
        width: 84.78.w,
        decoration: BoxDecoration(
            color: Color(0xFFE8ECFF), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(
              height: 2.80.h,
            ),
            Text(
              'Complete your Registration',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 13.33.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF25054D)),
            ),
            SizedBox(
              height: 1.34.h,
            ),
            Text(
              'To maximize your chances of receiving interview \n calls, complete your profile with all fields',
              textAlign: TextAlign.center,
              style: GoogleFonts.nunitoSans(
                  fontSize: 10.83.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromRGBO(0, 0, 0, 0.8)),
            ),
            SizedBox(
              height: 4.60.h,
            ),
            Image.asset(
              'assets/comp.png',
              height: 22.02.h,
              width: 61.11.w,
            ),
            SizedBox(
              height: 2.13.h,
            ),
            InkWell(
              onTap: () {
                Get.to(() => UserDetailScreen());
              },
              child: Container(
                alignment: Alignment.center,
                height: 5.50.h,
                width: 74.15.w,
                decoration: BoxDecoration(
                  color: Color(0xFF1F41BA),
                  borderRadius: BorderRadius.circular(5.61.h),
                ),
                child: Text(
                  'Complete Your Profile',
                  style: GoogleFonts.poppins(
                      fontSize: 11.66.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
