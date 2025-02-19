import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/features/auth_pages/controller/login_controller.dart';
import 'package:crafty_bay/features/auth_pages/controller/otp_verify_controller.dart';
import 'package:crafty_bay/features/auth_pages/views/widgets/app_logo_widget.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpTEController = TextEditingController();
  final _otpVerifyController = Get.find<OtpVerifyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              SizedBox(height: 80.h),
              const LogoAndTitleWidget(
                title: 'Pin Verify',
                subtitle: 'Please enter your email pin code',
              ),
              SizedBox(height: 24.h),
              Padding(
                padding:  EdgeInsets.all(16.r),
                child: PinCodeTextField(
                  backgroundColor: Colors.transparent,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 300),
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        activeColor: primaryColor,
                        inactiveColor: primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    keyboardType: TextInputType.number,
                    appContext: context,
                    controller: _otpTEController,
                    validator:
                        MinLengthValidator(4, errorText: 'Enter your OTP').call),
              ),
              SizedBox(height: 16.h),
              GetBuilder<LoginController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CustomAppLoading();
                }
                return ElevatedButton(
                  onPressed: _onTapNextButton,
                  child: const Text('Next'),
                );
              }),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    bool success = await _otpVerifyController.otpVerify(
      widget.email,
      _otpTEController.text.trim(),
    );
    if (success && mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteName.mainBottomNav, (_) => false);
      Get.snackbar('Success', _otpVerifyController.successMgs);
    } else {
      Get.snackbar('Failed', _otpVerifyController.errorMgs);
    }
  }
}
