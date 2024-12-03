import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/core/extension/context.dart';
import 'package:wac_sports/feature/category/view/widgets/filter_sort_compare_bar_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/favorite_icon_button_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/single_banner_widget.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel category;
  const CategoryScreen({super.key, required this.category});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const FilterSortCompareBar(products: []),
            0.5.verticalSpace,
            SingleBannerWidget(image: widget.category.image),
            _buildGridView()
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.category.title,
        style: FontPalette.blackMedium.copyWith(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleSpacing: 0,
      surfaceTintColor: Colors.transparent,
      actions: [
        InkWell(onTap: () {}, child: const Icon(Icons.local_grocery_store)),
        10.horizontalSpace,
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(2),
      shrinkWrap: true,
      itemCount: listOfProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 0.69,
      ),
      itemBuilder: (context, index) {
        return ProductCardWidget(
          product: listOfProducts[index],
        );
      },
    );
  }
}

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
