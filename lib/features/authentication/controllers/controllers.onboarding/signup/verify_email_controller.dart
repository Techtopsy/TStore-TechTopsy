import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success-screens/success.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/popups/loaders.dart';


class VerifyEmailController extends GetxController{
  static  VerifyEmailController get instance => Get.find();

  //send email whenever verify screen appears and set timer  for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAtoRedirect();
    checkEmailVerificationStatus();
    super.onInit();
  }

  ///Send email verification link
  sendEmailVerification () async{
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Email Send' , message: 'Please check your inbox or spam and verify email');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap Verify Email !!!' , message: e.toString());
    }
  }

  ///timer to automatically
  setTimerForAtoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
     await FirebaseAuth.instance.currentUser?.reload();
     final user = FirebaseAuth.instance.currentUser;
     if (user?.emailVerified ?? false) {
      timer.cancel();
      Get.off(
        ()=> SuccessScreen(
          image: TImages.staticSuccessIllustration, 
          title: TTexts.yourAccountCreatedTitle, 
          subTitle: TTexts.yourAccountCreatedSubTitle,
          onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
          )
        );
      }
    });
  }

  ///manual check email
  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified) {
     Get.off(()=> SuccessScreen(
        image: TImages.staticSuccessIllustration, 
        title: TTexts.yourAccountCreatedTitle, 
        subTitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
        )
      );
    }
  }
}