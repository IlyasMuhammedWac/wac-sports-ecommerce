import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/feature/category/view/widgets/filter_sort_compare_bar_widget.dart';
import 'package:wac_sports/feature/category/view/widgets/product_list_grid_view_widget.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wishlist"),
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.maxFinite, 30.h),
            child: const FilterSortCompareBar(products: []),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ProductsListGridView(),
            ],
          ),
        ));
  }
}
