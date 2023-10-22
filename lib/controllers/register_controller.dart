import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/widgets/app_dialog.dart';
import 'package:weather_app/widgets/app_snackbar.dart';

import '../route/named_route.dart';

class RegisterController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  late GlobalKey<FormState> formKey;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    super.onInit();

    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  goToLoginScreen() {
    Get.offNamed(NamedRoute.login);
  }

  register() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      final bool? isValid = formKey.currentState?.validate();

      if (isValid ?? false) {
        AppDialog.showLoadingDialog();
        await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Get.back(closeOverlays: true);
        AppSnackbar.showSuccessInfo('User successfully created');
        goToLoginScreen();
      }
    } on FirebaseAuthException catch (e) {
      Get.back(closeOverlays: true);
      AppSnackbar.showErrorInfo(e.code);
    } catch (e) {
      Get.back(closeOverlays: true);
      AppSnackbar.showErrorInfo('Something went wrong');
    }
  }
}
