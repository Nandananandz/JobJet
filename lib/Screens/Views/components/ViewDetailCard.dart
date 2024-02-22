import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/main.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class ViewDetailCard extends StatelessWidget {
  const ViewDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(6),
                height: 62.98.h,
                width: 99.27.w,
                color: Color(0xFFFFFFFF),
        
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3.h,),
              Row(
                children: [
      
                  Container(
                    height: 4.44.h,
                    width: 10.38.w,
                    decoration: BoxDecoration(
                      color:Color(0xFF121B54),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Image.asset('assets/doctor.png',
                    height: 3.18.h,
                    width: 6.85.w,
                    ),
                  ),
                  
                  SizedBox(width: 2.89.w,),
      
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Customers service Executive',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 11.66.sp,
                          fontWeight: FontWeight.w700,
                          
                        ),
                        ),
                        Row(
                          children: [
                            Text('Posted on : Yesterday',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 80)
                            ),
                            ),

                            SizedBox(width: 3.86.w,),
                    
                            Icon(Icons.location_on_rounded,color: Color(0xFF1F41BA),size: 12,),
                            Text('Abudhabi',
                            style: GoogleFonts.nunitoSans(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromRGBO(0, 0, 0, 80)
                            ),
                            )
                          ],
                        ) 
                      ],
                    ),
                  ),

                  Image.asset("assets/like.png",
                  height:2.70.h,
                  width:6.20.w,
                  )

                  
                ],
              ),

              SizedBox(height: 2.35.h,),
              
              ReadMoreText('Customers service Executive \n\nMust have their own visa with minimum 8 months validity for self & Sponsor visa (Husband sponsor, Father Sponsor, Wife Sponsor or freelance Visa',
                  trimLines: 4,
                  colorClickableText: Color(0xFF000000),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'see more',
                  trimExpandedText: '..see less',
                  moreStyle:GoogleFonts.nunitoSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                  lessStyle:GoogleFonts.nunitoSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.8),
                  ),
                   style: GoogleFonts.nunitoSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.8)
                  ),
                  ),
              
              Container(
                height: 41.46.h,
                width: 99.27.w,
                child: Image.asset('assets/hiring.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}