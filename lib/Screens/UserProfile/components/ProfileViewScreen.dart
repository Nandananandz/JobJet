import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            _text("Full Name"),
            _text("Job Type"),
            _text("Total years Of experience"),
            _text("Job Category"),
            _text("Experience"),
            _text("Current Job Title"),
            Container(
              alignment: Alignment.topCenter,
              height: 10.89.h,
              width: 82.36.w,
              decoration: BoxDecoration(
                color: Color(0xFFE8ECFF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Resume link",
                      hintStyle: TextStyle(color: Color(0xFF919191))),
                  style: GoogleFonts.poppins(
                      color: Color(0xFF1D2226),
                      fontSize: 11.66.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_text(
  String text,
) {
  return Column(
    children: [
      Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: 7.3.h,
              width: 82.36.w,
              decoration: BoxDecoration(
                color: Color(0xFFE8ECFF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, left: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: text,
                      hintStyle: TextStyle(color: Color(0xFF919191))),
                  style: GoogleFonts.poppins(
                      color: Color(0xFF1D2226),
                      fontSize: 11.66.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 0.5.h,
            )
          ],
        ),
      ),
    ],
  );
}
