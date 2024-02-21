import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container( 
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 4.60.h,width: 9.90.w,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFE8ECFF)),
                    child: Icon(Icons.menu,color: Color(0xFF141F5A),),
                  ),
                  SizedBox(width: 4.10.w,),
                  Container(
                    height: 4.49.h,width: 63.28.w,
                    
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xFFE8ECFF),),
                    child: TextFormField(decoration: InputDecoration(border: InputBorder.none,prefixIcon: Icon(Icons.search_outlined,color: Color(0xFF141F5A),),hintText: "Search for job titles",hintStyle: GoogleFonts.poppins(fontSize: 3.66.sp,fontWeight: FontWeight.w400,color: Color(0xFF696969))),),
                  ),
                  SizedBox(width: 4.83.w,),
                  Icon(Icons.notifications_outlined,color: Color(0xFF121B54),)
                ],
              )
              //sorting code ivde thott
            ],
            
           
        
            
          ),
                
                  ),
      ),
                
              
              
              
            
          
        );
        
      
    
  }
}