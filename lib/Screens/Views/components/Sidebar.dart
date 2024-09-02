import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:jobjet/Screens/PlanSelection/PlanSelectionScreen.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/Screens/Views/components/NotificationScreen.dart';
import 'package:jobjet/Screens/Views/components/PrivacyPolicyScreen.dart';
import 'package:jobjet/misc.dart';
import 'package:jobjet/utlis/logoutPopUp.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

int selectedSideMenu = 0;

class SideBar extends StatelessWidget {
  ValueNotifier notifier;
  SideBar({super.key, required this.notifier});
  JobController jctrl = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      color: Color(0xff272152),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Container(
              margin: EdgeInsets.only(left: 10),
              width: 40.w,
              child: Image.asset("assets/appicon.png")),
          SizedBox(
            height: 5.h,
          ),
          _menuCard(
              "Profile",
              Image.asset(
                width: 6.w,
                "assets/iconProfile.png",
                color: Color(0xff28B2FB),
              ),
              0,
              selectedSideMenu),
          _menuCard(
              "Notifications",
              myAppBarIcon2(jctrl.notifications != null
                  ? jctrl.notifications!.unReadCount ?? 0
                  : 0),
              2,
              selectedSideMenu),
          _menuCard(
              "Terms and conditions",
              Image.asset(
                width: 6.w,
                "assets/terms abd conditions.png",
                color: Color(0xff595F87),
              ),
              3,
              selectedSideMenu),
          _menuCard(
              "Subscriptions",
              Image.asset(
                width: 6.w,
                "assets/subscription.png",
                color: Color(0xff595F87),
              ),
              4,
              selectedSideMenu),
          _menuCard(
              "Share App",
              Image.asset(
                width: 6.w,
                "assets/share app.png",
                color: Color(0xff595F87),
              ),
              5,
              selectedSideMenu),
          _menuCard(
              "Help And Suppport",
              SizedBox(
                width: 6.w,
                child: Image.asset(
                  "assets/help and support.png",
                  color: Color(0xff595F87),
                ),
              ),
              6,
              selectedSideMenu),
          Expanded(child: Container()),
          InkWell(
              onTap: () {
                navigatorKey.currentState!.closeDrawer();
                showDialog(
                    context: context,
                    builder: (ctx) => Container(
                        alignment: Alignment.center,
                        child: Material(
                            color: Colors.transparent,
                            child: LogoutAlertDialog())));
                // SharedPreferences preferences =
                //     await SharedPreferences.getInstance();
                // preferences.setString("STATUS", "OUT");
                // Fluttertoast.showToast(msg: "Logout succesfully");
                // Get.offAll(LoginScreen(), transition: Transition.rightToLeft);
              },
              child: Image.asset("assets/logout.png")),
          SizedBox(
            height: 10,
          ),
          Container(width: 30.71.w, child: Image.asset("assets/footer.png")),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  _menuCard(String title, Widget prefix, int value, int current) {
    return InkWell(
      onTap: () async {
        // Get.back();
        navigatorKey.currentState!.closeDrawer();
        notifier.value++;
        if (value == 6) {
          launchUrl(Uri.parse("https://Wa.me/+971521815687"),
              mode: LaunchMode.externalApplication);
        }
        if (value == 4) selectedSideMenu = value;
        if (value == 3)
          Get.to(() => PrivacyPolicyScreen(),
              transition: Transition.rightToLeft);
        if (value == 2)
          Get.to(() => NotificationScreen(),
              transition: Transition.rightToLeft);
        if (value == 5) {
          final result = await Share.share(
              'Discover Opportunities at Your Fingertips  https://play.google.com/store/apps/details?id=com.nakkra.jobjet');
        }
      },
      child: Container(
        height: 6.7.h,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color:
                (value == current) ? Color(0xff1C255D).withOpacity(.8) : null),
        child: Row(
          children: [
            prefix,
            SizedBox(
              width: 7.w,
            ),
            Text(
              "$title",
              style: GoogleFonts.poppins(
                  fontSize: 11.66.sp,
                  fontWeight: FontWeight.w500,
                  color: (value == current)
                      ? Colors.white
                      : Colors.white.withOpacity(.5)),
            )
          ],
        ),
      ),
    );
  }
}
