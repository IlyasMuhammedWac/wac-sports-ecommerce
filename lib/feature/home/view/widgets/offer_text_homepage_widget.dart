import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/font_palette.dart';

class OfferTextHomePageWidget extends StatefulWidget {
  const OfferTextHomePageWidget({super.key});

  @override
  OfferTextHomePageWidgetState createState() =>
      OfferTextHomePageWidgetState();
}

class OfferTextHomePageWidgetState extends State<OfferTextHomePageWidget> {
  final List<String> _offers = [
    "Upto 50% off",
    "Limited Time Offer",
    "Mega Sale Now On",
    "Extra Discount Today"
  ];

  int _currentOfferIndex = 0;
  late Timer _offerTimer;

  @override
  void initState() {
    super.initState();
    _offerTimer = Timer.periodic(const Duration(seconds: 3), (_) {
      setState(() {
        _currentOfferIndex = (_currentOfferIndex + 1) % _offers.length;
      });
    });
  }

  @override
  void dispose() {
    _offerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(
          color: Theme.of(context).colorScheme.onSecondary,
        ),
      ),
      child: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: Text(
            _offers[_currentOfferIndex],
            key: ValueKey<int>(_currentOfferIndex),
            style: FontPalette.whiteMedium.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
