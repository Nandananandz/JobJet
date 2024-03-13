import 'dart:convert';

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
                  if (false)
                    InkWell(
                      onTap: () async {
                        final Response = await post(
                            Uri.parse(baseUrl + "users/favourites/attach"),
                            headers: AuthHeader,
                            body: json.encode({
                              "favourites": [jobData["id"]]
                            }));

                        print(Response.body);
                        print(Response.statusCode);

                        if (Response.statusCode == 200) {
                          ctrl.fetchProfile();
                        }
                      },
                      child: Icon(
                        Icons.favorite_border_rounded,
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
                trimExpandedText: '..see less',
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
              SizedBox(
                height: 38.46.h,
                width: 100.w,
                child: Image.network(
                  jobData["image"]["url"],
                  fit: BoxFit.fill,
                ),
              )
          ],
        ),
      ),
    );
  }
}
