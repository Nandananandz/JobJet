import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';

class JobController extends GetxController {
  List JobList = [];
  var fullLocation;
  var profileData;
  var fullCategory;
  List jobCategory = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController Resume = TextEditingController();
  TextEditingController jobtype = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController currentJobTitle = TextEditingController();

  fetchJobs({String sort = "desc"}) async {
    final Response = await get(
        Uri.parse(
          baseUrl + "jobs/subscribed?sort=$sort",
        ),
        headers: AuthHeader);

    print(Response.body);
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      JobList = json.decode(Response.body)["data"];
      update();

      // if (sort == "desc")
      //   JobList.sort((a, b) => b["created_at"].compareTo(a["created_at"]));
    }
  }

  String releativeTime(String time, BuildContext context) {
    DateTime otherTime = DateTime.parse(time);
    RelativeDateTime _relativeDateTime =
        RelativeDateTime(dateTime: DateTime.now(), other: otherTime);
    RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
      Localizations.localeOf(context),
    );

    return _relativeDateFormatter.format(_relativeDateTime);
  }

  String idToLocation(int id) {
    for (var data in fullLocation) {
      print(data);
      print(id);
      if (data["id"] == id) {
        return data["name"];
      }
    }
    return "--";
  }

  loadCategory() async {
    final Response = await get(Uri.parse(baseUrl + "categories"), headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
      "Vary": "Accept"
    });
    jobCategory.clear();
    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      fullCategory = js["data"];

      for (var data in fullCategory) jobCategory.add(data["name"]);
    }
  }

  loadLocation() async {
    final Response = await get(Uri.parse(baseUrl + "locations"), headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
      "Vary": "Accept"
    });

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      fullLocation = js;
    }
  }

  fetchProfile() async {
    final Response =
        await get(Uri.parse(baseUrl + "auth/profile"), headers: AuthHeader);
    print(Response.body);
    if (Response.statusCode == 200) {
      profileData = json.decode(Response.body);
      update();
    }
  }

  updateProfile() async {
    final Response = await post(Uri.parse(baseUrl + "users/profile/update/"),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
          "Vary": "Accept"
        },
        body: json.encode({
          "full_name": nameController.text,
          "industry": jobtype.text,
          "total_experience": experience.text,
          "job_category": category.text,
          "current_job_position": currentJobTitle.text,
          "resume": {"url": Resume.text, "thumnail": "www.example.com"}
        }));
    print(json.encode({
      "full_name": nameController.text,
      "industry": jobtype.text,
      "total_experience": experience.text,
      "job_category": category.text,
      "current_job_position": currentJobTitle.text,
      "resume": {"url": Resume.text, "thumnail": "www.example.com"}
    }));
    print(Response.statusCode);
    print(Response.body);
    if (Response.statusCode == 200) {
      Get.back();
      Fluttertoast.showToast(msg: "Profile Updated");
      fetchProfile();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProfile();
    fetchJobs();
    loadCategory();
    loadLocation();
  }
}
