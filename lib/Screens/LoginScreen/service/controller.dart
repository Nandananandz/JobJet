import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VSucessScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VerificationScreen.dart';
import 'package:jobjet/Screens/Onboarding/OnboardingScreen.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  String phoneNumber = "";
  bool loading = false;
  TextEditingController otpText = TextEditingController();
  DateTime resendController = DateTime.now();

  void sendOTP() async {
    loading = true;
    print(phoneNumber);
    update();
    final Response = await post(Uri.parse(baseUrl + "auth/send-otp"),
        body: {"mobile": phoneNumber});
    loading = false;
    print(json.encode({"mobile": phoneNumber}));
    update();
    if (Response.statusCode == 200) {
      resendController = resendController.add(Duration(seconds: 30));
      var data = json.decode(Response.body);
      Fluttertoast.showToast(msg: data["message"]);
      Get.to(() => VerificationScreen(), transition: Transition.rightToLeft);
    } else {
      var data = json.decode(Response.body);
      Fluttertoast.showToast(msg: data["message"]);
    }
  }

  void VerifyOTP() async {
    loading = true;
    update();
    final Response = await post(Uri.parse(baseUrl + "auth/verify-otp"),
        headers: AuthHeader,
        body: json.encode({"mobile": phoneNumber, "otp": otpText.text}));
    loading = false;
    update();
    if (Response.statusCode == 200) {
      var data = json.decode(Response.body);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("STATUS", "IN");

      pref.setString("TOKEN", data["token"]);
      pref.setString("PHONE", phoneNumber);
      token = data["token"];
      AuthHeader = {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
        "Vary": "Accept"
      };
      update();
      Get.to(() => VSucessScreen(), transition: Transition.rightToLeft);
      await Future.delayed(Duration(seconds: 3));
      final log =
          await get(Uri.parse(baseUrl + "auth/profile"), headers: AuthHeader);

      if (log.statusCode == 200) {
        profileData = json.decode(log.body);
        var data = Get.offAll(
            () => (profileData["user_subscriptions"].length > 0)
                ? ViewScreen()
                : OnboardingScreen(),
            transition: Transition.rightToLeft);
      }
      //
    } else {
      Fluttertoast.showToast(msg: "Invalid OTP ,Please re-enter OTP");
    }
  }
}
