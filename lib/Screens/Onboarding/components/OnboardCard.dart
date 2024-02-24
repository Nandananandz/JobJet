//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/main.dart';
import 'package:sizer/sizer.dart';

class OnboardCardScreen extends StatelessWidget {
  const OnboardCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Container(
              height: 58.76.h,
              width: 80.28.w,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Color.fromRGBO(28, 37, 93, 1),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 7.07.h,
                    ),
                    Container(
                      //height: 3.247.h,
                      //width: 29.29.w,
                      child: Text("Free Trial",
                          style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    SizedBox(height: 5.05.h),
                    SizedBox(
                      //height: 2.24..h,
                      //width: 25.36.w,
                      child: Text(
                        "\$0.00",
                        style: GoogleFonts.poppins(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.28.h),
                    SizedBox(
                      // height: 30.85.h,
                      //width: 20.11.w,
                      child: Text("For 2 days",
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    SizedBox(height: 3.28.h),
                    SizedBox(
                      // height: 30.85.h,
                      width: 59.66.w,
                      child: Text(
                          "Experience First, Decide Later - \n No Credit Card Required. Enjoy \n Unlimited Job Views in the UAE \n for 2 Days with Free Access to All \n App Features.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunitoSans(
                              fontSize: 9.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(123, 136, 179, 1))),
                    ),
                    SizedBox(
                      height: 4.07.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(31, 65, 186, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 6.4.h,
                      width: 69.31.w,
                      child: Padding(
                        padding: const EdgeInsets.all(8.5),
                        child: Text("Start free Trial",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 13.33.sp,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 255, 255, 1))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
