import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleBannerWidget extends StatelessWidget {
  const SingleBannerWidget({super.key, this.image});
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(image ??
                  "https://img.pikbest.com/origin/10/01/82/867pIkbEsTAIq.png!w700wp"),
              fit: BoxFit.cover)),
    );
  }
}
