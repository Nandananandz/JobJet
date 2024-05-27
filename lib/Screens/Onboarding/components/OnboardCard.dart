//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:jobjet/Screens/HomeScreen/HomScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:jobjet/Screens/Onboarding/Service/controller.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/main.dart';
import 'package:jobjet/misc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

class OnboardCard extends StatefulWidget {
  var planData;
  int index;
  OnboardCard({super.key, required this.planData, required this.index});

  @override
  State<OnboardCard> createState() => _OnboardCardState();
}

class _OnboardCardState extends State<OnboardCard> {
  List<Color> cardColorsList = [
    Color(0xff28B2FB),
    Color(0xff6CB93E),
    Color(0xffFF8A00)
  ];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.76.h,
      width: 80.28.w,
      //  margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFF1C255D).withOpacity(.8),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            //height: 3.247.h,
            //width: 29.29.w,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: (widget.planData["is_trial"] == 1)
                    ? null
                    : cardColorsList[widget.index % 3]),
            child: Text(widget.planData["plan"],
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(255, 255, 255, 1))),
          ),
          SizedBox(height: 5.05.h),
          SizedBox(
            //height: 2.24..h,
            //width: 25.36.w,
            child: Text(
              "\$${widget.planData["price"]}",
              style: GoogleFonts.poppins(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          SizedBox(height: 5.28.h),
          SizedBox(
            // height: 30.85.h,
            //width: 20.11.w,
            child: Text(
                "For ${widget.planData["interval_count"]} ${widget.planData["interval"]}",
                style: GoogleFonts.poppins(
                    fontSize: 13.66,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 1))),
          ),
          SizedBox(height: 3.28.h),
          Container(
            // height: 30.85.h,
            margin: EdgeInsets.symmetric(horizontal: 4.2.w),
            // width: 59.66.w,
            child: Text("${widget.planData["description"]}",
                textAlign: TextAlign.center,
                style: GoogleFonts.nunitoSans(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(123, 136, 179, 1))),
          ),
          SizedBox(
            height: 4.07.h,
          ),
          InkWell(
            onTap: () async {
              //     Get.to(() => LoginScreen(), transition: Transition.rightToLeft);
              //  Get.to(() => ViewScreen(), transition: Transition.rightToLeft);

              //   final
              setState(() {
                loading = true;
              });
              if (widget.planData["is_trial"] != 1) {
                final Response = await post(
                    Uri.parse(baseUrl + "checkout/create-payment-intent"),
                    headers: AuthHeader,
                    body: json
                        .encode({"subscription_id": widget.planData["id"]}));

                if (Response.statusCode == 200) {
                  var data = json.decode(Response.body);

                  Razorpay razorpay = Razorpay();
                  var options = {
                    'key': 'rzp_test_5T0Juz5yCdvc5U',
                    'order_id': data["payment_gateway_order_id"]
                  };
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
                  razorpay.open(options);

                  //   try {
                  //     var gpay = PaymentSheetGooglePay(
                  //       merchantCountryCode: "IN",
                  //       currencyCode: "IND",
                  //     );

                  //     await Stripe.instance.initPaymentSheet(
                  //         paymentSheetParameters: SetupPaymentSheetParameters(
                  //       paymentIntentClientSecret: data["message"]
                  //           ["client_secret"],
                  //       style: ThemeMode.light,
                  //       merchantDisplayName: data["full_name"] ?? "user",
                  //       googlePay: gpay,
                  //     ));
                  //     print(data);
                  //     await Stripe.instance.presentPaymentSheet();

                  //     loading = false;
                  //     Fluttertoast.showToast(
                  //         msg: "Payment successful\nPlan activating");

                  //     final submit = await post(
                  //         Uri.parse(baseUrl + "checkout/subscribe"),
                  //         headers: AuthHeader,
                  //         body: json.encode({
                  //           "payment_intent_id": data["messaga"]["payment_intent"]
                  //         }));

                  //     if (Response.statusCode == 200) {
                  //       Fluttertoast.showToast(
                  //           msg: "Plan activated successfully ");

                  //       Get.off(() => ViewScreen());
                  //     } else {
                  //       Fluttertoast.showToast(msg: "Plan activation Failed");
                  //     }
                  //   } catch (e) {
                  //     Fluttertoast.showToast(
                  //         msg: 'Please retry your payment failed');
                  //     setState(() {
                  //       loading = false;
                  //     });
                  //     print(e.toString());
                  //   }
                } else {
                  loading = false;
                  setState(() {});
                  Fluttertoast.showToast(msg: "Payment Failed, Contact admin");
                }
              } else {
                final Response = await post(
                    Uri.parse(baseUrl + "checkout/subscribe/trial"),
                    headers: AuthHeader);
                print(Response.body);
                if (Response.statusCode == 200) {
                  Fluttertoast.showToast(
                      msg: "Trail Plan Activation is succesfull");

                  setState(() {
                    loading = false;
                  });

                  Get.off(() => ViewScreen());
                } else {
                  setState(() {
                    loading = false;
                    Fluttertoast.showToast(msg: "Plan Activation is failed");
                  });
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(31, 65, 186, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 6.4.h,
              width: 69.31.w,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.5),
                child: (loading)
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white, size: 24)
                    : Text(
                        (widget.planData["is_trial"] != 1)
                            ? "Choose Plan"
                            : "Start free Trial",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 13.33.sp,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 255, 255, 1))),
              ),
            ),
          ),
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
      setState(() {
        loading = false;
      });

      Get.off(() => ViewScreen());
    } else {
      setState(() {
        loading = false;
        Fluttertoast.showToast(msg: "Plan Activation is failed");
      });
    }

    // Do something when payment succeeds
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    setState(() {
      loading = false;
    });
    Fluttertoast.showToast(msg: "Payment Failed");

    // Do something when payment fails
  }
}
