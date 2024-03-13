import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/components/ViewDetailCard.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:sizer/sizer.dart';

class CategoryPostList extends StatefulWidget {
  var CategoryData;
  CategoryPostList({super.key, required this.CategoryData});

  @override
  State<CategoryPostList> createState() => _CategoryPostListState();
}

class _CategoryPostListState extends State<CategoryPostList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJobs();
  }

  List JobList = [];
  loadJobs() async {
    final Response = await get(
        Uri.parse(
          baseUrl + "jobs/subscribed?categories=${widget.CategoryData["id"]}",
        ),
        headers: AuthHeader);

    print(Response.body);
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      JobList = json.decode(Response.body)["data"];
      setState(() {});

      // if (sort == "desc")
      //   JobList.sort((a, b) => b["created_at"].compareTo(a["created_at"]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
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
              Text(
                "Jobs in ${widget.CategoryData["name"]}",
                style: GoogleFonts.poppins(
                    color: Color(0xff28B2FB),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Container(
            width: 100.w,
            height: 8,
            color: Colors.grey.shade300.withOpacity(.5),
          ),
          if (JobList.isNotEmpty)
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var data in JobList)
                    ViewDetailCard(
                      jobData: data,
                    ),
                ],
              ),
            ))
          else
            Container(
              height: 80.h,
              alignment: Alignment.center,
              child: Text("No Post",
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF121B54))),
            )
        ],
      ),
    );
  }
}
