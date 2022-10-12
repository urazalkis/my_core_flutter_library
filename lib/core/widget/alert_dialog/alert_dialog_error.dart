import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';

class AlertDialogError extends StatelessWidget {
  final String text;
  final Color? textColor;
  final String? fontFamily;
  final String? buttonText;
  final bool? locale = false;

  const AlertDialogError(
      {Key? key,
      required this.text,
      this.buttonText,
      this.textColor,
      this.fontFamily})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red,
      content: Text(
        text,
        style:
            TextStyle(color: textColor ?? Colors.white, fontFamily: fontFamily),
        textAlign: TextAlign.center,
      ),
      title: const Icon(
        Icons.error,
        color: Colors.white,
        size: 50,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      actions: [
        /*Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedCircularIconButton(
                label: Align(alignment: Alignment.center, child: Text(buttonText ?? '',style: TextStyle(fontFamily:fontFamily,fontSize: 20,color: Colors.black),textAlign: TextAlign.center,)),
                color: Colors.white,
                onPressed: (){ },
                icon: Icon(Icons.error,color: Colors.red,),
              ),
            ),
          ],
        )*/
      ],
    );
  }
}
