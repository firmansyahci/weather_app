import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static showSuccessInfo(String message) {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Success',
        message: message,
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  static showErrorInfo(String message) {
    Get.showSnackbar(
      GetSnackBar(
        title: 'Error',
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
