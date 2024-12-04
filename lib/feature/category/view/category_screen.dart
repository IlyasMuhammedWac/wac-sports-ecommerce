import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/core/constants/app_constants.dart';
import 'package:wac_sports/feature/category/view/widgets/filter_sort_compare_bar_widget.dart';
import 'package:wac_sports/feature/category/view/widgets/product_list_grid_view_widget.dart';
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
            const ProductsListGridView()
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
}
