import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/components/Sidebar.dart';
import 'package:sizer/sizer.dart';

class NoPlanPopUp extends StatelessWidget {
  const NoPlanPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 2.3.h),
          width: 90.36.w,
          // height: 67.h,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff121B54).withOpacity(.1),
                    child: Icon(Icons.close),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 300.w,
                  height: 13.h,
                  child: Image.asset("assets/deadline.png")),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your plan has expired",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You no longer to accesss upcomming job opportunity. Let's change that. To continue using JOBJET, you will need to renew your plan",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  JobController ctrl = Get.put(JobController());
                  selectedSideMenu = 4;
                  ctrl.update();
                },
                child: Container(
                  height: 5.h,
                  width: 60.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff121B54)),
                  child: Text(
                    "Upgrade Now",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
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
