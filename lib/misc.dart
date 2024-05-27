import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/main.dart';

var AuthHeader = {
  'Content-Type': 'application/json',
  "Authorization": "Bearer $token",
  "Vary": "Accept"
};



Widget myAppBarIcon(int notificationCount ){
return Container(
  width: 30,
  height: 30,
  child: Stack(
    children: [
      Icon(
        Icons.notifications_none_rounded,
        color: Colors.black,
        size: 30,
      ),
    if (notificationCount >0)  Container(
        width: 30,
        height: 30,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 2),
        child: Container(
          width: 15,
          height: 15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xffc32c37),
             // border: Border.all(color: Colors.white, width: 1)
              ),
          child: Text(
            notificationCount.toString(),
            style: GoogleFonts.poppins(fontWeight : FontWeight.w500 ,fontSize: 9,color : Colors.white),
          ),
        ),
      ),
    ],
  ),
);
}

Widget myAppBarIcon2(int notificationCount ){
return Container(
  width: 30,
  height: 30,
  child: Stack(
    children: [
      Icon(
        Icons.notifications_none_rounded,
        color: Colors.white.withOpacity(.3),
        size: 30,
      ),
    if (notificationCount >0)  Container(
        width: 30,
        height: 30,
        alignment: Alignment.topRight,
        margin: EdgeInsets.only(top: 2),
        child: Container(
          width: 15,
          height: 15,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff2CA6DA),
             // border: Border.all(color: Colors.white, width: 1)
              ),
          child: Text(
            notificationCount.toString(),
            style: GoogleFonts.poppins(fontWeight : FontWeight.w500 ,fontSize: 9,color : Colors.white),
          ),
        ),
      ),
    ],
  ),
);
}
