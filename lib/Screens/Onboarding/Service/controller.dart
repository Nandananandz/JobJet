import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/interceptors/get_modifiers.dart';
import 'package:http/http.dart';
import 'package:jobjet/main.dart';

class planController extends GetxController {
  List PlanList = [];
  loadPlans() async {
    final Response = await get(Uri.parse(baseUrl + "subscriptions/"));

    if (Response.statusCode == 200) {
      var js = json.decode(Response.body);
      PlanList = js["data"];
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    loadPlans();
  }
}
