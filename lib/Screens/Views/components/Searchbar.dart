import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      height: 4.60.h,
                      width: 9.90.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFE8ECFF)),
                      child: Icon(Icons.menu_outlined,
                        color: Color(0xFF141F5A),
                      ),
                    ),

                    SizedBox(width: 4.10.w,),


                    //Search bar
                    Container(
                      height: 4.49.h,
                      width: 63.28.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE8ECFF),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: Color(0xFF141F5A),
                            ),
                            hintText: "Search for job titles",
                            hintStyle: GoogleFonts.poppins(
                                fontSize: 11.66.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF696969))),
                      ),
                    ),

                    SizedBox(width: 4.83.w,),
                    //notification
                    Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFF121B54),
                    )
                  ],
                ),



                //sorting code ivde thott
                Row(
                  children: [
                    Text(
                      'sortby : Newest post',
                      style: TextStyle(
                        fontSize: 10.0.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 3.37.h,
                        width: 7.24.w,
                        child: Icon(Icons.tune, color: Colors.white),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(31, 65, 186, 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
