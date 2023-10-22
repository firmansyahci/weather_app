import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:weather_app/widgets/app_dialog.dart';

import '../route/named_route.dart';
import '../widgets/app_snackbar.dart';

class VerifyController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  late OtpFieldController otpController;

  String? otpCode;
  String? phoneNumber;
  String? verificationId;
  int? resendToken;

  @override
  void onInit() {
    super.onInit();

    final List<dynamic> arguments = Get.arguments as List<dynamic>;

    phoneNumber = arguments[0];
    verificationId = arguments[1];
    resendToken = arguments[2];

    otpController = OtpFieldController();
  }

  goToWeatherScreen() {
    Get.offAllNamed(NamedRoute.weather);
  }

  otpInput(String value) {
    otpCode = value;
  }

  verifyOTPCode() async {
    try {
      AppDialog.showLoadingDialog();
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: otpCode ?? '',
      );

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
