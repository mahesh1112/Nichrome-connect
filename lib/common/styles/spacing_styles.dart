import 'package:flutter/material.dart';
import 'package:nichrome_test/utils/constants/sizes.dart';


class XSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: XSizes.appBarHeight,
    left: XSizes.defaultSpace,
    bottom: XSizes.defaultSpace,
    right: XSizes.defaultSpace,
  );
}
