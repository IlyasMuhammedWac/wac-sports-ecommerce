import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/feature/category/view/category_screen.dart';
import 'package:wac_sports/feature/home/view/widgets/view_all_button_widget.dart';

class ProductListWithTitle extends StatelessWidget {
  const ProductListWithTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 305.h,
      width: double.maxFinite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
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
            height: 260.h,
            width: double.maxFinite,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: listOfProducts.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? 10 : 0,
                  right: index == listOfProducts.length - 1 ? 10 : 0,
                ),
                child: ProductCardWidget(
                  product: listOfProducts[index],
                  size: const Size(180, 200),
                ),
              ),
              separatorBuilder: (context, index) => 10.horizontalSpace,
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SizedBox(
              //     height: 140.h,
              //     width: 155.w,
              //     child: Stack(
              //       children: [
              //         // Product Image
              //         Positioned(
              //           top: 0,
              //           left: 0,
              //           right: 0,
              //           child: Container(
              //             height: 145.h,
              //             decoration: BoxDecoration(
              //               image: DecorationImage(
              //                 image:
              //                     NetworkImage(listOfProducts[index].thumbnail),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         ),
              //         // Product Details
              //         Positioned(
              //           top: 155.h,
              //           left: 8,
              //           right: 8,
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               // Product Name
              //               Text(
              //                 listOfProducts[index].title,
              //                 style: TextStyle(
              //                   fontSize: 16,
              //                   fontWeight: FontWeight.bold,
              //                   color: context.textColor,
              //                 ),
              //                 maxLines: 1,
              //                 overflow: TextOverflow.ellipsis,
              //               ),

              //               const SizedBox(height: 4),

              //               // Price
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Text(
              //                     'INR ${listOfProducts.elementAt(index).price}',
              //                     style: TextStyle(
              //                       fontSize: 14,
              //                       color: context.textColor,
              //                       fontWeight: FontWeight.w600,
              //                     ),
              //                   ),
              //                   Row(
              //                     children: [
              //                       Icon(Icons.star,
              //                           size: 13.r, color: context.green),
              //                       2.horizontalSpace,
              //                       const Text("4.5"),
              //                     ],
              //                   )
              //                 ],
              //               ),

              //               const SizedBox(height: 4),
              //             ],
              //           ),
              //         ),
              //         const Positioned(
              //           top: 5,
              //           right: 5,
              //           child: FavoriteIconButton(),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
