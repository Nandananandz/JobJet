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
<<<<<<< HEAD
              // margin: EdgeInsets.only(top: 5.2.h, left: 35.w),
              height: 30.78.w,
              width: 30.78.w,
=======
              margin: EdgeInsets.only(top: 5.2.h, left: 3.w),
              height: 18.78.w,
              width: 18.78.w,
>>>>>>> fe819e838c1eff04ef5b4f91bc607fea293d7ca3
              //color: Colors.blue, // Add background color if necessary
              child: Image.asset(
                'assets/profile.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2.08.h),
<<<<<<< HEAD
            Text(
              "+971 521859586",
              style: GoogleFonts.poppins(
                  color: Color(0xFF3E3E3E),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700),
=======
            Padding(
              padding: EdgeInsets.only(
                left:2.w,
              ),
              child: Text(
                "+971 521859586",
                style: GoogleFonts.poppins(
                    color: Color(0xFF3E3E3E),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700),
              ),
>>>>>>> fe819e838c1eff04ef5b4f91bc607fea293d7ca3
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
