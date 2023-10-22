import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../utils/app_utils.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';
import '../widgets/signin_with_button.dart';

class LoginScreen extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: loginController.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 38),
              const AppTitle(
                title: 'Email address',
              ),
              AppTextField(
                hintText: 'Your Email',
                controller: loginController.emailController,
                validator: AppUtils.validateEmail,
              ),
              const SizedBox(height: 12),
              const AppTitle(
                title: 'Password',
              ),
              AppTextField(
                hintText: 'Password',
                controller: loginController.passwordController,
                obsecureText: true,
                validator: AppUtils.validatePassword,
              ),
              const SizedBox(height: 50),
              AppButton(
                title: 'Log in',
                onPreesed: loginController.login,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Divider(),
              ),
              SignInWithButton(
                title: 'Continue with google',
                logo: 'assets/images/google_logo.png',
                onPressed: loginController.signInWithGoogle,
              ),
              const SizedBox(height: 12),
              SignInWithButton(
                title: 'Continue with phone number',
                logo: 'assets/images/phone_logo.png',
                onPressed: loginController.showPhoneNumberInput,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account?',
                  ),
                  TextButton(
                    onPressed: loginController.goToRegisterScreen,
                    child: const Text('Sign up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
