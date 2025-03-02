import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/cart/controller/cart_controller.dart';
import 'package:crafty_bay/features/cart/views/widgets/card_tile_widget.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GetBuilder<CartController>(
                  builder: (controller) {
                    return ListView.builder(
                      itemCount: controller.cartList.length,
                      itemBuilder: (context, index) {
                        return   CartProductItemWidget(cardData: controller.cartList[index]);
                      },
                    );
                  }
              ),
            ),
            _buildPriceAndCheckoutSection(textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckoutSection(TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: primaryColor.withOpacity(0.15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              GetBuilder<CartController>(
                builder: (controller) {
                  double totalPrice = controller.cartList.fold(
                    0,
                        (sum, item) => sum + (item.product?.currentPrice ?? 0),
                  );

                  return Text(
                    '\$${totalPrice.toStringAsFixed(2)}', // Formatting for better readability
                    style: const TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Checkout'),
            ),
          )
        ],
      ),
    );
  }

  void _onPop() {
    Get.find<BottomNavController>().moveToHome();
  }
}