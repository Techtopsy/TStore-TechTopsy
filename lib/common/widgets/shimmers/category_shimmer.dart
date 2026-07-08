import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer.dart';
import 'package:t_store/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              TShimmerEffect(width: 55, height: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),

              /// Text
              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ), // ListView.separated
    );
  }
}
