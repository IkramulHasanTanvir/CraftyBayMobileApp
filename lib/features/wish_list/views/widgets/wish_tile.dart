import 'package:crafty_bay/features/wish_list/models/wish_list_model.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';

class WishTile extends StatelessWidget {
  const WishTile({
    super.key, required this.wishListData,
  });

  final WishListData wishListData;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: SizedBox(
        width: 140,
        child: Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.12),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Image.network(
                  wishListData.product?.photos?.first ?? '',
                  width: 140,
                  height: 90,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      wishListData.product?.title ?? '',
                      maxLines: 1,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${wishListData.product?.currentPrice ?? ''}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
