import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/common/category_item_widget.dart';
import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/category/controller/category_controller.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});


  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => _onPop(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Category list'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryController>().getCategoryList();
          },
          child: GetBuilder<CategoryController>(builder: (controller) {
            if (controller.inProgress) {
              return const CustomAppLoading();
            }

            return Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    controller: _scrollController,
                    itemCount: controller.categoryList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 16,
                    ),
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryItemWidget(
                          categoriesData: controller.categoryList[index], onTap: () {
                          Navigator.pushNamed(
                              context, RouteName.productScreen,
                              arguments: {
                                'categoryName':
                                controller.categoryList[index].title ??
                                    '',
                                'categoryId':
                                controller.categoryList[index].sId ?? ''
                              });

                        },
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: controller.inProgress,
                  child: const LinearProgressIndicator(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  void _onPop() {
    Get.find<BottomNavController>().moveToHome();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}