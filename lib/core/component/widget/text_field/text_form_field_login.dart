import 'package:flutter/material.dart';

import '/core/constant/design/border_constant.dart';
import '/core/constant/design/color_constant.dart';

class TextFormFieldLogin extends StatelessWidget {
  final TextEditingController? tfController;
  final String? hintText;
  const TextFormFieldLogin({Key? key, this.tfController, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: tfController,
      autocorrect: false,
      keyboardType: TextInputType.text,
      obscureText: false,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.account_box,
            color: ColorConstants.instance.customBlueColor),
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderConstant.instance.radiusAllCircularMedium),
      ),
      validator: (tfInput) {
        if (tfInput!.isEmpty) {
          return "Bu alanı boş bırakmayınız!";
        }
        return null;
      },
    );
  }
}
