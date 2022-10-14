import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/core/constant/design/color_constant.dart';

class ProgressFadingCircle extends StatelessWidget {
  const ProgressFadingCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: SpinKitFadingCircle(
            color: ColorConstants.instance.customBlueColor,
          ),
        ));
  }
}
