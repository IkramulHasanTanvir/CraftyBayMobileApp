import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/cart/views/cart_list_screen.dart';
import 'package:crafty_bay/features/category/controller/category_controller.dart';
import 'package:crafty_bay/features/category/views/category_list_screen.dart';
import 'package:crafty_bay/features/home/controller/slider_list_controller.dart';
import 'package:crafty_bay/features/home/views/home_screen.dart';
import 'package:crafty_bay/features/wish_list/views/wish_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
    //Get.find<CategoryController>().getCategoryList();
  }

  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryListScreen(),
    CartListScreen(),
    WishListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (bottomNavController) {
      return Scaffold(
        body: _screens[bottomNavController.selectedIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: bottomNavController.selectedIndex,
          onDestinationSelected: bottomNavController.changeIndex,
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.category), label: 'Categories'),
            NavigationDestination(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            NavigationDestination(
                icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
