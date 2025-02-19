import 'package:crafty_bay/features/auth_pages/views/change_pass_screen.dart';
import 'package:crafty_bay/features/auth_pages/views/forgot_email_screen.dart';
import 'package:crafty_bay/features/auth_pages/views/login_screen.dart';
import 'package:crafty_bay/features/auth_pages/views/otp_screen.dart';
import 'package:crafty_bay/features/auth_pages/views/signup_screen.dart';
import 'package:crafty_bay/features/bottom_nav/views/bottom_nav_screen.dart';
import 'package:crafty_bay/features/into_pages/views/spalsh_screen.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:flutter/material.dart';

class RoutePages {
  static const String initialRoute = RouteName.splashScreen;

  static RouteFactory? onGenerateRoute = (RouteSettings settings) {
    late Widget widget;
    if (settings.name == initialRoute) {
      widget = const SplashScreen();
    } else if (settings.name == RouteName.loginScreen) {
      widget = const LoginScreen();
    } else if (settings.name == RouteName.signUpScreen) {
      widget = const SignupScreen();
    } else if (settings.name == RouteName.forgotEmailScreen) {
      widget = const ForgotEmailScreen();
    } else if (settings.name == RouteName.otpScreen) {
      String email = settings.arguments as String;
      widget = OtpScreen(email: email);
    } else if (settings.name == RouteName.changePassScreen) {
      widget = const ChangePassScreen();
    } else if (settings.name == RouteName.mainBottomNav) {
      widget = const BottomNavScreen();
    }
    return MaterialPageRoute(
      builder: (ctx) {
        return widget;
      },
    );
  };
}
