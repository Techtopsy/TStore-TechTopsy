import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.iconSize = 72,
    this.iconPadding = TSizes.sm,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final double iconSize;
  final double iconPadding;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //circular icon
            Container(
                width: iconSize,
                height: iconSize,
                padding: EdgeInsets.all(iconPadding),
                decoration: BoxDecoration(
                  color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
                  borderRadius:
                      BorderRadius.circular(100),
                ),
                child: Center(
                  child: Image.asset(
                    image,
                    width: iconSize - (iconPadding * 2),
                    height: iconSize - (iconPadding * 2),
                    fit: BoxFit.contain,
                    color: THelperFunctions.isDarkMode(context) ? TColors.light : TColors.dark,
                  ),
                )),
                const SizedBox(height: TSizes.spaceBtwItems / 2,),
                SizedBox(
                  width: 55,
                   child: Text(
                    title, 
                    style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
                   maxLines: 1,
                   overflow: TextOverflow.ellipsis
                   )
                   )
          ],
        ),
      ),
    );
  }
}