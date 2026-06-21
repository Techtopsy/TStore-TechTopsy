 import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart'; // Adjust this path to match your project structure if needed

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    left: TSizes.defaultSpace,
    bottom: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}