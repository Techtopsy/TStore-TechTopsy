import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/widget_login_form/form_divider.dart';
import 'package:t_store/common/widgets/widget_login_form/social_button.dart';
import 'package:t_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Form
              TSignUpForm(dark: dark), // Form

              const SizedBox(height: TSizes.spaceBtwSections),

              /// Divider
              TFormDivider(dark: dark, dividerText: TTexts.orSignUpWith),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Social Buttons
              const TsocialButtons(),
            ],
          ),
        ), // Padding
      ), // SingleChildScrollView
    ); // Scaffold
  }
}
