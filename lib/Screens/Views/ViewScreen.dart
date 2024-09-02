import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/PlanSelection/PlanSelectionScreen.dart';
import 'package:jobjet/Screens/UserProfile/UserProfileScreen.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/components/CategoryView.dart';
import 'package:jobjet/Screens/Views/components/FavoratieView.dart';
import 'package:jobjet/Screens/Views/components/Searchbar.dart';
import 'package:jobjet/Screens/Views/components/Sidebar.dart';
import 'package:jobjet/Screens/Views/components/ViewDetailCard.dart';
import 'package:jobjet/Screens/Views/components/shimmerLoading.dart';
import 'package:jobjet/utlis/ExitPopUp.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

ValueNotifier notifer = ValueNotifier(10);
int selectedBottomindex = 0;
final GlobalKey<ScaffoldState> navigatorKey = GlobalKey();

class ViewScreen extends StatefulWidget {
  ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  startListerner() {
    print("run");
    notifer.addListener(() {
      print("updated");
      setState(() {});
    });
  }

  JobController jctrl = Get.put(JobController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startListerner();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(builder: (_) {
      return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (selectedBottomindex != 0) {
            setState(() {
              selectedBottomindex = 0;
            });
          } else {
            showDialog(
                context: context,
                builder: (ctx) => Container(
                    alignment: Alignment.center,
                    child: Material(
                        color: Colors.transparent, child: ExitPopUp())));
          }
        },
        child: Scaffold(
            key: navigatorKey,
            drawer: SideBar(
              notifier: notifer,
            ),
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                selectedBottomindex = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 18.5.w,
                      height: 7.7.w,
                      child: Image.asset(
                        (selectedBottomindex == 0)
                            ? "assets/BShome.png"
                            : "assets/Bhome.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 18.5.w,
                      height: 7.7.w,
                      child: Image.asset(
                        (selectedBottomindex == 1)
                            ? "assets/bSfavorite.png"
                            : "assets/bfavorite.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 18.5.w,
                      height: 7.7.w,
                      child: Image.asset(
                        (selectedBottomindex == 2)
                            ? "assets/bScategory.png"
                            : "assets/bcategory.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 18.5.w,
                      height: 7.7.w,
                      child: Image.asset(
                        (selectedBottomindex == 3)
                            ? "assets/bScategories.png"
                            : "assets/bcategories.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ""),
                BottomNavigationBarItem(
                    icon: SizedBox(
                      width: 18.5.w,
                      height: 7.7.w,
                      child: Image.asset(
                        (selectedBottomindex == 4)
                            ? "assets/bSaccount.png"
                            : "assets/baccount.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    label: ""),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (selectedBottomindex == 0 && selectedSideMenu != 4)
                  GetBuilder<JobController>(builder: (_) {
                    return Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          SearchScreen(),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 0.67.h,
                                ),
                                if (!_.loading)
                                  if (_.JobList.isNotEmpty)
                                    for (var data in _.JobList)
                                      ViewDetailCard(
                                        jobData: data,
                                      )
                                  else
                                    Container(
                                      height: 80.h,
                                      alignment: Alignment.center,
                                      child: Text("No Post",
                                          style: GoogleFonts.poppins(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFF121B54))),
                                    ),
                                if (_.loading)
                                  Column(
                                    children: [
                                      for (var data in [1, 2, 3, 4, 5])
                                        ShimmerLoadingHomeCard()
                                    ],
                                  )
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  }),
                if (selectedBottomindex == 0 && selectedSideMenu == 4)
                  Expanded(child: PlanSelectionScreen()),
                if (selectedBottomindex == 3)
                  Expanded(
                    child: Container(
                        width: 100.w,
                        height: 70.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.2.w, vertical: 4.2.w),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 88.42.w,
                                  height: 62.11.h,
                                  child: Image.asset("assets/createCV.png")),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              InkWell(
                                onTap: () {
                                  launchUrl(Uri.parse("tel:+91 755 805 6805"));
                                },
                                child: Container(
                                  width: 80.42.w,
                                  height: 6.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff1F41BA)),
                                  child: Text(
                                    "Contact US",
                                    style: GoogleFonts.poppins(
                                        fontSize: 11.66.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                if (selectedBottomindex == 4)
                  Expanded(child: UserProfileScreen()),
                if (selectedBottomindex == 1) Expanded(child: FavoriteView()),
                if (selectedBottomindex == 2) Expanded(child: CategoryView())
              ],
            )),
      );
    });
  }
}
