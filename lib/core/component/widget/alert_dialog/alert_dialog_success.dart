import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';
import '../button/elevated_circular_icon_button.dart';

class AlertDialogSuccess extends StatelessWidget {
  final String text;
  final Color? textColor;
  final String? fontFamily;
  final String? buttonText;
  final bool? locale = false;

  const AlertDialogSuccess(
      {Key? key,
      required this.text,
      this.buttonText,
      this.textColor,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        text,
        style:
            TextStyle(color: textColor ?? Colors.black, fontFamily: fontFamily),
      ),
      title: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 50,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedCircularIconButton(
                label: Align(
                    alignment: Alignment.center,
                    child: Text(
                      buttonText ?? '',
                      style: TextStyle(fontFamily: fontFamily, fontSize: 20),
                      textAlign: TextAlign.center,
                    )),
                color: Colors.green,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
