import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/misc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
    if (widget.userData != null) {
      ctrl.nameController.text = widget.userData["full_name"] ?? "";
      ctrl.jobtype.text = widget.userData["industry"] ?? "";
      ctrl.experience.text = widget.userData["total_experience"] ?? "";
      ctrl.category.text = widget.userData["job_category"] ?? "";
      ctrl.currentJobTitle.text = widget.userData["current_job_position"] ?? "";
      if (widget.userData["resume"] != null)
        ctrl.Resume.text = widget.userData["resume"]["url"] ?? "";
      print(widget.userData["full_name"]);

      // print(ctrl.profileData);
    }
    super.initState();
    loadData() {}
  }

  loadData() {}

  @override
  Widget build(BuildContext context) {
    // print(ctrl.profileData);
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
              _textfield('Current Job Title', ctrl.currentJobTitle),
              _textfield('Resume Link (Google Drive Link)', ctrl.Resume,
                  maxlines: 2),
              SizedBox(height: 4.49.h),
              InkWell(
                onTap: () {
                  List<TextEditingController> allControllers = [
                    ctrl.nameController,
                    ctrl.jobtype,
                    ctrl.experience,
                    ctrl.category,
                    ctrl.currentJobTitle,
                    ctrl.Resume,
                  ];

                  List<String> missingFields = getMissingFields(allControllers);

                  final regex = RegExp(
                      r'^(https?:\/\/)?([a-zA-Z0-9_\-]+(\.[a-zA-Z0-9_\-]+)+)([\/a-zA-Z0-9_\-.?&=]*)?$');
                  if (!regex.hasMatch(ctrl.Resume.text)) {
                    Fluttertoast.showToast(msg: "Please fill an valid link");
                  } else if (missingFields.isEmpty) {
                    ctrl.updateProfile();
                  } else {
                    Fluttertoast.showToast(
                        msg: "please fill: ${missingFields.join(', ')}");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 5.50.h,
                  width: 85.40.w,
                  decoration: BoxDecoration(
                    color: Color(0xFF1F41BA),
                    borderRadius: BorderRadius.circular(5.61.h),
                  ),
                  child: (ctrl.isProfileUpdateLoad)
                      ? LoadingAnimationWidget.staggeredDotsWave(
                          color: Colors.white, size: 24)
                      : Text(
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

  _textfield(String text, TextEditingController value, {int maxlines = 1}) {
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
          height: (maxlines != 1) ? null : 4.94.h,
          width: 84.78.w,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFCBCBCB)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextFormField(
            controller: value,
            maxLines: maxlines,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.fromLTRB(2.89.w, 1.34.h, 2.89.w, 2.1.h)),
            style: GoogleFonts.poppins(
                // color: Color(0xFF1F41BA),
                color: Color(0xff1F41BA),
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
                style: GoogleFonts.poppins(
                    color: Color(0xff1F41BA),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600),
                items: type
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(
                            e,
                            style: GoogleFonts.poppins(
                                color: Color(0xff1F41BA),
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600),
                          ),
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

  List<String> getMissingFields(List<TextEditingController> controllers) {
    List<String> missingFields = [];

    for (TextEditingController controller in controllers) {
      if (controller.text.isEmpty) {
        // Add the name of the missing field to the list
        if (controller == ctrl.nameController) {
          missingFields.add("Full Name");
        } else if (controller == ctrl.jobtype) {
          missingFields.add("Job Type");
        } else if (controller == ctrl.experience) {
          missingFields.add("Total Experience");
        } else if (controller == ctrl.category) {
          missingFields.add("Job Category");
        } else if (controller == ctrl.currentJobTitle) {
          missingFields.add("Current Job Position");
        } else if (controller == ctrl.Resume) {
          missingFields.add("Resume URL");
        }
      }
    }

    return missingFields;
  }
}
