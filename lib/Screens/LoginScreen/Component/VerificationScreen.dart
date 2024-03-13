import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VSucessScreen.dart';
import 'package:jobjet/Screens/LoginScreen/service/controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  AuthenticationController authctrl = Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: GetBuilder<AuthenticationController>(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 6.42.h,
                      width: 13.28.w,
                      margin: EdgeInsets.only(top: 18.69.h),
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
                Container(
                  //height: 3.8.h,
                  //width:79.46.w ,
                  margin: EdgeInsets.only(
                    top: 5.3.h,
                  ),
                  child: Text(
                    "Enter your passcode",
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff022150),
                    ),
                  ),
                ),
                Container(
                  //height: 3.h,
                  //width:59.90.w ,
                  margin: EdgeInsets.only(top: 1.5.h, left: 12.w, right: 12.w),
                  child: Text(
                    "Please enter the 4 digit verification  code sent to ${authctrl.phoneNumber}",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff717784),
                    ),
                  ),
                ),
                SizedBox(
                  height: .005.h,
                ),
                Container(
                  //  margin: EdgeInsets.only(left: 12.w),
                  child: SizedBox(
                    height: 6.5.h,
                    width: 74.w,
                    child: OtpTextField(
                      numberOfFields: 4,

                      focusedBorderColor: Colors.black,

                      showFieldAsBox: false,
                      borderWidth: 4.0,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here if necessary
                        authctrl.otpText.text = code;
                        authctrl.update();
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        authctrl.otpText.text = verificationCode;
                        authctrl.update();
                      },
                    ),
                  ),
                ),
                if (false && DateTime.now().isBefore(authctrl.resendController))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //height: 5.39.h,
                        //width: 26.32.w,
                        margin: EdgeInsets.only(
                          top: 2.8.h,
                        ),
                        child: Text(
                          "Code expires in : ",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Color(0xff79869F)),
                        ),
                      ),
                      Container(
                        width: 30.w,
                        child: TimerCountdown(
                          format: CountDownTimerFormat.minutesSeconds,
                          enableDescriptions: false,
                          timeTextStyle: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Color(0xff101B37)),
                          endTime: authctrl.resendController,
                          onEnd: () {
                            authctrl.update();
                            print("Timer finished");
                          },
                        ),
                        // child: Text(
                        //   " 00 : 56 ",
                        //   style: GoogleFonts.nunitoSans(
                        //       fontWeight: FontWeight.w400,
                        //       fontSize: 10.sp,
                        //       color: Color(0xff101B37)),
                        // ),
                      ),
                    ],
                  ),
                if (DateTime.now().isAfter(authctrl.resendController))
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 2.2.h,
                        ),
                        child: Text(
                          "Didn’t receive code?",
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Color(0xff79869F)),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          authctrl.sendOTP();
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 2.2.h),
                          child: Text(
                            " Resend Code",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 10.sp,
                                color: Color(0xff101B37)),
                          ),
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 4.7.h,
                ),
                InkWell(
                  onTap: () {
                    authctrl.VerifyOTP();
                  },
                  child: Container(
                    height: 6.5.h,
                    width: 68.98.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xff1F41BA),
                        borderRadius: BorderRadius.circular(5.h)),
                    child: (authctrl.loading)
                        ? LoadingAnimationWidget.staggeredDotsWave(
                            color: Colors.white, size: 24)
                        : Text("Verify Password",
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
