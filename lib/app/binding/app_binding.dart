import 'package:crafty_bay/features/auth_pages/controller/login_controller.dart';
import 'package:crafty_bay/features/auth_pages/controller/otp_verify_controller.dart';
import 'package:crafty_bay/features/auth_pages/controller/sing_up_controller.dart';
import 'package:crafty_bay/features/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:crafty_bay/features/cart/controller/cart_controller.dart';
import 'package:crafty_bay/features/category/controller/category_controller.dart';
import 'package:crafty_bay/features/home/controller/slider_list_controller.dart';
import 'package:crafty_bay/features/products/controller/product_controller.dart';
import 'package:crafty_bay/features/wish_list/controller/wish_list_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SingUpController());
    Get.put(OtpVerifyController());
    Get.put(BottomNavController());
    Get.put(SliderListController());
    Get.put(CategoryController());
    Get.put(ProductController());
    Get.put(WishListController());
    Get.put(CartController());
  }
}
