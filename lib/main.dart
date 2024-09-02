import 'dart:convert';

import 'package:country_ip/country_ip.dart';
import 'package:engagespot_sdk/engagespot_sdk.dart';
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
String currencyCode = "INR";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  final countryIpResponse = await CountryIp.find();
  print(countryIpResponse!.countryCode);
  currencyCode = (countryIpResponse!.countryCode == "IN") ? "INR" : "USD";
  token = pref.getString("TOKEN");
  userID = pref.getString("USERID");
  login = pref.getString("STATUS");

  Engagespot.initSdk(
    isDebug: true,
    apiKey: "n76ud46qb5yq8zhlg0l9",
  );

  AuthHeader = {
    'Content-Type': 'application/json',
    "Authorization": "Bearer $token",
    "Vary": "Accept"
  };

  if (login == "IN") {
    final Response =
        await get(Uri.parse(baseUrl + "auth/profile"), headers: AuthHeader);
    print(Response.body);
    print(Response.statusCode);
    print(AuthHeader);
    if (Response.statusCode == 200) {
      try {
        profileData = json.decode(Response.body);
      } catch (e) {
        login = "OUT";
      }
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
