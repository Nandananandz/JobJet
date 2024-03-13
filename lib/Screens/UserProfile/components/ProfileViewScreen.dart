import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileViewScreen extends StatelessWidget {
  var profile;
  ProfileViewScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 100.w,
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            _text("Full Name", profile["full_name"]),
            _text("Job Type", profile["industry"]),
            _text("Job Category", profile["job_category"]),
            _text("Experience", profile["total_experience"]),
            _text("Current Job Title", profile["current_job_position"]),
            _text("Resume Link", profile["resume"]["url"]),
          ],
        ),
      ),
    );
  }
}

_text(
  String title,
  String data,
) {
  return Container(
    alignment: Alignment.centerLeft,
    //height: 10.89.h,
    margin: EdgeInsets.only(top: 6),
    width: 80.36.w,
    padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 10),
    decoration: BoxDecoration(
      color: Color(0xFFE8ECFF),
      borderRadius: BorderRadius.circular(6),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              color: Colors.grey, fontSize: 10.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          data,
          style: GoogleFonts.poppins(
              color: Color(0xff1D2226),
              fontSize: 11.sp,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
