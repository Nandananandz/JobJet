import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:sizer/sizer.dart';

class UserDetailScreen extends StatefulWidget {
  var userData;
  UserDetailScreen({super.key, this.userData});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  JobController ctrl = Get.put(JobController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.userData != null) {
      print(widget.userData);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print(ctrl.profileData);
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: GetBuilder<JobController>(builder: (_) {
          return Container(
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
          );
        }),
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 1.23.h),
              Text(
                (widget.userData != null)
                    ? "Edit your Profile"
                    : 'Complete your Profile',
                style: GoogleFonts.poppins(
                    fontSize: 16.66.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF25054D)),
              ),
              SizedBox(height: 3.93.h),
              _textfield('User name', ctrl.nameController),
              _textbox('Job Type', ["Onsite", 'Remote'], ctrl.jobtype),
              _textbox(
                  'Total years of experience',
                  [
                    "1",
                    "2",
                    "3",
                    "4",
                    "5",
                    "6",
                    '7',
                    "8",
                    '9',
                    '10',
                    "11",
                    '12',
                    "13",
                    "14",
                    "15"
                  ],
                  ctrl.experience),
              _textbox('Job Category', ctrl.jobCategory, ctrl.category),
              _textfield('Current Job Tittle', ctrl.currentJobTitle),
              _textfield('Resume Link', ctrl.Resume),
              SizedBox(height: 4.49.h),
              InkWell(
                onTap: () {
                  ctrl.updateProfile();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 5.50.h,
                  width: 85.40.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF1F41BA),
                    borderRadius: BorderRadius.circular(5.61.h),
                  ),
                  child: Text(
                    'Submit your profile',
                    style: GoogleFonts.poppins(
                        fontSize: 11.66.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _textfield(String text, TextEditingController value) {
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
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCBCBCB)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: value,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.fromLTRB(2.89.w, 1.34.h, 2.89.w, 2.1.h)),
            style: GoogleFonts.poppins(
                color: Color(0xFF1F41BA),
                fontSize: 10.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 1.68.h),
      ],
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
}
