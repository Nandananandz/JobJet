//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/main.dart';
import 'package:sizer/sizer.dart';

class OnboardCardScreen extends StatelessWidget {
  const OnboardCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [SizedBox(height: 23.14.h),
        Container(
          child: Container(
            height: 58.76.h,
            width: 113.28.w,
            //color: Color.fromRGBO(28, 37, 93, 1),
            margin: EdgeInsets.all(40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Color.fromRGBO(28, 37, 93, 1),

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
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 255, 255, 1))),
                  ),
                  SizedBox(height: 3.70.h),
                  SizedBox(
                    // height: 5.61.h,
                    width: 60.24.w,
                    child: Text(
                        "Experience First, Decide Later - No Credit Card Required. Enjoy Unlimited Job Views in the UAE for 2 Days with Free Access to All App Features.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunitoSans(
                            fontSize: 13.33.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))),
                  ),
                  SizedBox(
                    height: 5.07.h,
                  ),
                  //InkWell(onTap: (){get.to back },
                 Container(decoration: BoxDecoration(color: Color.fromRGBO(31, 65, 186, 1),
                  borderRadius: BorderRadius.circular(50 ),),
                   // color: Color.fromRGBO(31, 65, 186, 1),
                     height: 5.14.h,
                     width: 69.31.w,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
    );
  }
}
