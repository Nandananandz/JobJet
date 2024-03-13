import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/UserProfile/components/CompleteProfileCard.dart';
import 'package:jobjet/Screens/UserProfile/components/ProfileViewScreen.dart';
import 'package:jobjet/Screens/UserProfile/components/UserDetailCard.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:sizer/sizer.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  JobController ctrl = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    print(ctrl.profileData);
    var profileData = ctrl.profileData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Get.to(() => UserDetailScreen(
                  userData: profileData,
                ));
          },
          child: Container(
            // margin: EdgeInsets.only(top: 5.2.h, left: 35.w),
            height: 30.78.w,
            //width: 30.78.w,
            //color: Colors.blue, // Add background color if necessary
            child: Image.asset(
              (profileData["profile"] != null)
                  ? "assets/editProfile.png"
                  : 'assets/profile.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 2.08.h),
        Text(
          profileData["mobile"],
          style: GoogleFonts.poppins(
              color: Color(0xFF3E3E3E),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 2.08.h),
        //   ProfileViewScreen()
        if (profileData["profile"] == null) CompleteProfileCard(),
        if (profileData["profile"] != null)
          ProfileViewScreen(profile: profileData["profile"])
      ],
    );
  }
}
