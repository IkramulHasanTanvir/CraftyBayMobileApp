import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/app/utils/assets_paths.dart';
import 'package:crafty_bay/common/category_item_widget.dart';
import 'package:crafty_bay/common/product_item_widget.dart';
import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/category/controller/category_controller.dart';
import 'package:crafty_bay/features/home/controller/slider_list_controller.dart';
import 'package:crafty_bay/features/home/views/widgets/app_bar_icon_button.dart';
import 'package:crafty_bay/features/home/views/widgets/home_carousel_slider.dart';
import 'package:crafty_bay/features/home/views/widgets/home_section_header.dart';
import 'package:crafty_bay/features/home/views/widgets/product_search_bar.dart';
import 'package:crafty_bay/features/products/controller/product_controller.dart';
import 'package:crafty_bay/routes/route_name.dart';
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
              GetBuilder<CategoryController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CustomAppLoading();
                }

                final filteredCategories = controller.categoryList
                    .where((category) =>
                category.title != 'Popular')
                    .toList();

                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredCategories.length, // Use filtered list length
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryItemWidget(
                          categoriesData: filteredCategories[index], // Use filtered list
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              RouteName.productScreen,
                              arguments: {
                                'categoryName': filteredCategories[index].title ?? '',
                                'categoryId': filteredCategories[index].sId ?? ''
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(height: 8),
              const HomeSectionHeader(
                title: 'Popular Products',
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: GetBuilder<ProductController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CustomAppLoading();
                  }

                  final popularProducts = controller.productList
                      .where((product) => product.categories!
                          .any((category) => category.title == 'Popular'))
                      .toList();

                  if (popularProducts.isEmpty) {
                    return const Center(
                        child: Text('No popular products available'));
                  }
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularProducts.length,
                    itemBuilder: (context, index) {
                      return ProductItemWidget(
                        productModel: popularProducts[index],
                      );
                    },
                  );
                }),
              ),
              const SizedBox(height: 8),
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
