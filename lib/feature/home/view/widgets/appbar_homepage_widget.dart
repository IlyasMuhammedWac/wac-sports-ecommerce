import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';

class AppbarHomepageWidget extends StatelessWidget {
  const AppbarHomepageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      child: Row(
        children: [
          Text(
            "Cartiko",
            style: FontPalette.blackBold.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
              fontSize: 25,
            ),
          ),
          10.horizontalSpace,
          Flexible(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.searchScreen);
              },
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onSecondary),
                  borderRadius: AppConstants.borderRadius10,
                ),
                child: Row(
                  children: [
                    10.horizontalSpace,
                    const Icon(Icons.search),
                    5.horizontalSpace,
                    const Text("Search here..."),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
