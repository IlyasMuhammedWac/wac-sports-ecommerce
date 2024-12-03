import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/routes/routes.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/feature/home/view/widgets/custom_loader.dart';
import 'package:wac_sports/feature/home/view/widgets/view_all_button_widget.dart';

class CategoryRowWidget extends StatelessWidget {
  const CategoryRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories",
                  style: FontPalette.blackMedium.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                    fontSize: 16.sp,
                  )),
              const ViewAllWidget(),
            ],
          ),
        ),
        10.verticalSpace,
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryImages.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.categoryScreen,
                      arguments: categoryImages[index],
                    );
                  },
                  child: _buildSingleCategoryCircle(index)),
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildSingleCategoryCircle(int index) {
    return SizedBox(
      width: 80.w,
      child: Column(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.network(
                categoryImages[index].image,
                fit: BoxFit.cover,
                width: 80.r,
                height: 80.r,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const Center(
                    child: CustomLoader(),
                  );
                },
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 40.r,
                    ),
                  );
                },
              ),
            ),
          ),
          5.verticalSpace,
          Text(
            categoryImages[index].title,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
