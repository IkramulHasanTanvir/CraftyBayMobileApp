import 'package:crafty_bay/features/auth_pages/controller/login_controller.dart';
import 'package:crafty_bay/features/auth_pages/controller/otp_verify_controller.dart';
import 'package:crafty_bay/features/auth_pages/controller/sing_up_controller.dart';
import 'package:get/get.dart';

class AppInitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(SingUpController());
    Get.put(OtpVerifyController());
  }

}