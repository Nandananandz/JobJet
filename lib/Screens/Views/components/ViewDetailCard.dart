import 'dart:convert';

import 'package:blur/blur.dart';
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

class ViewDetailCard extends StatefulWidget {
  var jobData;
  ViewDetailCard({super.key, required this.jobData});

  @override
  State<ViewDetailCard> createState() => _ViewDetailCardState();
}

class _ViewDetailCardState extends State<ViewDetailCard> {
  JobController ctrl = Get.put(JobController());
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailedPostView(
              jobData: widget.jobData,
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
                  if (widget.jobData["categories"] != null)
                    SizedBox(
                      height: 12.36.w,
                      width: 12.36.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                            widget.jobData["categories"][0]["image"]["url"]),
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
                          widget.jobData["job_title"],
                          style: GoogleFonts.nunitoSans(
                            fontSize: 11.66.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Posted on : ${ctrl.releativeTime(widget.jobData["created_at"], context)}',
                              style: GoogleFonts.nunitoSans(
                                  fontSize: 9.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(0, 0, 0, 80)),
                            ),
                            SizedBox(
                              width: 3.86.w,
                            ),
                            Icon(
                              Icons.location_on_rounded,
                              color: Color(0xFF1F41BA),
                              size: 10,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Expanded(
                              child: Text(
                                ctrl.idToLocation(
                                    widget.jobData["location_id"] ?? 0),
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunitoSans(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromRGBO(0, 0, 0, 80)),
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff1F41BA).withOpacity(.05)),
                          child: Text(
                            widget.jobData["status"]
                                .toString()
                                .capitalizeFirst
                                .toString(),
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 8.sp,
                              color: Color(0xff04B900),
                              fontWeight: FontWeight.w700,
                              // color: Color.fromRGBO(0, 0, 0, 80
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      String method = ctrl.checkInFavorite(widget.jobData["id"])
                          ? "detach"
                          : "attach";
                      final Response = await post(
                          Uri.parse(baseUrl + "users/favourites/$method"),
                          headers: AuthHeader,
                          body: json.encode({
                            "favourites": [widget.jobData["id"]]
                          }));

                      print(Response.body);
                      print(ctrl.checkInFavorite(widget.jobData["id"]));
                      print(Response.statusCode);
                      if (!ctrl.checkInFavorite(widget.jobData["id"])) {
                        ctrl.profileData["favourites"].add(widget.jobData);
                        print(ctrl.profileData);
                      } else {
                        //

                        for (var data in ctrl.profileData["favourites"]) {
                          if (data["id"] == widget.jobData["id"]) {
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
                      (ctrl.checkInFavorite(widget.jobData["id"]))
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
                widget.jobData["content"] ?? "",
                trimLines: 4,
                callback: (val) {
                  setState(() {
                    isExpand = true;
                  });
                },
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
            if (isExpand)
              Row(
                children: [
                  SizedBox(
                    width: 4.2.w,
                  ),
                  Icon(
                    Icons.mail,
                    size: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Blur(
                    blur: 2.5,
                    child: Text(widget.jobData["email"] ?? "",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 10.sp,
                            decorationStyle: TextDecorationStyle.double,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 0.8))),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.phone_in_talk_outlined,
                    size: 16,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Blur(
                    blur: 2.7,
                    child: Text(widget.jobData["phone"] ?? "",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 10.sp,
                            decorationStyle: TextDecorationStyle.double,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(0, 0, 0, 0.8))),
                  ),
                  SizedBox(
                    width: 4.2.w,
                  )
                ],
              ),
            if (isExpand)
              SizedBox(
                height: 10,
              ),
            if (widget.jobData["image"] != null)
              if (widget.jobData["image"].length > 1)
                CarouselSlider(
                  options: CarouselOptions(viewportFraction: 1, autoPlay: true),
                  items: [
                    for (var data in widget.jobData["image"])
                      Container(
                        height: 41.46.h,
                        width: 100.w,
                        child: Image.network(
                          data["original"],
                          fit: BoxFit.contain,
                        ),
                      ),
                  ],
                )
              else
                Container(
                  height: 30.46.h,
                  width: 100.w,
                  child: Image.network(
                    widget.jobData["image"][0]["original"],
                    fit: BoxFit.contain,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
