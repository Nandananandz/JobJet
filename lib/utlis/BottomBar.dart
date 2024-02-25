import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(1.h),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("assets/home.png", width: 10.w, height: 4.h),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/iconhome.png",
                width: 10.w, height: 4.h),
            label: "Data",
          ),
          BottomNavigationBarItem(
            icon:
                Image.asset("assets/wallet.png", width: 10.w, height: 4.h),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/homeicon.png",
                width: 10.w, height: 4.h),
            label: "Profile",
          ),
        ],
        iconSize: 1,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {},
      ),
    );
  }
}
