import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobjet/Screens/Views/Service/Controller.dart';
import 'package:jobjet/Screens/Views/components/CategoryPostList.dart';
import 'package:sizer/sizer.dart';

class CategoryView extends StatefulWidget {
  CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  JobController ctrl = Get.put(JobController());

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.2.w),
          child: Row(
            children: [
              Text(
                "All Job ",
                style: GoogleFonts.poppins(
                    fontSize: 17.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                    color: Color(0xff28B2FB),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 4.49.h,
          //width: 63.28.w,
          margin: EdgeInsets.symmetric(horizontal: 4.2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFFE8ECFF),
          ),
          child: TextFormField(
            controller: searchText,
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  size: 17,
                  color: Color(0xFF141F5A),
                ),
                hintText: "Search for job titles",
                isDense: true,
                hintStyle: GoogleFonts.poppins(
                    fontSize: 11.66.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF696969))),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(child: GetBuilder<JobController>(builder: (context) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4.2.w, vertical: 10),
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                crossAxisAlignment: WrapCrossAlignment.start,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                children: [
                  for (var data in ctrl.fullCategory)
                    if (data["name"]
                            .toString()
                            .toUpperCase()
                            .contains(searchText.text.toUpperCase()) ||
                        searchText.text == "")
                      InkWell(
                          onTap: () {
                            Get.to(() => CategoryPostList(
                                  CategoryData: data,
                                ));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffF3F5FF)),
                              width: 28.78.w,
                              height: 28.78.w,
                              padding: EdgeInsets.all(6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 12.36.w,
                                    width: 12.36.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child:
                                          Image.network(data["image"]["url"]),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(data["name"],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF121B54)))
                                ],
                              )))
                ],
              ),
            ),
          );
        })),
        SizedBox(
          height: 2,
        )
      ],
    );
  }
}
