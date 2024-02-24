import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class HomeViewScreen extends StatelessWidget {
  const HomeViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Color.fromARGB(255, 22, 9, 97),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.86.h,
            ),
            Image.asset(
              "assets/discover.png",
              colorBlendMode: BlendMode.dstATop,
            ),
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
              "Swipe through thousands of job listings in \n   the UAE from top companies. Discover \n  new opportunities that match your skills \n                     and experience",
              style: GoogleFonts.nunitoSans(
                fontSize: 13.33.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7B88B3),
              ),
            ),
            SizedBox(height: 4.49.h),
            Container(
              alignment: Alignment.center,
              height: 5.84.h,
              width: 63.52.w,
              decoration: BoxDecoration(
                color: Color(0xFF1F41BA),
                borderRadius: BorderRadius.circular(5.61.h),
              ),
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Next',
                  style: GoogleFonts.poppins(
                      fontSize: 11.66.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
