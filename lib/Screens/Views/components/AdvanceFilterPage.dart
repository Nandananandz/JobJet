import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:sizer/sizer.dart';

class AdvanceFilterPage extends StatefulWidget {
  const AdvanceFilterPage({super.key});

  @override
  State<AdvanceFilterPage> createState() => _AdvanceFilterPageState();
}

class _AdvanceFilterPageState extends State<AdvanceFilterPage> {
  JobController ctrl = Get.put(JobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: 3.86.w, bottom: 1.0.h, top: 2.23.h, right: 1.46.w),
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
            SizedBox(
              height: 1.0.h,
            ),
            Row(
              children: [
                Container(
                  //height: 5.39.h,
                  // width: 26.32.w,

                  child: Text(
                    "  Advanced",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff121B54)),
                  ),
                ),
                Container(
                  //height: 5.39.h,
                  //width: 26.32.w,

                  child: Text(
                    " Filter",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff28B2FB)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 100.w,
              height: 5,
              color: Color(0xffF2F2F2),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.2.w, vertical: 6.2.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _textbox('Job Category', ctrl.jobCategory, ctrl.Csort),
                    _textbox('Location', ctrl.locationNameList, ctrl.Lsort),
                    _textbox(
                        'Experience',
                        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                        ctrl.Esort),
                    _textfield('Salary', ctrl.Ssort),
                    _textbox(
                        'Joining time',
                        [
                          "Immediately",
                          "1 week",
                          "2 weeks",
                          "1 month",
                          "2 months"
                        ],
                        ctrl.Jsort),
                    _textbox(
                        'Sort By',
                        [
                          "Today",
                          "Yesterday",
                          "Last week",
                          "1 month",
                          "2 months"
                        ],
                        ctrl.Tsort),
                  ],
                ),
              ),
            )),
            InkWell(
              onTap: () {
                ctrl.fetchSortJob();
                if (ctrl.Tsort.text.isNotEmpty)
                  ctrl.selectedSort = ctrl.Tsort.text;

                Get.back();
              },
              child: Container(
                width: 100.w,
                margin: EdgeInsets.symmetric(horizontal: 10.2.w),
                height: 6.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff1F41BA)),
                child: Text(
                  "Apply Now",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  ctrl.Csort.text = "";
                  ctrl.Lsort.text = "";
                  ctrl.Esort.text = "";
                  ctrl.Ssort.text = "";
                  ctrl.Jsort.text = "";
                  ctrl.update();
                });
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Clear Filter",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp, fontWeight: FontWeight.w500),
                  )),
            ),
            SizedBox(
              height: 3.h,
            )
          ],
        ),
      ),
    );
  }

  _textbox(String text, List type, TextEditingController CurrentValue) {
    JobController ctrl = Get.put(JobController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style:
              GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 0.89.h),
        Container(
            alignment: Alignment.centerLeft,
            height: 4.94.h,
            width: 84.78.w,
            padding: EdgeInsets.symmetric(horizontal: 4.2.w),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFCBCBCB)),
              borderRadius: BorderRadius.circular(15),
            ),
            child: DropdownButton<String>(
                value: CurrentValue.text == "" ? null : CurrentValue.text,
                isExpanded: true,
                underline: Container(),
                // hint: Text(
                //   "$text",
                //   style: GoogleFonts.poppins(
                //       fontSize: 10.sp, fontWeight: FontWeight.w500),
                // ),
                items: type
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {
                  CurrentValue.text = value!;
                  ctrl.update();
                  setState(() {});
                })),
        SizedBox(height: 1.68.h),
      ],
    );
  }

  _textfield(String text, TextEditingController value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style:
              GoogleFonts.poppins(fontSize: 10.sp, fontWeight: FontWeight.w600),
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
          child: TextFormField(
            controller: value,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                isCollapsed: true,
                //   hintText: "$text",
                contentPadding:
                    EdgeInsets.fromLTRB(2.89.w, 1.34.h, 2.89.w, 2.1.h)),
            style: GoogleFonts.poppins(
                //   color: Color(0xFF1F41BA),
                fontSize: 10.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 1.68.h),
      ],
    );
  }
}
