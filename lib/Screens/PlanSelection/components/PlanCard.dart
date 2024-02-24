import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCardScreen extends StatelessWidget {
  const PlanCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea
    (child: Container( height: 12.35.h,

      width:84.78.w,
      decoration: BoxDecoration(color: Color.fromRGBO(232, 236, 255, 1),
      borderRadius: BorderRadius.circular(1.44.w)),
      
      margin: EdgeInsets.only(left: 7.48.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        
    
      children:[Text(
                    '10\$/1 Month',
                    textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                  
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      
                    
                      
),
      ),
      SizedBox(height:1.73),
      Text("Unlimited job alerts and Easy apply",
      textAlign: TextAlign.left,
       style: GoogleFonts.poppins(
                  
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(29, 29, 29, 1),

),
       ),
     
       Container(height: 3.37.h,
       width: 14.49.w,
       
       decoration: BoxDecoration(color: Color.fromRGBO(40, 178, 251, 1)
,
      borderRadius: BorderRadius.circular(1.44.w)),
      
      margin: EdgeInsets.only(left: 74.63.w),

       child:Text("Basic ",
       textAlign: TextAlign.center,
       style: GoogleFonts.poppins(
                  
                      fontSize: 9.83.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
),),



         ),   ],
            ),
             ),                   
      ),
    
     
    );

  }}
     
      




