import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final Response = await post(
            Uri.parse(baseUrl + "checkout/create-payment-intent"),
            headers: AuthHeader,
            body: json.encode({"subscription_id": widget.planData["id"]}));

        if (Response.statusCode == 200) {
          var data = json.decode(Response.body);
          ;
          try {
            var gpay = PaymentSheetGooglePay(
              merchantCountryCode: "USA",
              currencyCode: "USD",
            );

            await Stripe.instance.initPaymentSheet(
                paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: data["message"]["client_secret"],
              style: ThemeMode.light,
              merchantDisplayName: data["full_name"] ?? "user",
              googlePay: gpay,
            ));
            print(data);
            await Stripe.instance.presentPaymentSheet();

            Fluttertoast.showToast(msg: "Payment successful\nPlan activating");

            final submit = await post(Uri.parse(baseUrl + "checkout/subscribe"),
                headers: AuthHeader,
                body: json.encode(
                    {"payment_intent_id": data["message"]["payment_intent"]}));
            loading = false;
            setState(() {});
            print(Response.body);
            print(Response.statusCode);
            if (Response.statusCode == 200) {
              Fluttertoast.showToast(msg: "Plan activated successfully ");
              ctrl.fetchProfile();
              setState(() {});
            } else {
              Fluttertoast.showToast(msg: "Plan activation Failed");
            }
          } catch (e) {
            Fluttertoast.showToast(msg: 'Please retry your payment failed');
            setState(() {
              loading = false;
            });
            print(e.toString());
          }
        }
      },
      child: Container(
        height: 12.35.h,
        width: 85.w,
        padding: EdgeInsets.symmetric(horizontal: 4.2.w),
        margin: EdgeInsets.only(top: 1.9.h),
        decoration: BoxDecoration(
            color: Color.fromRGBO(232, 236, 255, 1),
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
                    '${double.parse(widget.planData["price"]).toInt()}\$/${widget.planData["interval"]}',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
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
}
