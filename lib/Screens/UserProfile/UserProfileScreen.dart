import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/UserProfile/components/CompleteProfileCard.dart';
import 'package:jobjet/Screens/UserProfile/components/ProfileViewScreen.dart';
import 'package:jobjet/Screens/UserProfile/components/UserDetailCard.dart';
import 'package:sizer/sizer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(top: 5.2.h, left: 35.w),
              height: 30.78.w,
              width: 30.78.w,
              //color: Colors.blue, // Add background color if necessary
              child: Image.asset(
                'assets/profile.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2.08.h),
            Text(
              "+971 521859586",
              style: GoogleFonts.poppins(
                  color: Color(0xFF3E3E3E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 2.08.h),
            //   ProfileViewScreen()
            CompleteProfileCard()
          ],
        ),
      ),
    );
  }
}
