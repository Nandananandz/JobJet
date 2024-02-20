import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobjet/dashboard.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(JobJet());
}


class JobJet extends StatelessWidget {

const JobJet({super.key});
@override
Widget build(BuildContext context){
  return Sizer(builder: (context , Orientation ,DeviceType){
    return GetMaterialApp(home: DashboardScreen(),);
  });
}

}