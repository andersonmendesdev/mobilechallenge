import 'package:flutter/material.dart';

import '../../../../core/images/images_assets.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key, this.width, this.heigth}) : super(key: key);

  final double? width;
  final double? heigth;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      logoPharmainc,
      filterQuality: FilterQuality.medium,
      width: width,
      height: heigth,
    );
  }
}
