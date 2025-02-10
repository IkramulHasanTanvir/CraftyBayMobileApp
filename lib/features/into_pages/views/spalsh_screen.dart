import 'dart:io';
import 'package:crafty_bay/app/utils/assets_paths.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  Future<void> _moveNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if (mounted) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.loginScreen,
        (_) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: Image.asset(AssetsPath.logo)),
            const Spacer(),
            if (Platform.isAndroid) const CircularProgressIndicator(),
            const CupertinoActivityIndicator(),
            SizedBox(height: 24.h),
            const Text('Version 1.0.1'),
          ],
        ),
      ),
    );
  }
}
