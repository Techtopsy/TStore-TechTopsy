import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/custom_shapes/curved/curved_edges_widgets.dart';
import 'package:t_store/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.buttonPrimary.withValues(alpha: 0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
