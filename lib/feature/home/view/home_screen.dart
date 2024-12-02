import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/feature/home/view/widgets/appbar_homepage_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/category_row_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/offer_text_homepage_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/product_list_with_title.dart';
import 'package:wac_sports/feature/home/view/widgets/single_banner_widget.dart';
import 'package:wac_sports/feature/home/view/widgets/slidable_banner_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppbarHomepageWidget(),
            10.verticalSpace,
            const OfferTextHomePageWidget(),
            const SlidableBannerWidget(),
            10.verticalSpace,
            const CategoryRowWidget(),
            10.verticalSpace,
            const ProductListWithTitle(title: "New arrivals"),
            const SingleBannerWidget(),
            10.verticalSpace,
            const ProductListWithTitle(title: "Best seller"),
          ],
        ),
      ),
    );
  }
}
