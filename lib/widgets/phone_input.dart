import 'package:flutter/material.dart';
import 'package:weather_app/utils/app_utils.dart';
import 'package:weather_app/widgets/app_button.dart';
import 'package:weather_app/widgets/app_text_field.dart';

class PhoneInput extends StatelessWidget {
  final TextEditingController? controller;
  final Key? formKey;
  final VoidCallback? onPressed;

  const PhoneInput({this.controller, this.formKey, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Sign in with your phone number',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Text('+62'),
              const SizedBox(width: 12),
              Expanded(
                child: Form(
                  key: formKey,
                  child: AppTextField(
                    hintText: '812 456 789',
                    textInputType: TextInputType.number,
                    controller: controller,
                    validator: AppUtils.validatePhoneNumber,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          AppButton(
            title: 'Sign in',
            onPreesed: onPressed,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
