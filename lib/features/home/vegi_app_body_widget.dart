import 'package:flutter/material.dart';
import 'package:vegisite/features/home/responsive_child.dart';
import 'package:vegisite/utils/responsiveLayout.dart';

class HomeScreen extends StatelessWidget {
  @override
  ResponsiveLayoutBuilder build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      responsiveBuilder: (context, isLargeScreen) =>
          isLargeScreen ? LargeChild() : SmallChild(),
    );
  }
}
