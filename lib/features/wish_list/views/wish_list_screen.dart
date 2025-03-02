import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/features/wish_list/controller/wish_list_controller.dart';
import 'package:crafty_bay/features/wish_list/views/widgets/wish_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish'),
      ),
      body: GetBuilder<WishListController>(builder: (controller) {
        if (controller.inProgress) {
        }
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemCount: controller.wishListData.length,
          itemBuilder: (context, index) {
            return FittedBox(
              child: WishTile(
                wishListData: controller.wishListData[index],
              ),
            );
          },
        );
      }),
    );
  }
}
