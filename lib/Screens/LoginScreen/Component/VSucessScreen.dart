import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class VSucessScreen extends StatelessWidget {
  const VSucessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:15.41.h,
                width: 25.47.w,
                margin: EdgeInsets.only(left: 33.69.w,top:30.6.h),
                child: Image.asset("assets/sucees.png"),
              ),
              SizedBox(
                height: 5.78.h,
              ),
              Container(
                height: 8.9.h,
                width:72.60.w ,
                margin: EdgeInsets.only(left:15.w),
                child: Text("Phone number Verified successfully ",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight:FontWeight.w600,
                  color: Color.fromRGBO(2, 33, 80, 1),
                ),
              
                ),
                
              ),
               SizedBox(
                height: 1.4.h,
              ),
              Container(
                height: 5.39.h,
                width:61.60.w ,
                margin: EdgeInsets.only(left:15.w),
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. ",
                style: GoogleFonts.inter(
                  fontSize: 11.66.sp,
                  fontWeight:FontWeight.w400,
                  color: Color.fromRGBO(121, 134, 159, 1),
                ),
                ),
              ),
              
            ],
          ),
      
      ),
    );
  }
}