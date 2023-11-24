import 'package:burger/constants/colors.dart';
import 'package:burger/constants/images.dart';
import 'package:burger/providers/cart_provider.dart';
import 'package:burger/screens/category_screen.dart';
import 'package:burger/screens/profile_screen.dart';
import 'package:burger/screens/shopping_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  int currentIndex = 0;
  static const pages = [
    CategoryPage(),
    ShoppingCard(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    return Scaffold(
      backgroundColor: bgColor,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                AppImages.gridSvg,
                color: currentIndex == 0 ? mainColor : Colors.grey,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: badges.Badge(
                badgeContent: Text(cart.totalCount.toString()),
                child: SvgPicture.asset(AppImages.shoppingCard,
                    color: currentIndex == 1 ? mainColor : Colors.grey),
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(AppImages.userSvg,
                  color: currentIndex == 2 ? mainColor : Colors.grey),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
