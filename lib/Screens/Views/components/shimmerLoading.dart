import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ShimmerLoadingHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 3.4.w, right: 3.4.w),
        width: 99.27.w,
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3.h),
            Row(
              children: [
                // Profile image shimmer
                Container(
                  height: 12.36.w,
                  width: 12.36.w,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 2.89.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Job title shimmer
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          height: 2.5.h,
                          width: 40.w,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        children: [
                          // Posted date shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 2.h,
                              width: 30.w,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 3.86.w),
                          // Location icon shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Icon(
                              Icons.location_on_rounded,
                              color: Colors.grey,
                              size: 12,
                            ),
                          ),
                          SizedBox(width: 2.w),
                          // Location text shimmer
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: 2.h,
                              width: 20.w,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // More options icon shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 2.35.h),
            // Content shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 10.h,
                width: double.infinity,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 2.h),
            // Image carousel shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                height: 41.46.h,
                width: 99.27.w,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
