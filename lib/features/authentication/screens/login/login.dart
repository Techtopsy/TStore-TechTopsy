import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/string_extensions.dart';

import 'package:t_store/common/styles/spacing_styles.dart';
import 'package:t_store/common/widgets/widget_login_form/form_divider.dart';
import 'package:t_store/common/widgets/widget_login_form/social_button.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:t_store/features/authentication/screens/login/widgets/login_header.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/helpers/helper_functions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              TloginHeader(dark: dark), // Column

              /// Form
              const TloginForm(), // Column, Form

              TFormDivider(
                  dark: dark, dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Footer
              const TsocialButtons() // Row
            ],
          ), // Column
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
