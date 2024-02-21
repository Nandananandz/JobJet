import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardCardScreen extends StatelessWidget {
  const OnboardCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Container(
          height: 58.76.h,
          width: 113.28.w,
          color:Color.fromRGBO(28, 37, 93, 1),margin: EdgeInsets.all(40),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(51.68),
                  child: Container(
                    height: 2.247.h,
                    width: 27.29.w,
                    child: Text("Free Trial",
                    style: TextStyle(fontSize: 24,
                    color:Color.fromRGBO(255, 255, 255, 1)
)),),
                  ),
                
              ],
            ),
          ),
),
        ),
      ],
    ); 
  }
} 