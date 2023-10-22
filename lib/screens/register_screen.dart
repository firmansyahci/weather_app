import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/register_controller.dart';
import '../utils/app_utils.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/app_title.dart';

class RegisterScreen extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: registerController.formKey,
          child: ListView(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Sign up',
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
                controller: registerController.emailController,
                validator: AppUtils.validateEmail,
              ),
              const SizedBox(height: 12),
              const AppTitle(
                title: 'Password',
              ),
              AppTextField(
                hintText: 'Password',
                controller: registerController.passwordController,
                obsecureText: true,
                validator: AppUtils.validatePassword,
              ),
              const SizedBox(height: 12),
              const AppTitle(
                title: 'Confirm Password',
              ),
              AppTextField(
                hintText: 'Confirm Password',
                controller: registerController.confirmPasswordController,
                obsecureText: true,
                validator: (value) => AppUtils.validateConfirmPassword(
                    registerController.passwordController.text, value),
              ),
              const SizedBox(height: 50),
              AppButton(
                title: 'Sign up',
                onPreesed: registerController.register,
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                  ),
                  TextButton(
                    onPressed: registerController.goToLoginScreen,
                    child: const Text('Log in'),
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
