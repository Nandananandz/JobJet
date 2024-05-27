import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class LogoutAlertDialog extends StatelessWidget {
  LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91.w,
      height: 36.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  backgroundColor: Color(0xffE8ECFF), child: Icon(Icons.close)),
            ),
          ),
          Positioned(
              //  width: 27.w,
              top: 3.7.h,
              left: 31.57.w,
              right: 31.57.w,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/logout_pop.png"))),
          Positioned(
              left: 10,
              right: 10,
              top: 19.76.h,
              child: Text(
                "Are you sure you want to logout?",
                style: GoogleFonts.poppins(
                    fontSize: 12.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 25.76.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString("STATUS", "OUT");
                      Fluttertoast.showToast(msg: "Logout succesfully");
                      Get.offAll(LoginScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                      width: 28.89.w,
                      height: 5.7.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff1F41BA))),
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 28.89.w,
                      height: 5.7.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff1F41BA),
                          border: Border.all(color: Color(0xff1F41BA))),
                      child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
