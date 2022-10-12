import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';

class AlertDialogQuestion extends StatelessWidget {
  final String text;
  final Color textColor;
  final VoidCallback onpressedConfirm;

  AlertDialogQuestion(
      {Key? key,
      required this.text,
      required this.textColor,
      required this.onpressedConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
      title: const Icon(Icons.help),
      shape: RoundedRectangleBorder(
          borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      actions: [
        TextButton.icon(
          onPressed: onpressedConfirm,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
          label: const Text('İşlemi Gerçekleştir'),
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.green))),
        ),
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.red,
          ),
          label: const Text('Çık'),
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  const TextStyle(color: Colors.red))),
        )
      ],
    );
  }
}
