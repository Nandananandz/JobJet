import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/main.dart';
import 'package:sizer/sizer.dart';

class PlanSelectionScreen extends StatelessWidget {
  const PlanSelectionScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
         // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left:32.78.w,top: 10.33.h),
              child: SizedBox(
                height:5.39.h ,
                //width: 30.67.w,
                 
                child: Text("0 days Left",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight:FontWeight.w700,
                  color: Color(0xffFF0303),
                
                ),

              
                
                ),
              ),
            ),
            SizedBox(
              height: .67.h,
            ),
              Padding(
              padding: EdgeInsets.only(left:24.78.w,),
              child: SizedBox(
                height:2.39.h ,
                //width: 30.67.w,
                 
                child: Text("Your Premium plan Expired",
                style: GoogleFonts.poppins(
                  fontSize: 11.66.sp,
                  fontWeight:FontWeight.w400,
                  color: Color(0xff000000),
                
                ),

              
                
                ),
              ),
            ),
            SizedBox(
              height: .67.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 26.78.w),
              child: SizedBox( 
                //height:2.39.h ,
                  //width: 30.67.w,
                   
                  child: Text("August 22, 2023, 05:30PM",
                  style: GoogleFonts.poppins(
                    fontSize: 11.66.sp,
                    fontWeight:FontWeight.w400,
                    color: Color(0xff000000),
                  
                  ),
              
                
                  
                  ),
                
              
              ),
            ),
            SizedBox(
              height: 2.58.h,
            ),
            Stack(

              children: [
                Padding(
                padding: EdgeInsets.only(left:16.88.w,top: 6.h),
                child: SizedBox(
                  width:66.66.w,
                  height:3.9,
                  
                  child: Image.asset("assets/line.png"),
                  
                ),
              ),
            
            Padding(
              padding:  EdgeInsets.only(left:34.4.w,top:3.9.h),
              child: Container(
                height: 4.70.h,
                width:32.75.w,
                alignment: Alignment.center,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Color(0xff121B54)),
                  child:Text("Plans",
                  style: GoogleFonts.poppins(
                    fontSize:13.33.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffFFF9F9),
                  ),
              
                  ),
              
              
                ),
            ),
              ],
            ),
            

            SizedBox(
              height:41.84.h ,
            ),
            InkWell(
              onTap: (){
                
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 10.36.w),
                child: Container(
                  height: 6.29.h,
                  width: 78.98.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                          color: Color(0xff1F41BA),
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Text("Choose Plan",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13.33.sp,
                                fontWeight: FontWeight.w600),
                          ),),
                    ),
              ),
                ),

          ],
        ),
      ),
        bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png",width: 11.70.w, height: 5.39.h),
            label: "Home",
            
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/iconhome.png",width: 11.70.w, height: 5.39.h),
             label: "Data",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/wallet.png",width: 11.70.w, height: 5.39.h),
             label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/homeicon.png",width: 11.70.w, height: 5.39.h),
             label: "Profile",
            
          ),
          
        ],
        iconSize:1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value){},
      ),
    );
  }
}
      
            
         
        
        
    
    