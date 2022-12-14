import 'package:flutter/material.dart';
import 'package:flutter_my_core_library/core/constant/design/color_constant.dart';

class CircularProgressIndicatorBlue extends StatelessWidget {
  const CircularProgressIndicatorBlue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircularProgressIndicator(
            strokeWidth: 6,
            color: ColorConstants.instance.customBlueColor,
          ),
        ]),
      ],
    );
  }
}
