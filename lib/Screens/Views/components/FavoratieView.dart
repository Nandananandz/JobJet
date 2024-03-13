import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.2.w),
          child: Row(
            children: [
              Text(
                "My",
                style: GoogleFonts.poppins(
                    fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                " Favorites",
                style: GoogleFonts.poppins(
                    color: Color(0xff28B2FB),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          width: 100.w,
          height: 1,
          color: Colors.black12,
        ),
        Expanded(
            child: Center(
                child: Text(
          "No Favorites",
          style: GoogleFonts.poppins(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFF121B54)),
        ))),
        //  Expanded(child: SingleChildScrollView(child: Column()))
      ],
    );
  }
}
