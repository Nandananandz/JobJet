import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:jobjet/utlis/convertCurrency.dart';
import 'package:lit_relative_date_time/controller/relative_date_format.dart';
import 'package:lit_relative_date_time/model/relative_date_time.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCardScreen extends StatefulWidget {
  var planData;
  int index;
  PlanCardScreen({super.key, required this.planData, required this.index});

  @override
  State<PlanCardScreen> createState() => _PlanCardScreenState();
}

class _PlanCardScreenState extends State<PlanCardScreen> {
  List<Color> cardColorsList = [
    Color(0xff28B2FB),
    Color(0xff6CB93E),
    Color(0xffFF8A00)
  ];

  bool loading = false;
  JobController ctrl = Get.put(JobController());
  String releativeTime(String time, BuildContext context) {
    DateTime otherTime = DateTime.parse(time);

    if (otherTime.isAfter(DateTime.now())) {
      RelativeDateTime _relativeDateTime =
          RelativeDateTime(dateTime: DateTime.now(), other: otherTime);
      RelativeDateFormat _relativeDateFormatter = RelativeDateFormat(
        Localizations.localeOf(context),
      );
      return _relativeDateFormatter.format(_relativeDateTime);
    }

    return "0 Days";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (releativeTime(ctrl.profileData["user_subscriptions"][0]["end_date"],
                context) !=
            "0 Days") {
          showDialog(
              context: context,
              builder: (ctx) => Container(
                  alignment: Alignment.center,
                  child: Material(
                      color: Colors.transparent,
                      child: AlreadyPurchasedialog())));
        } else if (!ctrl.checkInSubscription(widget.planData["id"])) {
          showDialog(
              context: context,
              builder: (ctx) => Container(
                    alignment: Alignment.center,
                    child: LoadingAnimationWidget.discreteCircle(
                        color: Color(0xff1F41BA), size: 30),
                  ));
          final Response = await post(
              Uri.parse(baseUrl + "checkout/razorpay/order/generate"),
              headers: AuthHeader,
              body: json.encode({"subscription_id": widget.planData["id"]}));
          print(ctrl.profileData);
          if (Response.statusCode == 200) {
            var data = json.decode(Response.body);

            Razorpay razorpay = Razorpay();

            var options = {
              'key': (true)
                  ? "rzp_test_w2K3h5VhCWb5aq"
                  : 'rzp_live_Krw5ZVvhAlE3Hs',
              'order_id': data["payment_gateway_order_id"],
              'prefill': {
                'contact': ctrl.profileData["mobile"],
                'email': ctrl.profileData["email"] ?? "test@gmail.com"
              }
            };

            razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
            razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
            razorpay.open(options);
          } else {
            Fluttertoast.showToast(msg: "Payment Failed, Contact admin");
            Navigator.pop(context);
          }
        } else {
          Fluttertoast.showToast(msg: "This subscription is already added");
        }
      },
      child: Container(
        height: 12.35.h,
        width: 85.w,
        padding: EdgeInsets.symmetric(horizontal: 4.2.w),
        margin: EdgeInsets.only(top: 1.9.h),
        decoration: BoxDecoration(
            border: ctrl.checkInSubscription(widget.planData["id"])
                ? Border.all(color: Color(0xff00C47D), width: 2)
                : null,
            color: ctrl.checkInSubscription(widget.planData["id"])
                ? Colors.white
                : Color.fromRGBO(232, 236, 255, 1),
            borderRadius: BorderRadius.circular(1.44.w)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${convertCurrency()}${double.parse(widget.planData["price"]).toInt()} - ${widget.planData["interval"]}',
                    style: GoogleFonts.poppins(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                ),
                Container(
                  height: 3.37.h,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: (widget.planData["is_trial"] == 1)
                          ? null
                          : cardColorsList[widget.index % 3],
                      borderRadius: BorderRadius.circular(1.44.w)),
                  margin: EdgeInsets.only(bottom: 1.h),
                  child: Text(
                    widget.planData["plan"],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 9.83.sp,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.14.w,
            ),
            Container(
              width: 100.w,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 1.8.w),
              child: Text(
                "Unlimited job alerts and Easy apply",
                style: GoogleFonts.poppins(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(29, 29, 29, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlreadyPurchasedialog() {
    return Container(
      width: 91.w,
      height: 36.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  backgroundColor: Color(0xffE8ECFF), child: Icon(Icons.close)),
            ),
          ),
          Positioned(
              //  width: 27.w,
              top: 3.7.h,
              left: 31.57.w,
              right: 31.57.w,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/logout_pop.png"))),
          Positioned(
              left: 15,
              right: 15,
              top: 17.76.h,
              child: Text(
                "You are already subscribed to the basic plan. Do you want to proceed with the new plan?",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )),
          Positioned(
              left: 10,
              right: 10,
              top: 25.76.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).pop();
                      showDialog(
                          context: context,
                          builder: (ctx) => Container(
                                alignment: Alignment.center,
                                child: LoadingAnimationWidget.discreteCircle(
                                    color: Color(0xff1F41BA), size: 30),
                              ));
                      final Response = await post(
                          Uri.parse(
                              baseUrl + "checkout/razorpay/order/generate"),
                          headers: AuthHeader,
                          body: json.encode(
                              {"subscription_id": widget.planData["id"]}));
                      print(ctrl.profileData);
                      if (Response.statusCode == 200) {
                        var data = json.decode(Response.body);

                        Razorpay razorpay = Razorpay();

                        var options = {
                          'key': (true)
                              ? "rzp_test_w2K3h5VhCWb5aq"
                              : 'rzp_live_Krw5ZVvhAlE3Hs',
                          'order_id': data["payment_gateway_order_id"],
                          'prefill': {
                            'contact': ctrl.profileData["mobile"],
                            'email':
                                ctrl.profileData["email"] ?? "test@gmail.com"
                          }
                        };

                        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                            _handlePaymentSuccess);
                        razorpay.on(
                            Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                        razorpay.open(options);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Payment Failed, Contact admin");
                        Navigator.pop(context);
                      }
                      // Navigator.pop(context);
                      // SharedPreferences preferences =
                      //     await SharedPreferences.getInstance();
                      // preferences.setString("STATUS", "OUT");
                      // Fluttertoast.showToast(msg: "Logout succesfully");
                      // Get.offAll(LoginScreen(),
                      //     transition: Transition.rightToLeft);
                    },
                    child: Container(
                      width: 28.89.w,
                      height: 5.7.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Color(0xff1F41BA))),
                      child: Text(
                        "Yes",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 28.89.w,
                      height: 5.7.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xff1F41BA),
                          border: Border.all(color: Color(0xff1F41BA))),
                      child: Text(
                        "No",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print(response.data);
    print("body");
    final Response =
        await post(Uri.parse(baseUrl + "checkout/razorpay/order/verify"),
            headers: AuthHeader,
            body: json.encode({
              "payment_order_id": response.orderId,
              "payment_id": response.paymentId,
              "payment_signature": response.signature
            }));
    print(Response.statusCode);
    print(Response.body);
    if (Response.statusCode == 200) {
      Fluttertoast.showToast(msg: "Plan activated successfully ");
      Navigator.of(context).pop();
      ctrl.fetchProfile();
      ctrl.fetchJobs();
    }

    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment Failed");
    Navigator.of(context).pop();
    // Do something when payment fails
  }
}
