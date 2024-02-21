import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VerificationScreen.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 6.42.h,
                  width: 13.28.w,
                 // alignment: Alignment.topRight,
                  margin: EdgeInsets.only(top:18.69.h,left: 26.19.w ),
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
            SizedBox(
              height:.2.h ,
            ),
            Container(
              //height: 3.8.h,
              //width:79.46.w ,
              margin: EdgeInsets.only(top:7.44.h,left:9.83.w),
              child: Text(
                "Enter your mobile number",
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff022150),
                ),
              ),
            ),
            
            Container(
              height: 7.h,
              width:59.90.w ,
              margin: EdgeInsets.only(top:.89.h,left:20.73.w),
              child: Text(
                "You will receive a 4 digit code   to verify next ",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff717784),
                ),
              ),
            ),
             
           SizedBox(
              height:2.h ,
            ),
            
             Container(
              margin: EdgeInsets.only(left:11.36.w ),
               child: SizedBox(
                height:6.5.h ,
                width: 78.98.w,
                
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration:InputDecoration(
                  prefixIcon: Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Image.asset(
                    'assets/country_logo.png',
                    width: 6.5.w,
                    height: 2.24.h,
                    
                    fit: BoxFit.fill,
                  ),
                ),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right:15.0),
                  child: Icon(
                    Icons.check,
                    color:Color(0xff01C8EE)
                  ),
                )
                ,
                
                border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.h),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 187, 192, 198), width: 1.h),
                    
               
                  )
                )
                           ,
               
               
                           ),
               
                 ),
             ),

          SizedBox(
              height:2.39.h ,
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerificationScreen()),
                );
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 11.36.w),
                child: Container(
                  height: 6.29.h,
                  width: 78.98.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                          color: Color(0xff1F41BA),
                          borderRadius: BorderRadius.circular(5.h)),
                      child: Text("Continue",
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
