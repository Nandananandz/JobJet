import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VSucessScreen.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
            Row(
              children: [
                Container(
                  height: 6.42.h,
                  width: 13.28.w,
                
                  margin: EdgeInsets.only(top:18.69.h,left: 24.19.w ),
                  child: Image.asset("assets/logo.png"),
                  
                ),

                    Container(
                      //height: 5.39.h,
                     // width: 26.32.w,
                      margin: EdgeInsets.only(top:17.69.h),
                      child: Text("Job",
                      style: 
                        GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.66.sp,
                        color: Color(0xff121B54)),
                    
                      
                    
                      ),
                    ),
                   
                  
                Container(
                      //height: 5.39.h,
                      //width: 26.32.w,
                      margin: EdgeInsets.only(top:17.69.h),
                      child: Text("Jet",
                      style: 
                        GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 26.66.sp,
                        color: Color(0xff28B2FB)),
                    
                      
                    
                      ),
                    ),
        
          ],
        ),

        
            Container(
              //height: 3.8.h,
              //width:79.46.w ,
              margin: EdgeInsets.only(top:5.3.h,left:18.w,right: 9.83.w),
              child: Text(
                "Enter your passcode",
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff022150),
                ),
              ),
            ),
            
            Container(
              //height: 3.h,
              //width:59.90.w ,
              margin: EdgeInsets.only(top:.5.h,left:15.73.w),
              child: Text(
                "Please enter the 4 digit verification ",
                style: GoogleFonts.poppins(
                  fontSize: 11.66.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff717784),
                ),
              ),
            ),
            Container(
              //height: 7.h,
             // width:59.90.w ,
              margin: EdgeInsets.only(left:19.73.w),
              child: Text(
                " code sent to +971 5815 8985 69",
                style: GoogleFonts.poppins(
                  fontSize: 11.66.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff717784),
                ),
              ),
            ),
            SizedBox(
              height:.005.h ,
            ),
            
             Container(
              margin: EdgeInsets.only(left:12.w ),
               child: SizedBox(

                 height:6.5.h ,
                width: 74.w,
                
                child: OtpTextField(
                  numberOfFields: 4,
            
            focusedBorderColor:Colors.black,
           
            showFieldAsBox: false,
            borderWidth: 4.0,
            //runs when a code is typed in
            onCodeChanged: (String code) {
                //handle validation or checks here if necessary         
            },
            //runs when every textfield is filled 
            onSubmit: (String verificationCode) {

            }, 
    ),
                ),
                  



                
                
               ),
             Row(
               children: [
                 Container(
                          //height: 5.39.h,
                          //width: 26.32.w,
                          margin: EdgeInsets.only(top:2.8.h,left:28.80.w),
                          child: Text("Code expires in : ",
                          style: 
                            GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Color(0xff79869F)),
                        
                          
                        
                          ),
                        ),
                     Container(
                          
                          margin: EdgeInsets.only(top:2.8.h,),
                          child: Text(" 00 : 56 ",
                          style: 
                            GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            color: Color(0xff101B37)),
                        
                          
                        
                          ),
                        ),    
               ],
             ),  
            
              Row(
                children: [
                  Container(
                              
                              margin: EdgeInsets.only(top:2.2.h,left:21.46.w),
                              child: Text("Didn’t receive code?",
                              style: 
                                GoogleFonts.inter(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Color(0xff79869F)),
                            
                              
                            
                              ),
                  
                              ),
                              Container(
                              
                              margin: EdgeInsets.only(top:2.2.h),
                              child: Text(" Resend Code",
                              style: 
                                GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Color(0xff101B37)),
                            
                              
                            
                              ),
                  
                              ),
                ],
              ),
              SizedBox(
              height:4.7.h ,
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VSucessScreen()),
                );
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 14.36.w),
                child: Container(
                  height: 6.5.h,
                  width:68.98.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                          color: Color(0xff1F41BA),
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Text("Verify Password",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 13.33.sp,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
              ),
                ),

               
             
             
          ],
      ),
      ),
    
    );
  }
}