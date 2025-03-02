import 'package:crafty_bay/common/models/product_model.dart';
import 'package:crafty_bay/features/category/models/caregory_model.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key, required this.categoriesData,
  });

  final CategoryData categoriesData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.12),
                borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              categoriesData.icon ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoriesData.title ?? '',
            style: const TextStyle(
                fontSize: 16,
                color: primaryColor,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
