import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/common/product_item_widget.dart';
import 'package:crafty_bay/features/products/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    super.key,
    required this.categoryName,
    required this.categoryId,
  });

  final String categoryName;
  final String categoryId;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      Get.find<ProductController>().getProductList((widget.categoryId));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: GetBuilder<ProductController>(builder: (controller) {
        if (controller.inProgress) {
          return const CustomAppLoading();
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemCount: controller.productList.length,
          itemBuilder: (context, index) {
            return FittedBox(
              child: ProductItemWidget(
                productModel: controller.productList[index],
              ),
            );
          },
        );
      }),
    );
  }
}
