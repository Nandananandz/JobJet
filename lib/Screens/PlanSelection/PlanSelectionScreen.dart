import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:jobjet/Screens/PlanSelection/components/PlanCard.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/Screens/Views/components/Sidebar.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/utlis/BottomBar.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';
import 'package:sizer/sizer.dart';

class PlanSelectionScreen extends StatefulWidget {
  PlanSelectionScreen({super.key});

  @override
  State<PlanSelectionScreen> createState() => _PlanSelectionScreenState();
}

class _PlanSelectionScreenState extends State<PlanSelectionScreen> {
  JobController ctrl = Get.put(JobController());

  String formateTime(String dt) {
    DateTime date = DateTime.parse(dt);
    return DateFormat("MMM dd , yyyy hh:mm a").format(date);
  }

  String releativeTime(String time, BuildContext context) {
    DateTime otherTime = DateTime.parse(time);

    if (otherTime.isAfter(DateTime.now())) {
      RelativeDateTime _relativeDateTime =
          RelativeDateTime(dateTime: DateTime.now(), other: otherTime);
      RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
        Localizations.localeOf(context),
      );
      return _relativeDateFormatter.format(_relativeDateTime);
    }

    return "0 Days";
  }

  List planList = [];

  loadPlans() async {
    final Response = await get(Uri.parse(baseUrl + "subscriptions/"));

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      planList = js["data"];
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPlans();
  }

  JobController jctrl = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        selectedSideMenu = 0;
        notifer.value++;
      },
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.33.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  selectedSideMenu = 0;
                  notifer.value++;
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: 3.86.w, bottom: 1.46.h, top: 1.23.h, right: 1.46.w),
                  alignment: Alignment.center,
                  height: 4.04.h,
                  width: 8.69.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE8ECFF)),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 1.8.h,
                    color: Color(0xFF121B54),
                  ),
                ),
              ),
            ),
          ),
          GetBuilder<JobController>(builder: (_) {
            return SizedBox(
              height: 5.39.h,
              //width: 30.67.w,

              child: Text(
                "${releativeTime(ctrl.profileData["user_subscriptions"][0]["end_date"], context).replaceAll("in", "")}  Left",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFF0303),
                ),
              ),
            );
          }),
          SizedBox(height: .67.h),
          Container(
            //height:2.39.h ,
            //width: 30.67.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Your Premium plan Expired ${formateTime(jctrl.profileData["user_subscriptions"][0]["end_date"])}",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 11.66.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff000000),
              ),
            ),
          ),
          SizedBox(
            height: 2.58.h,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 6.h),
                child: SizedBox(
                  width: 66.66.w,
                  height: 3.9,
                  child: Image.asset("assets/line.png"),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 3.9.h),
                child: Container(
                  height: 4.70.h,
                  width: 32.75.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff121B54)),
                  child: Text(
                    "Plans",
                    style: GoogleFonts.poppins(
                      fontSize: 13.33.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffFFF9F9),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.73.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //  SizedBox(height:1.5.h),

                  for (var data in planList)
                    if (data["is_trial"] != 1)
                      PlanCardScreen(
                          planData: data, index: planList.indexOf(data)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              height: 6.29.h,
              width: 78.98.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xff1F41BA),
                  borderRadius: BorderRadius.circular(5.h)),
              child: Text(
                "Choose Plan",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 13.33.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
