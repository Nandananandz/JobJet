import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobjet/Screens/HomeScreen/Component/HomeViewScreen.dart';
import 'package:jobjet/Screens/HomeScreen/HomScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/LoginScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VSucessScreen.dart';
import 'package:jobjet/Screens/LoginScreen/Component/VerificationScreen.dart';
import 'package:jobjet/Screens/Onboarding/OnboardingScreen.dart';
import 'package:jobjet/Screens/Onboarding/components/OnboardCard.dart';
import 'package:jobjet/Screens/PlanSelection/PlanSelectionScreen.dart';
import 'package:jobjet/Screens/PlanSelection/components/PlanCard.dart';
import 'package:jobjet/Screens/UserProfile/UserProfileScreen.dart';
import 'package:jobjet/Screens/UserProfile/components/CompleteProfileCard.dart';
import 'package:jobjet/Screens/UserProfile/components/ProfileViewScreen.dart';
import 'package:jobjet/Screens/UserProfile/components/UserDetailCard.dart';
import 'package:jobjet/Screens/Views/ViewScreen.dart';
import 'package:jobjet/Screens/Views/components/Searchbar.dart';
import 'package:jobjet/Screens/Views/components/ViewDetailCard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            InkWell(
              onTap: () {
                Get.to(()=>HomeViewScreen());
              },
              child: Text("homeViewscreen",style: TextStyle(color: Colors.red),
                      ),
            ),
          SizedBox(height: 2,),
           InkWell(
            onTap: () {
                Get.to(()=>HomeScreen());
              },
             child: Text("homescreen",style: TextStyle(color: Colors.red),
                     ),
           ),
          SizedBox(height: 2,),
           InkWell(
            onTap: () {
                Get.to(()=>LoginScreen());
              },
             child: Text("loginscreen",style: TextStyle(color: Colors.red),
                     ),
           ),
          SizedBox(height: 2,),
           InkWell(
            onTap: () {
                Get.to(()=>VerificationScreen());
              },
             child: Text("verificationscreen",style: TextStyle(color: Colors.red),
                     ),
           ),
          SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>VSucessScreen());
              },
             child: Text("Vsucessscreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>OnboardCardScreen());
              },
             child: Text("Onboardcard",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell
           (onTap: () {
                Get.to(()=>OnboardingScreen());
              },
             child: Text("onboardingScreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>PlanCardScreen());
              },
             child: Text("plancard",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>PlanSelectionScreen());
              },
             child: Text("planselectionscreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>CompleteProfileCard());
              },
             child: Text("completeprofilecard",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>ProfileViewScreen());
              },
             child: Text("profileviewscreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>UserDetailScreen());
              },
             child: Text("userdetailcard",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>UserProfileScreen());
              },
             child: Text("userprofilescreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>SearchScreen());
              },
             child: Text("searchbar",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>ViewDetailCard());
              },
             child: Text("viewdetailcard",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),
           
           InkWell(
            onTap: () {
                Get.to(()=>ViewScreen());
              },
             child: Text("viewscreen",style: TextStyle(color: Colors.red),
                     ),
           ),SizedBox(height: 2,),


        ],
      ),

    );
  }
}