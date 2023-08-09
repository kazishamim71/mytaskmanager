import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/assets_utils.dart';


class ScreenBackground extends StatelessWidget {
  final Widget child;



  const ScreenBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SvgPicture.asset(AssetsUtils.backgroundSVG,fit: BoxFit.fill),
          ),
          child
        ],
      ),
    );
  }
}
