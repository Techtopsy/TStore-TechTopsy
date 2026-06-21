import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key,
    required this.dark,
    required this.dividerText, // Added this required property
  });

  final bool dark;
  final String dividerText; // Declaration of the property string

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ), // Flexible
        
        Text(
          dividerText, // Displays the text passed down dynamically!
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        
        Flexible(
          child: Divider(
            color: dark ? TColors.darkGrey : TColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        ), // Flexible
      ],
    );
  }
}