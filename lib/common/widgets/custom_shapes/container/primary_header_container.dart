import 'package:flutter/material.dart';
import 'package:nichrome_test/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:nichrome_test/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:nichrome_test/utils/constants/colors.dart';

class XPrimaryHeaderContainer extends StatelessWidget {
  const XPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return XCurvedEdgesWidget(
      child: Container(
        color: XColors.primary,

        /// -- [size.isFinite': is not true] Error -> Read README.md file at [DESIGN ERRORS] # 1
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(top: -150, right: -250, child: XCircularContainer(backgroundColor: XColors.textWhite.withOpacity(0.1)),),
            Positioned(top: 100, right: 300, child: XCircularContainer(backgroundColor: XColors.textWhite.withOpacity(0.1)),),
            child,
          ],
        ),
      ),
    );
  }
}