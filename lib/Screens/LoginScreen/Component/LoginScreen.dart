import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VerificationScreen.dart';
import 'package:jobjet/Screens/LoginScreen/service/controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthenticationController Authctrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<AuthenticationController>(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.42.h,
                      width: 13.28.w,
                      // alignment: Alignment.topRight,
                      margin: EdgeInsets.only(
                        top: 18.69.h,
                      ),
                      child: Image.asset("assets/logo.png"),
                    ),
                    Container(
                      //height: 5.39.h,
                      // width: 26.32.w,
                      margin: EdgeInsets.only(top: 17.69.h),
                      child: Text(
                        "Job",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 26.66.sp,
                            color: Color(0xff121B54)),
                      ),
                    ),
                    Container(
                      //height: 5.39.h,
                      //width: 26.32.w,
                      margin: EdgeInsets.only(top: 17.69.h),
                      child: Text(
                        "Jet",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 26.66.sp,
                            color: Color(0xff28B2FB)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: .2.h,
                ),
                Container(
                  //height: 3.8.h,
                  //width:79.46.w ,
                  margin: EdgeInsets.only(
                    top: 4.44.h,
                  ),
                  child: Text(
                    "Enter your mobile number",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff022150),
                    ),
                  ),
                ),
                Container(
                  // height: 3.5.h,
                  width: 59.90.w,
                  margin: EdgeInsets.only(
                    top: .89.h,
                  ),

                  child: Text(
                    "You will receive a 4 digit code to verify next",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff717784),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  // margin: EdgeInsets.only(left: 10.36.w),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(.2),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade200),
                  child: SizedBox(
                    height: 6.5.h,
                    width: 78.98.w,
                    child: InternationalPhoneNumberInput(
                      initialValue: Authctrl.countryCode,
                      hintText: "Enter Mobile Number",

                      onInputChanged: (value) {
                        // Authctrl.countryCode = value;

                        Authctrl.phoneNumber = value.phoneNumber!;
                        Authctrl.update();
                      },
                      ignoreBlank: false,
                      textStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ),
                      spaceBetweenSelectorAndTextField: 5,

                      selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          showFlags: true,
                          //useEmoji: true,
                          setSelectorButtonAsPrefixIcon: false,
                          trailingSpace: false,
                          leadingPadding: 2),
                      keyboardType: TextInputType.phone,
                      // obscureText: false,
                      textAlignVertical: TextAlignVertical.center,
                      inputDecoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(right: 15.0),
                            child: Icon(Icons.check,
                                color: (Authctrl.phoneNumber.length == 13)
                                    ? Color(0xff01C8EE)
                                    : Colors.grey),
                          ),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.39.h,
                ),
                InkWell(
                  onTap: () {
                    Authctrl.sendOTP();
                  },
                  child: Container(
                    height: 6.29.h,
                    width: 78.98.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff1F41BA),
                        borderRadius: BorderRadius.circular(5.h)),
                    child: (Authctrl.loading)
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 24)
                        : Text("Continue",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.33.sp,
                                  fontWeight: FontWeight.w600),
                            )),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
