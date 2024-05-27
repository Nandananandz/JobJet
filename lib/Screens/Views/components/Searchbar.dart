import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/Screens/Views/components/AdvanceFilterPage.dart';
import 'package:jobjet/Screens/Views/components/NotificationScreen.dart';
import 'package:jobjet/misc.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  JobController ctrl = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
              InkWell(
                onTap: () {
                  navigatorKey.currentState!.openDrawer();
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 4.60.h,
                    width: 9.90.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFE8ECFF)),
                    child: Image.asset("assets/menu.png")),
              ),
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
                child: TextField(
                  onSubmitted: (value) {
                    ctrl.fetchJobs(search: value, sort: ctrl.selectedSort);
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_outlined,
                        color: Color(0xFF141F5A),
                      ),
                      hintText: "Search for job titles",
                      isDense: true,
                      hintStyle: GoogleFonts.poppins(
                          fontSize: 11.66.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF696969))),
                ),
              ),
              SizedBox(
                width: 4.78.w,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => NotificationScreen(),
                      transition: Transition.rightToLeft);
                },
                child: myAppBarIcon( ctrl.notifications != null ? ctrl.notifications!.unReadCount ?? 0 : 0)
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
              DropdownButton(
                  value: ctrl.selectedSort,
                  underline: Container(),
                  items:
                      ["Today", "Yesterday", "Last week", "1 month", "2 months"]
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 10.0.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ))
                          .toList(),
                  onChanged: (ValueKey) {
                    setState(() {
                      ctrl.selectedSort = ValueKey!;
                    });

                    ctrl.fetchJobs(sort: ValueKey!.toLowerCase());
                  }),
              SizedBox(width: 2.43.w),
              //Icon(Icons.keyboard_arrow_down),
              //SizedBox(width: 32.23.w),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  // selectedBottomindex = 2;
                  // notifer.value++;
                  Get.to(() => AdvanceFilterPage(),
                      transition: Transition.rightToLeft);
                },
                child: Container(
                  height: 4.h,
                  width: 3.h,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: 5.2.w, bottom: 1.h),
                  child: Image.asset("assets/filter.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
