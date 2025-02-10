import 'package:crafty_bay/app/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAndTitleWidget extends StatelessWidget {
  const LogoAndTitleWidget({
    super.key,
    this.width,
    this.height,
    this.boxFit,
    required this.title,
    required this.subtitle,
  });

  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsPath.logo,
          width: width ?? 120,
          height: height ?? 120,
          fit: boxFit ?? BoxFit.scaleDown,
        ),
        SizedBox(height: 8.h),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
