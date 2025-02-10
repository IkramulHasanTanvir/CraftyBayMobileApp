import 'package:crafty_bay/routes/route_pages.dart';
import 'package:crafty_bay/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_,__) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutePages.initialRoute,
          onGenerateRoute: RoutePages.onGenerateRoute,
          theme: AppThemeData.lightTheme,
          darkTheme: AppThemeData.darkTheme,
          themeMode: ThemeMode.system,
        );
      }
    );
  }
}
