import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/core/constants/app_constants.dart';

class SlidableBannerWidget extends StatefulWidget {
  const SlidableBannerWidget({
    super.key,
  });

  @override
  State<SlidableBannerWidget> createState() => _SlidableBannerWidgetState();
}

class _SlidableBannerWidgetState extends State<SlidableBannerWidget> {
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
