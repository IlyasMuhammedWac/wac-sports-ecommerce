import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';

class ViewAllWidget extends StatelessWidget {
  const ViewAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Text(
            "View all",
            style: FontPalette.blackRegular.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 12.sp,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 12.r,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}
