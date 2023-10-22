import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../route/named_route.dart';
import '../widgets/app_bottom_sheet.dart';
import '../widgets/app_dialog.dart';
import '../widgets/app_snackbar.dart';
import '../widgets/phone_input.dart';

class LoginController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormState> formPhoneKey;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();

    formKey = GlobalKey<FormState>();
    formPhoneKey = GlobalKey<FormState>();

    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  goToWeatherScreen() {
    Get.offNamed(NamedRoute.weather);
  }

  goToRegisterScreen() {
    Get.offNamed(NamedRoute.register);
  }

  goToVerifyScreen(String verifyId, int? resendToken) {
    Get.toNamed(NamedRoute.verify,
        arguments: [phoneController.text, verifyId, resendToken]);
  }

  login() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      final bool? isValid = formKey.currentState?.validate();

      if (isValid ?? false) {
        AppDialog.showLoadingDialog();
        await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        Get.back(closeOverlays: true);

        goToWeatherScreen();
      }
    } on FirebaseAuthException catch (e) {
      Get.back(closeOverlays: true);
      AppSnackbar.showErrorInfo(e.code);
    } catch (e) {
      Get.back(closeOverlays: true);
      AppSnackbar.showErrorInfo('Something went wrong');
    }
  }

  signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        AppDialog.showLoadingDialog();
        await auth.signInWithCredential(credential);
        Get.back(closeOverlays: true);

        goToWeatherScreen();
      } on FirebaseAuthException catch (e) {
        Get.back(closeOverlays: true);
        AppSnackbar.showErrorInfo(e.code);
      } catch (e) {
        Get.back(closeOverlays: true);
        AppSnackbar.showErrorInfo('Something went wrong');
      }
    }
  }

  showPhoneNumberInput() {
    AppBottomSheet.show(
      PhoneInput(
        formKey: formPhoneKey,
        controller: phoneController,
        onPressed: sendOtp,
      ),
    );
  }

  sendOtp() async {
    try {
      FocusManager.instance.primaryFocus?.unfocus();
      final bool? isValid = formPhoneKey.currentState?.validate();

      if (isValid ?? false) {
        AppDialog.showLoadingDialog();

        await auth.verifyPhoneNumber(
          phoneNumber: '+62${phoneController.text}',
          verificationCompleted: (PhoneAuthCredential credential) async {
            log('Success Login');
          },
          verificationFailed: (FirebaseAuthException e) {
            Get.back(closeOverlays: true);
            AppSnackbar.showErrorInfo(e.code);
          },
          codeSent: (String verificationId, int? resendToken) {
            Get.back(closeOverlays: true);
            goToVerifyScreen(verificationId, resendToken);
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            log('TimeOut');
          },
          timeout: const Duration(seconds: 120),
        );
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
