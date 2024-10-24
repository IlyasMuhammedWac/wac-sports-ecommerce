import 'package:flutter/material.dart';
import 'package:wac_sports/config/styles/color_palette.dart';
import 'package:wac_sports/feature/account/view/account_screen.dart';
import 'package:wac_sports/feature/cart/view/cart_screen.dart';
import 'package:wac_sports/feature/home/view/home_screen.dart';
import 'package:wac_sports/feature/wishlist/view/wishlist_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

ValueNotifier<int> indexChanteNotifier = ValueNotifier(0);

class _LandingScreenState extends State<LandingScreen> {
  List pages = [
    const HomeScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: indexChanteNotifier,
            builder: (context, value, child) => pages[value]),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChanteNotifier,
        builder: (context, value, child) {
          return BottomNavigationBar(
              currentIndex: value,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: ColorPalette.primaryContainer,
              onTap: (tappedIndex) {
                indexChanteNotifier.value = tappedIndex;
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_grocery_store), label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Wishlist'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle_sharp), label: 'Account'),
              ]);
        });
  }
}
