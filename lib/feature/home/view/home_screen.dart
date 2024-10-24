import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/config/styles/font_palette.dart';
import 'package:wac_sports/feature/home/view/widgets/appbar_homepage_widget.dart';

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
            const BannerHomePageWidget(),
            10.verticalSpace,
            const OfferBannerHomePageWidget(),
            10.verticalSpace,
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.r),
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundImage: NetworkImage(list[index]),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              height: 290.h,
              width: double.maxFinite,
              color: Colors.amber,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        Text("New arrivals",
                            style: FontPalette.blackMedium.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 16.sp,
                            )),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "View all",
                            style: FontPalette.blackRegular.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 240.h,
                    width: double.maxFinite,
                    child: ListView.builder(                                                                              
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 160.h,
                          width: 170.w,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OfferBannerHomePageWidget extends StatelessWidget {
  const OfferBannerHomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.w,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        image: const DecorationImage(
          image: NetworkImage(upto50),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class BannerHomePageWidget extends StatefulWidget {
  const BannerHomePageWidget({
    super.key,
  });

  @override
  State<BannerHomePageWidget> createState() => _BannerHomePageWidgetState();
}

class _BannerHomePageWidgetState extends State<BannerHomePageWidget> {
  late PageController _pageController;
  late Timer _timer;
  @override
  void initState() {
    _pageController = PageController();
    _startAnimation();
    super.initState();
  }

  _startAnimation() async {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        if (_pageController.hasClients) {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        }
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.w,
      width: double.maxFinite,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index) {
          final cIndex = index % list.length;
          return Container(
            height: 210.w,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(list[cIndex]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

final list = [
  bannerImage,
  upto50,
  bannerImage,
  upto50,
];

const bannerImage =
    "https://templates.simplified.co/thumb/1f4ddfc2-fd55-43f9-8c8a-3be7277d5828.jpg";
const upto50 =
    "https://static.vecteezy.com/system/resources/thumbnails/008/077/586/small_2x/up-to-50-percent-off-golden-text-video.jpg";
