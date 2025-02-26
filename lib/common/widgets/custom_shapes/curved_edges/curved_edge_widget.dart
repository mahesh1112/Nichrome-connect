import 'package:flutter/material.dart';
import 'package:nichrome_test/common/widgets/custom_shapes/curved_edges/curved_edges.dart';

class XCurvedEdgesWidget extends StatelessWidget {
  const XCurvedEdgesWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: XCustomCurvedEdges(),
      child: child,
    );
  }
}