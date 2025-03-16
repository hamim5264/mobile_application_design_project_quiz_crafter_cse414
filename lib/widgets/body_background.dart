import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_application_design_project_quiz_crafter/data/utilities/assets_path.dart';

class BodyBackground extends StatelessWidget {
  final Widget child;

  const BodyBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            AssetsPath.appBackground,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
        ),
        Positioned.fill(
          child: child,
        ),
      ],
    );
  }
}
