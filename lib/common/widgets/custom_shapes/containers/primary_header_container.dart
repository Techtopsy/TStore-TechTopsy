import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:t_store/common/widgets/custom_shapes/curved/curved_edges_widgets.dart';
import 'package:t_store/utils/constants/colors.dart';

class TprimaryHeaderContainer extends StatelessWidget {
  const TprimaryHeaderContainer({
    super.key,
    required this.child,
    this.height = 400,
  });

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularContainer(
                  backgroundColor: TColors.textWhite.withValues(alpha: 0.1),
                ),
              ),
              child,
            ],
          ), // Stack
        ), // SizedBox
      ),
    );
  }
}
