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
         // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height:15.41.h,
                width: 28.47.w,
                margin: EdgeInsets.only(left: 35.69.w,top:23.6.h),
                child: Image.asset("assets/sucees.png"),
              ),
              SizedBox(
                height: 6.8.h,
              ),
              Container(
                //height: 4.45.h,
                //width:72.60.w ,
                margin: EdgeInsets.only(left:12.w),
                child: Text("Phone number Verified \n successfully ",
                textAlign: TextAlign.center,
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
                //height: 2.69.h,
                //width:61.60.w ,
                margin: EdgeInsets.only(left:12.w),
                child: Text("Lorem ipsum dolor sit amet, consectetur \n adipiscing elit.",
                textAlign: TextAlign.center,
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