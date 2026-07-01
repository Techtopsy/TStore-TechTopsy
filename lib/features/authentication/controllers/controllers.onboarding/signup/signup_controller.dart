import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/authentication_repository.dart';
import 'package:t_store/features/personalization/model/user_model.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// -- Variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController(); // email input
  final lastName = TextEditingController(); // last name input
  final username = TextEditingController(); // username input
  final password = TextEditingController(); // password input
  final firstName = TextEditingController(); // first name input
  final phoneNumber = TextEditingController(); // phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Form key for form validation

  /// -- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          "we are processing your information...", TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accept Privacy Policy",
          message:
              "In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.",
        );
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(
          title: "Congratulations",
          message: "Your account has been created! Verify email to continue.");

      // Move to Verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }
}
