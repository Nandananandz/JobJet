import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
    
    );
  }
}
_textfield(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(text,
            style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600
            ),
            ),
            SizedBox(height: 0.89.h),

        Container(
          alignment: Alignment.centerLeft,
              height: 4.94.h,
              width: 84.78.w,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFCBCBCB)),
                borderRadius: BorderRadius.circular(15),
                ),

              child:TextFormField(
                decoration:InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(2.89.w, 1.34.h, 2.89.w, 2.1.h)
                ),
                style: GoogleFonts.poppins(
                  color: Color(0xFF1F41BA),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600
                ),
                  
              ),
            ),
             SizedBox(height: 1.68.h),
      ],
    ); 
  }