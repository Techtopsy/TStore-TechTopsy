import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/app_bar/app_bar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _profileToggle = false;
  @override
  Widget build(BuildContext context) {
    // final controller = UserController.instance;
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
                    const TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () => Get.off(() => const ChangeName()),
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
                value: 'TechTopsy LTD',
                // controller.user.value.fullName
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'Techtopsy123',
                // controller.user.value.username
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
                value: 'TS0002X3Q',
                // controller.user.value.username
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'dashboard001@techtopsy.com',
                // controller.user.value.email
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                // controller.user.value.phoneNumber
                value: '+1 737 210 1630',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '08 Jun, 1988',
              ),

              const Divider(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TextButton(
                  onPressed: () {},
                  // controller.user.value.phoneNumber
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
