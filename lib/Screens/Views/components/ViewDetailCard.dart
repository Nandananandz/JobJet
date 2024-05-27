import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/UserProfile/UserProfileScreen.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/components/DetailedPostView.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class ViewDetailCard extends StatelessWidget {
  var jobData;
  ViewDetailCard({super.key, required this.jobData});
  JobController ctrl = Get.put(JobController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailedPostView(
              jobData: jobData,
            ));
      },
      child: Container(
        // padding: EdgeInsets.all(6),
        //   height: 62.98.h,
        width: 100.w,
        margin: EdgeInsets.symmetric(vertical: 5),
        color: Color(0xFFFFFFFF),
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
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              ctrl.idToLocation(jobData["location_id"]) ??
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
                      String method = ctrl.checkInFavorite(jobData["id"])
                          ? "detach"
                          : "attach";
                      final Response = await post(
                          Uri.parse(baseUrl + "users/favourites/$method"),
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

                        for (var data in ctrl.profileData["favourites"]) {
                          if (data["id"] == jobData["id"]) {
                            ctrl.profileData["favourites"].remove(data);
                            break;
                          }
                        }
                        print(ctrl.profileData);
                      }
                      ctrl.update();

                      // if (Response.statusCode == 200) {
                      //   ctrl.fetchProfile();
                      // }
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
              padding: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 2.1.h),
              child: ReadMoreText(
                jobData["content"] ?? "",
                trimLines: 4,
                colorClickableText: Color(0xFF000000),
                trimMode: TrimMode.Line,
                trimCollapsedText: 'see more',
                trimExpandedText: '',
                moreStyle: GoogleFonts.nunitoSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                ),
                lessStyle: GoogleFonts.nunitoSans(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                ),
                style: GoogleFonts.nunitoSans(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 0, 0.8)),
              ),
            ),
            if (jobData["image"] != null)
              CarouselSlider(
                options: CarouselOptions(viewportFraction: 1, autoPlay: true),
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
    );
  }
}
