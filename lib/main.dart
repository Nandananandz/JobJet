import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/HomeScreen/Component/HomeViewScreen.dart';
import 'package:jobjet/Screens/HomeScreen/HomScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:jobjet/Screens/Onboarding/OnboardingScreen.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/misc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

String? token;
String? userID;
String? login;
String baseUrl = "https://jobhunter.site/api/";
var profileData;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  Stripe.publishableKey =
      "pk_test_51MUX2ZSEzkLjQ54gSVUREGnf8sdy0J93dPdWSCW4qztine9WZgxNOsjnBCwm9SPKC37UVY7ib821NVrBmKWICzRw00WznOLMc9";
  await Stripe.instance.applySettings();
  token = pref.getString("TOKEN");
  userID = pref.getString("USERID");
  login = pref.getString("STATUS");
  print(token);
  if (login == "IN") {
    final Response =
        await get(Uri.parse(baseUrl + "auth/profile"), headers: AuthHeader);

    if (Response.statusCode == 200) {
      profileData = json.decode(Response.body);
    } else {
      login = "OUT";
    }
  }

  runApp(JobJet());
}

class JobJet extends StatelessWidget {
  const JobJet({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return GetMaterialApp(
        home: (login == null)
            ? HomeScreen()
            : login == "IN"
                ? (profileData != null &&
                        profileData["user_subscriptions"].length > 0)
                    ? ViewScreen()
                    : OnboardingScreen()
                : LoginScreen(),
      );
    });
  }
}
