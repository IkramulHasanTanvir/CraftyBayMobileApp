import 'package:crafty_bay/common/product_quantity_inc_dec_button.dart';
import 'package:crafty_bay/features/cart/models/card_model.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({super.key, required this.cardData});

  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 1,
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        child: Row(
          children: [
            Image.asset(
              '',width: 90,
              height: 90,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              cardData.product?.title ?? '',
                              maxLines: 1,
                              style: textTheme.bodyLarge
                                  ?.copyWith(overflow: TextOverflow.ellipsis),
                            ),
                             Row(
                              children: [
                                Text('Color: ${cardData.product?.colors?.first ?? ''}'),
                                const SizedBox(width: 8),
                                Text('Size: ${cardData.product?.sizes?.first ?? ''}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        '\$${cardData.product?.currentPrice ??''}',
                        style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      ProductQuantityIncDecButton(
                        onChange: (int noOfItem) {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
