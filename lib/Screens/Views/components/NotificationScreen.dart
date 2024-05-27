import 'package:engagespot_sdk/engagespot_sdk.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/HomeScreen/HomScreen.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  JobController ctrl = Get.put(JobController());

  String GetRelativeTime(String time, BuildContext context) {
    //RelativeTime(context).format(DateTime.parse(time));

    String rtime = "";
    if (time != "null") {
      RelativeDateTime _relativeDateTime = RelativeDateTime(
          dateTime: DateTime.now(), other: DateTime.parse(time));
      RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
        Localizations.localeOf(context),
      );
      rtime = _relativeDateFormatter.format(_relativeDateTime);
    }
    return time == "null" ? "" : rtime;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Engagespot.markAsRead();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 3.86.w,
                        bottom: 1.46.h,
                        top: 1.23.h,
                        right: 1.46.w),
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
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  //height: 5.39.h,
                  // width: 26.32.w,

                  child: Text(
                    "  All",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff121B54)),
                  ),
                ),
                Container(
                  //height: 5.39.h,
                  //width: 26.32.w,

                  child: Text(
                    " Notifications",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.66.sp,
                        color: Color(0xff28B2FB)),
                  ),
                ),
              ],
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 4.2.w),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  if (ctrl.notifications == null ||
                      ctrl.notifications!.notificationMessage!.length == 0)
                    Container(
                      height: 50.h,
                      alignment: Alignment.center,
                      child: Text(
                        "No Notification",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 11.66.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  if (ctrl.notifications != null)
                    for (var data in ctrl.notifications!.notificationMessage!)
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff919EAB).withOpacity(.2)))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 9.55.w,
                                  height: 9.55.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        (data.icon != null && data.icon != "")
                                            ? Image.network(
                                                data.icon!,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                "assets/notification_pp.png",
                                                fit: BoxFit.cover,
                                              ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      RichText(
                                        text: new TextSpan(
                                          text: data.title,
                                          style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                              fontSize: 9.sp),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: " " + data.message!,
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 9.sp),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.w,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                              width: 3.w,
                                              child: Image.asset(
                                                  "assets/clock.png")),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            GetRelativeTime(
                                                data.createdAt.toString(),
                                                context),
                                            style: GoogleFonts.publicSans(
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff555555)),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: .5.h,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            if (false)
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 17.w, right: 4.2.w),
                                child: ReadMoreText(
                                  data.message.toString(),
                                  trimExpandedText: " show less",
                                  trimCollapsedText: " show more",
                                  moreStyle: GoogleFonts.publicSans(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 107, 115, 124)),
                                  lessStyle: GoogleFonts.publicSans(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 107, 115, 124)),
                                  style: GoogleFonts.publicSans(
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Color.fromARGB(255, 107, 115, 124)),
                                  trimLines: 2,
                                  trimMode: TrimMode.Line,
                                ),
                              ),
                            SizedBox(
                              height: 5,
                            )
                          ],
                        ),
                      ),
                ],
              )),
            ))
          ],
        ),
      ),
    );
  }
}
