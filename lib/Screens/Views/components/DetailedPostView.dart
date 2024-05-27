import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedPostView extends StatelessWidget {
  var jobData;
  DetailedPostView({super.key, required this.jobData});
  JobController ctrl = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.all(6),
        //   height: 62.98.h,
        width: 100.w,
        color: Color(0xFFFFFFFF),
        child: GetBuilder<JobController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
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
                ),
              ),
              Container(
                width: 100.w,
                height: 8,
                color: Colors.grey.shade300.withOpacity(.5),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.2.w),
                        child: Row(
                          children: [
                            if (jobData["categories"] != null)
                              SizedBox(
                                height: 12.36.w,
                                width: 12.36.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                      jobData["categories"][0]["image"]["url"]),
                                ),
                              ),
                            SizedBox(
                              width: 2.89.w,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    jobData["job_title"],
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 11.66.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Posted on : ${ctrl.releativeTime(jobData["created_at"], context)}',
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(0, 0, 0, 80)),
                                      ),
                                      SizedBox(
                                        width: 3.86.w,
                                      ),
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: Color(0xFF1F41BA),
                                        size: 12,
                                      ),
                                      Text(
                                        ctrl.idToLocation(jobData["id"]) ??
                                            "--:--",
                                        style: GoogleFonts.nunitoSans(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w700,
                                            color: Color.fromRGBO(0, 0, 0, 80)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                String method =
                                    ctrl.checkInFavorite(jobData["id"])
                                        ? "detach"
                                        : "attach";
                                final Response = await post(
                                    Uri.parse(
                                        baseUrl + "users/favourites/$method"),
                                    headers: AuthHeader,
                                    body: json.encode({
                                      "favourites": [jobData["id"]]
                                    }));

                                print(Response.body);
                                print(ctrl.checkInFavorite(jobData["id"]));
                                print(Response.statusCode);
                                if (!ctrl.checkInFavorite(jobData["id"])) {
                                  ctrl.profileData["favourites"].add(jobData);
                                  print(ctrl.profileData);
                                } else {
                                  //

                                  for (var data
                                      in ctrl.profileData["favourites"]) {
                                    if (data["id"] == jobData["id"]) {
                                      ctrl.profileData["favourites"]
                                          .remove(data);
                                      break;
                                    }
                                  }
                                  print(ctrl.profileData);
                                }
                                ctrl.update();
                              },
                              child: Icon(
                                (ctrl.checkInFavorite(jobData["id"]))
                                    ? Icons.favorite
                                    : Icons.favorite_border_rounded,
                                color: Colors.orange,
                                size: 25,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.2.w, vertical: 2.1.h),
                        child: Text(
                          jobData["content"], // trimLines: 4,
                          // colorClickableText: Color(0xFF000000),
                          // trimMode: TrimMode.Line,
                          // trimCollapsedText: 'see more',
                          // trimExpandedText: '..see less',
                          // moreStyle: GoogleFonts.nunitoSans(
                          //   fontSize: 10.sp,
                          //   fontWeight: FontWeight.w600,
                          //   color: Color.fromRGBO(0, 0, 0, 0.8),
                          // ),
                          // lessStyle: GoogleFonts.nunitoSans(
                          //   fontSize: 10.sp,
                          //   fontWeight: FontWeight.w600,
                          //   color: Color.fromRGBO(0, 0, 0, 0.8),
                          // ),
                          style: GoogleFonts.nunitoSans(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(0, 0, 0, 0.8)),
                        ),
                      ),
                      if (jobData["image"] != null)
                        CarouselSlider(
                          options: CarouselOptions(
                              viewportFraction: 1, autoPlay: true),
                          items: [
                            for (var data in jobData["image"])
                              Container(
                                height: 41.46.h,
                                width: 99.27.w,
                                child: Image.network(
                                  data["original"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => Container(
                              alignment: Alignment.center,
                              child: Material(
                                color: Colors.transparent,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 2.3.h),
                                  width: 90.36.w,
                                  // height: 67.h,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: CircleAvatar(
                                            child: Icon(Icons.close),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Image.asset("assets/cv.png"),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.2.w, vertical: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xffE8ECFF))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 100.w,
                                            ),
                                            Text(
                                              jobData["email"],
                                              style: GoogleFonts.nunitoSans(
                                                  fontSize: 11.66.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    "mailto:${jobData["email"]}"));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.2.w,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xff121B54)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.mail,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "  Send Mail",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.2.w, vertical: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Color(0xffE8ECFF))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 100.w,
                                            ),
                                            Text(
                                              jobData["phone"],
                                              style: GoogleFonts.nunitoSans(
                                                  fontSize: 11.66.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                launchUrl(Uri.parse(
                                                    "tel:${jobData["phone"]}"));
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 4.2.w,
                                                    vertical: 5),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Color(0xff1F41BA)),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.call,
                                                      color: Colors.white,
                                                    ),
                                                    Text(
                                                      "  Call/Message",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 10.sp,
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 5.50.h,
                    width: 74.15.w,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F41BA),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Apply Now',
                      style: GoogleFonts.poppins(
                          fontSize: 11.66.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          );
        }),
      ),
    );
  }
}
