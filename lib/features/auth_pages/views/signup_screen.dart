import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/features/auth_pages/controller/sing_up_controller.dart';
import 'package:crafty_bay/features/auth_pages/models/sing_up_params.dart';
import 'package:crafty_bay/features/auth_pages/views/widgets/app_logo_widget.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SingUpController _singUpController = Get.find<SingUpController>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Column(
            children: [
              SizedBox(height: 60.h),
              LogoAndTitleWidget(
                width: 80.w,
                height: 80.h,
                title: 'Sign Up',
                subtitle: 'Create a new account',
              ),
              SizedBox(height: 24.h),
              _buildForm(),
              GetBuilder<SingUpController>(builder: (controller) {
                if (controller.inProgress) {
                  return const CustomAppLoading();
                }
                return ElevatedButton(
                  onPressed: _signUp,
                  child: const Text('Sign Up'),
                );
              }),
              SizedBox(height: 16.h),
              RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.grey.shade900,
                      fontWeight: FontWeight.w600,
                    ),
                    text: 'Already created? ',
                    children: [
                      TextSpan(
                          style: const TextStyle(
                            color: primaryColor,
                          ),
                          text: 'Sign In',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, RouteName.loginScreen);
                            }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _emailTEController,
              decoration: const InputDecoration(hintText: 'Email'),
              validator:
                  EmailValidator(errorText: 'Enter your valid email').call),
          SizedBox(height: 8.h),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _firstNameTEController,
              decoration: const InputDecoration(hintText: 'First Name'),
              validator:
                  RequiredValidator(errorText: 'Enter your first name').call),
          SizedBox(height: 8.h),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _lastNameTEController,
              decoration: const InputDecoration(hintText: 'Last Name'),
              validator:
                  RequiredValidator(errorText: 'Enter your last name').call),
          SizedBox(height: 8.h),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _cityTEController,
              decoration: const InputDecoration(hintText: 'City'),
              validator:
                  RequiredValidator(errorText: 'Enter your city name').call),
          SizedBox(height: 8.h),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: _passwordTEController,
              decoration: const InputDecoration(hintText: 'Password'),
              validator: MinLengthValidator(6,
                      errorText: 'password minimum 6 character')
                  .call),
          SizedBox(height: 8.h),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _mobileTEController,
            keyboardType: TextInputType.phone,
            maxLength: 11,
            decoration: const InputDecoration(hintText: 'Mobile'),
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return 'Enter your mobile number';
              }
              if (RegExp(r'^01[3-9]\d{8}$').hasMatch(value!) == false) {
                return 'Enter valid mobile number';
              }
              return null;
            },
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      final params = SingUpParams(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        phone: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
      );

      bool success = await _singUpController.signUp(params);
      if (success && mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context,
            RouteName.otpScreen,
            arguments: _emailTEController.text.trim(),
            (_) => false);
        Get.snackbar('Success', _singUpController.successMgs);
      } else {
        Get.snackbar('failed', _singUpController.errorMgs);
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
