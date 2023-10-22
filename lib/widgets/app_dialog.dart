import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  static showLoadingDialog() {
    return Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }
}
