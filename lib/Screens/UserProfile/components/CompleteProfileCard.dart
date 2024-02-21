import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CompleteProfileCard extends StatelessWidget {
  const CompleteProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        height: 47.64.h,
        width: 84.78.w,
        decoration: BoxDecoration(
          color: Color(0xFFE8ECFF),
          borderRadius:BorderRadius.circular(10)
        ),
        child: Column(
          children: [
        
        
            Text('Complete your Registration',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 13.33.sp,
              fontWeight:FontWeight.w700,
              color: Color(0xFF25054D)
            ),
            ),
        
            SizedBox(height: 1.34.h,),
        
        
            Text('To maximize your chances of receiving interview \n calls, complete your profile with all fields',
            textAlign: TextAlign.center, 
            style: GoogleFonts.nunitoSans(
              fontSize: 10.83.sp,
              fontWeight: FontWeight.w400,
              color:Color(0xFF000000)
            ),
            ),
        
             SizedBox(height: 4.60.h,),
        
            ColorFiltered(
              colorFilter: ColorFilter.mode(Color(0xFFE8ECFF), BlendMode.color),
              child: Image.asset('assets/pic.png',
            height: 22.02.h,
            width: 61.11.w,
            ),
              ),
        
             SizedBox(height: 2.13.h,),
        
        
              Container(
                alignment: Alignment.center,
                height: 5.50.h,
                width: 85.40.w,
                decoration: BoxDecoration(
                  color: Color(0xFF1F41BA),
                  borderRadius:BorderRadius.circular(5.61.h),
                ),
                child: Text('Submit your profile',
                style: GoogleFonts.poppins(
                  fontSize: 11.66.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFFFFFF)
                ),
                ),
              )
        
        
          ],
        ),
      ),
    );
  }
}