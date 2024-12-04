import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/core/extension/context.dart';
import 'package:wac_sports/feature/home/view/widgets/favorite_icon_button_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.product,
    this.size,
  });

  final Product product;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size?.height,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 10.r,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(product.thumbnail),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Product Details
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    Text(
                      product.title,
                      style: FontPalette.blackMedium.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4.h),

                    // Price and Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'INR ${product.price}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: context.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 12.r,
                              color: context.green,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: context.textColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Favorite Icon
          Positioned(
            top: 10.h,
            right: 10.w,
            child: const FavoriteIconButton(),
          ),
        ],
      ),
    );
  }
}
