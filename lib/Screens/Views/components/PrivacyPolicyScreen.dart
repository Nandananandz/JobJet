import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 3.86.w,
                        bottom: 1.46.h,
                        top: 1.23.h,
                        right: 1.46.w),
                    alignment: Alignment.center,
                    height: 4.04.h,
                    width: 8.69.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFE8ECFF)),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 1.8.h,
                      color: Color(0xFF121B54),
                    ),
                  ),
                ),
                Container(
                  //height: 5.39.h,
                  // width: 26.32.w,

                  child: Text(
                    "  Privacy",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff121B54)),
                  ),
                ),
                Container(
                  //height: 5.39.h,
                  //width: 26.32.w,

                  child: Text(
                    " Policy",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff28B2FB)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 4.2.w),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Text(
                    policy,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 11.66.sp, fontWeight: FontWeight.w600),
                  )
                ],
              )),
            ))
          ],
        ),
      ),
    );
  }
}

String policy =
    """Welcome to the Privacy Policy for the UAE Jobseeker App. This document outlines how we collect, use, and protect your personal information as you use our mobile application. Our app caters to UAE job seekers, providing a platform to view job listings without utilizing user data for marketing purposes.

Information Collection:
When you install and use the UAE Jobseeker App, we collect basic information such as your name, email address, Job position  and device information for account creation and personalized job recommendations. We do not use this data for marketing activities.

Information Usage:
The information we collect is strictly used to enhance your job search experience within the app. Your personal data is not shared with third parties for marketing purposes.

Information Sharing:
We do not share your personal information with any third parties for marketing purposes. Your data is securely stored on our servers and is only accessible to authorized personnel for app-related functionalities.

Data Security:
We prioritize the security of your personal information and have implemented stringent measures to safeguard it from unauthorized access, disclosure, or alteration. Your data is encrypted during transmission and securely stored on our servers.

User Rights:
As a user of the UAE Jobseeker App, you have the right to access, update, or delete your personal information stored within the app. Your data privacy is important to us, and we are committed to protecting it.

Cookies and Tracking Technologies:
Our app does not utilize cookies or tracking technologies for marketing purposes. Any data collected is solely for app functionality and improving user experience within the job search process.

Changes to Privacy Policy:
We may update our Privacy Policy to reflect changes in our data practices or legal requirements. Any updates will be communicated through the app or via email. By continuing to use the app, you agree to the updated Privacy Policy.

Contact Us:
If you have any questions or feedback regarding our Privacy Policy or data practices, please contact us at [contact email].

By using the UAE Jobseeker App, you agree to the terms outlined in this Privacy Policy. We are dedicated to maintaining the privacy and security of your personal information while providing a seamless job search experience. Thank you for choosing our app.""";
