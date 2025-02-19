import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/app/utils/assets_paths.dart';
import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/home/controller/slider_list_controller.dart';
import 'package:crafty_bay/features/home/views/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/home/views/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/views/widgets/home_section_header.dart';
import 'package:crafty_bay/features/home/views/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              ProductSearchBar(
                controller: _searchBarController,
              ),
              const SizedBox(height: 16),
              GetBuilder<SliderListController>(
                builder: (controller) {
                  if (controller.inProgress) {
                    return const SizedBox(
                      height: 180,
                      child: CustomAppLoading(),
                    );
                  }
                  return HomeCarouselSlider(
                    sliderList: controller.sliderList,
                  );
                },
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'Category',
                onTap: () {
                  Get.find<BottomNavController>().moveToCategory();
                },
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'Popular',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'Special',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [],
                ),
              ),
              const SizedBox(height: 16),
              HomeSectionHeader(
                title: 'New',
                onTap: () {},
              ),
              const SizedBox(height: 8),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.logoNav),
      actions: [
        AppBarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}