import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../data/repositories/user/user_repository.dart';
import '../../../../../../../utils/constants/image_strings.dart';
import '../../../../../../../utils/helpers/network_manager.dart';
import '../../../../../../../utils/popups/full_screen_loader.dart';
import '../../../../../../../utils/popups/loaders.dart';
import '../../../../../controllers/user_controller.dart';
import '../../../profile.dart';

/// Controller to manage user-related functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          "we are updating your information...", TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value - FIXED: use copyWith
      userController.user.value = userController.user.value.copyWith(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
      );

      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to Previous Screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: 'Oh Snap Update Name !!!', message: e.toString());
    }
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }
}
