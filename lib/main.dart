import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobjet/Screens/HomeScreen/Component/HomeViewScreen.dart';
import 'package:jobjet/dashboard.dart';
import 'package:sizer/sizer.dart';

double width = 4.14;
double height = 8.9;
double fontsize = 1.2;
void main() {
  runApp(JobJet());
}

class JobJet extends StatelessWidget {
  const JobJet({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, Orientation, DeviceType) {
      return GetMaterialApp(
        home: HomeViewScreen(),
      );
    });
  }
}
