import 'dart:convert';

import 'package:engagespot_sdk/engagespot_sdk.dart';
import 'package:engagespot_sdk/models/Notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/Views/components/NoPlanpopUp.dart';
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
  bool loading = false;
  String selectedSort = "All Jobs";

  bool isAppOpen = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController Resume = TextEditingController();
  TextEditingController jobtype = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController currentJobTitle = TextEditingController();

  TextEditingController Csort = TextEditingController();
  TextEditingController Lsort = TextEditingController();
  TextEditingController Esort = TextEditingController();
  TextEditingController Ssort = TextEditingController();
  TextEditingController Jsort = TextEditingController();
  TextEditingController Tsort = TextEditingController();

  fetchJobs({String sort = "All Jobs", String search = ""}) async {
    String params = "";
    if (sort == "All Jobs") sort = "";
    if (search != "") params = params + "&search=$search";
    print(baseUrl +
        "jobs/subscribed?date_filter=${sort.replaceAll(" ", "-")}" +
        params);
    loading = true;
    update();
    final Response = await get(
        Uri.parse(
          baseUrl + "jobs/subscribed?date_filter=$sort" + params,
        ),
        headers: AuthHeader);
    loading = false;
    update();
    print(Response.body);
    print(Response.statusCode);
    if (Response.statusCode == 200) {
      JobList = json.decode(Response.body)["data"];
      update();

      // if (sort == "desc")
      //   JobList.sort((a, b) => b["created_at"].compareTo(a["created_at"]));
    }

    if (!isAppOpen) {
      isAppOpen = true;
      await Future.delayed(Duration(seconds: 2));
      noSubscriptionPopUp();
      update();
    }
  }

  fetchSortJob({String search = ""}) async {
    String params = "";
    String sort = selectedSort.toString().toLowerCase();
    if (Csort.text.isNotEmpty) {
      params = params + "&" + "categories=${Csort.text}";
    }
    if (Lsort.text.isNotEmpty) {
      params = params + "&" + "location=${Lsort.text}";
    }
    if (Esort.text.isNotEmpty) {
      params = params + "&" + "experience_required=${Esort.text}";
    }
    if (Ssort.text.isNotEmpty) {
      params = params + "&" + "salary=${Ssort.text}";
    }
    if (Jsort.text.isNotEmpty) {
      params = params + "&" + "joining_time=${Jsort.text.replaceAll(" ", "-")}";
    }
    if (sort == "all jobs") sort = "";
    if (search != "") params = params + "&search=$search";
    loading = true;
    update();
    print(baseUrl + "jobs/subscribed?date_filter=$sort" + params);
    final Response = await get(
        Uri.parse(
          baseUrl +
              "jobs/subscribed?date_filter=${sort.replaceAll(" ", "-")}" +
              params,
        ),
        headers: AuthHeader);
    loading = false;
    update();

    if (Response.statusCode == 200) {
      JobList = json.decode(Response.body)["data"];
      update();

      // if (sort == "desc")
      //   JobList.sort((a, b) => b["created_at"].compareTo(a["created_at"]));
    }
  }

  bool checkInFavorite(int id) {
    for (var data in profileData["favourites"]) {
      if (data["id"] == id) {
        return true;
      }
    }
    return false;
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
      if (data["id"] == id) {
        return data["name"];
      }
    }
    return "--";
  }

  loadCategory() async {
    final Response =
        await get(Uri.parse(baseUrl + "categories?limit=40"), headers: {
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
    final Response = await get(Uri.parse(baseUrl + "locations?limit=40"), headers: {
      'Content-Type': 'application/json',
      "Authorization": "Bearer $token",
      "Vary": "Accept"
    });

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      fullLocation = js;
      for (var data in fullLocation) {
        locationNameList.add(data["name"]);
      }
    }
  }

  List locationNameList = [];

  fetchProfile() async {
    print(AuthHeader);
    final Response =
        await get(Uri.parse(baseUrl + "auth/profile"), headers: AuthHeader);
    print(Response.body);
    if (Response.statusCode == 200) {
      profileData = json.decode(Response.body);
      print(profileData["id"]);
      Engagespot.LoginUser(userId: profileData["id"]);
      update();

      loadNotification();
    }
  }

  NotificationSet? notifications;
  loadNotification() async {
    print("Notifications");
    notifications = await Engagespot.getNotifications();

    Engagespot.ListernMessage(onMessage: (message) {
      notifications!.notificationMessage!.insert(0, message);
      notifications!.unReadCount = notifications!.unReadCount! + 1;
      update();
    }, onReadAll: () {
      notifications!.unReadCount = 0;
      update();
    });
  }

  bool isProfileUpdateLoad = false;
  updateProfile() async {
    isProfileUpdateLoad = true;
    print("updating profile");
    update();
    final Response = await post(Uri.parse(baseUrl + "users/profile/update"),
        headers: AuthHeader,
        body: json.encode({
          "full_name": nameController.text,
          "industry": jobtype.text,
          "total_experience": experience.text,
          "job_category": category.text,
          "current_job_position": currentJobTitle.text,
          "resume": {"url": Resume.text, "thumnail": "www.example.com"}
        }));
    isProfileUpdateLoad = false;
    update();
    // print(json.encode({
    //   "full_name": nameController.text,
    //   "industry": jobtype.text,
    //   "total_experience": experience.text,
    //   "job_category": category.text,
    //   "current_job_position": currentJobTitle.text,
    //   "resume": {"url": Resume.text, "thumnail": "www.example.com"}
    // }));
    print(Response.statusCode);
    print(Response.body);
    if (Response.statusCode == 200) {
      Get.back();
      Fluttertoast.showToast(msg: "Profile Updated");
      fetchProfile();
    }
  }

  noSubscriptionPopUp() {
    if (DateTime.now().isAfter(
        DateTime.parse(profileData["user_subscriptions"][0]["end_date"]))) {
      Get.dialog(NoPlanPopUp());
    }
  }

  bool checkInSubscription(int id) {
    for (var data in profileData["user_subscriptions"]) {
      if (data["subscription_id"] == id) {
        if (DateTime.parse(data["end_date"]).isAfter(DateTime.now())) {
          return true;
        } else {
          false;
        }
        break;
      }
    }
    return false;
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
