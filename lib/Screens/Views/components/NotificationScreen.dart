import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
                    "  Notification",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff121B54)),
                  ),
                ),
                if (false)
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
                  Container(
                    height: 50.h,
                    alignment: Alignment.center,
                    child: Text(
                      "No Notification",
                      style: GoogleFonts.nunitoSans(
                          fontSize: 11.66.sp, fontWeight: FontWeight.w600),
                    ),
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
