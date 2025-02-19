import 'package:crafty_bay/app/utils/app_loading.dart';
import 'package:crafty_bay/features/auth_pages/controller/login_controller.dart';
import 'package:crafty_bay/features/auth_pages/views/widgets/app_logo_widget.dart';
import 'package:crafty_bay/routes/route_name.dart';
import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.r),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 80.h),
                const LogoAndTitleWidget(
                  title: 'Welcome Back',
                  subtitle: 'Please enter your email address',
                ),
                SizedBox(height: 24.h),
                TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    decoration:
                        const InputDecoration(hintText: 'Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator:
                        EmailValidator(errorText: 'Enter your valid email')
                            .call),
                SizedBox(height: 8.h),
                TextFormField(
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordTEController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.go,
                    validator: MinLengthValidator(6,
                            errorText: 'password minimum 6 character')
                        .call),
                SizedBox(height: 16.h),
                GetBuilder<LoginController>(builder: (controller) {
                  if (controller.inProgress) {
                    return const CustomAppLoading();
                  }
                  return ElevatedButton(
                    onPressed: _onTapNextButton,
                    child: const Text('Sign In'),
                  );
                }),
                SizedBox(height: 16.h),
                RichText(
                  text: TextSpan(
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.grey.shade900,
                        fontWeight: FontWeight.w600,
                      ),
                      text: 'Registration? ',
                      children: [
                        TextSpan(
                            style: const TextStyle(
                              color: primaryColor,
                            ),
                            text: 'Sign Up',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, RouteName.signUpScreen);
                              }),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool success = await _loginController.login(
        _emailTEController.text.trim(),
        _passwordTEController.text,
      );
      if (success && mounted) {
        Navigator.pushNamedAndRemoveUntil(
            context, RouteName.mainBottomNav, (_) => false);
      } else {
        Get.snackbar('failed', _loginController.errorMgs);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }
}
