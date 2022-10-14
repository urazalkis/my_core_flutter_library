import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';
import '/core/constant/design/color_constant.dart';
import '/core/extension/context_extension.dart';

class AlertDialogDetail extends StatelessWidget {
  final String text;
  final List<Widget> items;

  const AlertDialogDetail({Key? key, required this.text, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        text,
        style: TextStyle(color: ColorConstants.instance.customBlueColor),
      ),
      shape: OutlineInputBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      content: SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: RawScrollbar(
          radius: const Radius.circular(20),
          thumbColor: ColorConstants.instance.customBlueColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: items,
            ),
          ),
        ),
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_return,
            color: ColorConstants.instance.customBlueColor,
          ),
          label: const Text('Çık'),
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(color: ColorConstants.instance.customBlueColor))),
        )
      ],
    );
  }
}
