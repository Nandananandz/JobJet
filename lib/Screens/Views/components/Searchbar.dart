import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: 3.5.h,
              width: 5.36.w,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 5.36.w),
                Container(
                    alignment: Alignment.center,
                    height: 4.60.h,
                    width: 9.90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE8ECFF)),
                    child: Image.asset("assets/menu.png")),
                SizedBox(
                  width: 4.10.w,
                ),
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
                SizedBox(
                  width: 4.78.w,
                ),
                Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFF121B54),
                )
              ],
            ),

            SizedBox(
              height: .5.h,
            ),

            //sorting code ivde thott
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 5.36.w,
                ),
                Text(
                  'Sort  by :',
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 1.95.w),
                Text(
                  'Newest Posts',
                  style: TextStyle(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 2.43.w),
                Icon(Icons.keyboard_arrow_down),
                //SizedBox(width: 32.23.w),
                Expanded(child: Container()),
                Container(
                  height: 4.h,
                  width: 3.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 5.2.w, bottom: 1.h),
                  child: Image.asset("assets/filter.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
