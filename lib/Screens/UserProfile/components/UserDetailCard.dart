import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Container(
        margin: EdgeInsets.only(left: 3.86.w,bottom: 1.46.h,top: 1.23.h,right: 1.46.w),
        alignment: Alignment.center,
        height: 4.04.h,
        width: 8.69.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFE8ECFF)
        ),
        child: InkWell(
          onTap: () { 
            Navigator.pop(context);
           },
          child: Icon(Icons.arrow_back_ios_new_rounded,size: 1.8.h,color: Color(0xFF121B54),),
        ),
        )
        ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              SizedBox(height: 1.23.h),
              Text('Complete your Profile',
              style: GoogleFonts.poppins(
                fontSize: 16.66.sp,
                fontWeight:FontWeight.w600,
                color: Color(0xFF25054D)
                ),
                ),
                 SizedBox(height: 3.93.h),
        
             
              _textfield('User name'),
        
        
              _textbox('Job Type'),
              
        
              _textbox('Total years of experience'),
        
             
              _textbox('Job Category'),
        
             
              _textbox('Current Job Tittle'),
        
             
              _textfield('Resume Link'),
              
              
              SizedBox(height: 4.49.h),
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
      ),
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


 _textbox(String text) {
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
              alignment: Alignment.centerRight,
              height: 4.94.h,
              width: 84.78.w,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFCBCBCB)),
                borderRadius: BorderRadius.circular(15),
                ),
              child: DropdownButton(
                items:null, onChanged: null)
              ),
               SizedBox(height: 1.68.h),
      ],
    );
  }