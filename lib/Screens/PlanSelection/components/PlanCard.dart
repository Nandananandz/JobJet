import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCardScreen extends StatelessWidget {
  const PlanCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      
        
         Container
        ( height: 12.35.h,

      width:85.w,
      margin:EdgeInsets.only(left:7.5.w,top:1.9.h),
      decoration: BoxDecoration(color: Color.fromRGBO(232, 236, 255, 1),
      borderRadius: BorderRadius.circular(1.44.w)),
      
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        
    
      children:[
        SizedBox(height: 2.h,),
        Padding(
          padding:  EdgeInsets.only(left:4.14.w),
          child: Row(
            children: [
              Text(
                          '10\$/1 Month',
                          
                          
                            style: GoogleFonts.poppins(
                        
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 1),
                            
                          
                            
                     ),
                    ),
                    SizedBox(width:22.53.w ,),
                    
     
       Container(height: 3.37.h,
       width: 14.49.w,
       
       decoration: BoxDecoration(color: Color.fromRGBO(40, 178, 251, 1)
,
      borderRadius: BorderRadius.circular(1.44.w)),
      
      margin: EdgeInsets.only(bottom: 1.h),

       child:Padding(
         padding:EdgeInsets.only(top:.40.h),
         child: Text("Basic ",
         textAlign: TextAlign.center,
         style: GoogleFonts.poppins(
                    
                        fontSize: 9.83.sp,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(255, 255, 255, 1),
                         ),
                         ),
       ),



         ), 
            ],
          ),
        ),
      
      SizedBox(height:1.73),

      Row(
        children: [
          SizedBox(width: 4.14.w,),
          Text("Unlimited job alerts and Easy apply",
          textAlign: TextAlign.left,
           style: GoogleFonts.poppins(
                      
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(29, 29, 29, 1),
          
          ),
           ),
        ],
      ),
     
       


           ],
            ),
                               
      
    
     
    );

  }}
     
      




