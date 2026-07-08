import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageUploading.value
                          ? const TShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : TCircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TProfileMenu(
                onPressed: () => Get.off(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              TProfileMenu(
                onPressed: () {},
                title: controller.user.value.phoneNumber,
                value: '+234 80 2949 1521',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '08 June, 1988',
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
