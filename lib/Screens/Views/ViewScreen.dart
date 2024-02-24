import 'package:flutter/material.dart';
import 'package:jobjet/Screens/Views/components/Searchbar.dart';
import 'package:jobjet/Screens/Views/components/ViewDetailCard.dart';
import 'package:sizer/sizer.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SearchScreen(),
              SizedBox(height: 0.67.h,),
              ViewDetailCard(),
              SizedBox(height: 0.67.h,),
              ViewDetailCard()
            ],
          ),
        ],
      ),
    );
  }
}