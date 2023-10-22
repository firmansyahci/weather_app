import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';

import '../controllers/verify_controller.dart';
import '../widgets/app_button.dart';

class VerifyScreen extends StatelessWidget {
  final VerifyController verifyController = Get.put(VerifyController());

  VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Verify your phone number',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'We’ve sent an SMS with an activation code to your phone +62 ${verifyController.phoneNumber}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 40),
            OTPTextField(
              length: 6,
              controller: verifyController.otpController,
              onChanged: verifyController.otpInput,
            ),
            const SizedBox(height: 48),
            AppButton(
              title: 'Verify',
              onPreesed: verifyController.verifyOTPCode,
            ),
          ],
        ),
      ),
    );
  }
}
